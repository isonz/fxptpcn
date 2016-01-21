<?php
//支付详细
$user_code = isset($_SESSION['user_code']) ? $_SESSION['user_code'] : '';
$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$order_code = isset($_REQUEST['order_code']) ? $_REQUEST['order_code'] : '';
global $REQUEST;
$rate = isset($REQUEST['rate']) ? floatval($REQUEST['rate']) : 0.5;		//付款比率，1全款，0.5半款

$redirect = 0;
$order_id = 0;
$commit_status = 0;
$locked = 0;
if(!$order_code){
	$addressid = isset($_POST['address']) ? (int)$_POST['address'] : 0;
	$sku_ids = isset($_POST['sku_ids']) ? $_POST['sku_ids'] : array();
	$token = isset($_POST['token']) ? $_POST['token'] : '';
	if(!$addressid || !$sku_ids || !$token){
		Templates::Assign('errormsg', "参数传输错误。");
		Templates::Display('error.html');
		exit;
	}
	
	if(!ABase::token($token)){
		Templates::Assign('errormsg', "请勿重复提交订单");
		Templates::Display('error.html');
		exit;
	}
	
	$device = strtoupper(str_replace(DS, '', _DEVICE));
	$order_code = "FX".$device.date('ymdHis').rand(10, 99).'SK';		//首款订单,银联支付限制订单号20位
	
	$user_level = Users::getLevel($userid);
	$discount = (float)$user_level['discount'];
	
	$total = 0.00;
	$title = '';
	foreach ($sku_ids as $sku_id => $qt){
		$qt = (int)$qt;
		if($qt<1) continue;
	
		$info = ProductsSku::getData($sku_id);
		$current_price = isset($info['current_price']) ? $info['current_price'] : 0.00;
		$item = ProductsSku::getSkuItem($info['item'], 'title');
		$title = $item['title'];
		$total = $total + ($qt*$current_price);
	}
	$len = count($sku_ids);
	if($len > 1) $title = "合并| $len 笔订单";
	$newtotal = $total * $discount;
	
	$address = ReceiverAddress::getData($addressid);
	unset($address['id']);
	$address['module_id'] = 3;
	
	//---DB::Debug();
	DB::tranBegin('pay');	//事务开始
	$address_id = ReceiverAddress::insert($address);
	$data = array(
		'order_code' 			=> $order_code,
		'user_code'				=> $user_code,
		'discount'				=> $discount,
		'amount'				=> $newtotal,
		'receiver_address_id'	=> $address_id,
		'create_time'			=> time()
	);
	$order_id = Orders::insert($data);

	foreach ($sku_ids as $sku_id => $qt){
		$product_sku = ProductsSku::getData($sku_id, 'sku');
		$product_sku = isset($product_sku['sku']) ? $product_sku['sku'] : '';
		$stocknum = ProductsStock::getSkuStock($product_sku);
		if(!$product_sku || $stocknum < $qt){
			DB::rollBack();
			Templates::Assign('errormsg', "订单保存失败，[$product_sku] 库存不足，错误代码 PY001");
			Templates::Display('error.html');
			exit;
		}
		$data = array(
			'order_code'		=> $order_code,
			'product_sku'		=> $product_sku,
			'product_num'		=> $qt
		);
		OrdersProducts::insert($data);
		Cart::clearCart($userid, $sku_id);
		
		$locked = ProductsStockLock::add($order_code, $product_sku, $qt);
		if(!$locked) break;
	}
	if(!$locked) DB::tranStop();
	$commit_status = DB::tranEnd('pay');
	//--- end tran
	
	if(!$order_id || !$commit_status){
		Templates::Assign('errormsg', "订单保存失败，[$product_sku] 库存不足，错误代码 PAY002");
		Templates::Display('error.html');
		exit;
	}
	
}else{
	$yk = isset($_GET['yk']) ? (int)$_GET['yk'] : 0;
	$user_code = isset($_SESSION['user_code']) ? $_SESSION['user_code'] : '';
	if(!$yk){
		$orders = Orders::getOne(array('order_code'=>$order_code, 'order_status'=>1),'id');	
	}else{
		$orders = Orders::getOne(array('order_code'=>$order_code, 'user_code'=>$user_code, 'order_status'=>array('<'=>5)),'id,order_status');
		$order_status = isset($orders['order_status']) ? (int)$orders['order_status'] : 0;
		if($order_status <= 1){
			$orders = null;
		}else{
			$orders = Orders::createYKOrder($order_code);
			$order_code = isset($orders['order_code']) ? $orders['order_code'] : '';
			if(!$order_code){
				Templates::Assign('errormsg', "余款订单生成失败， 请核对后再试");
				Templates::Display('error.html');
				exit;
			}
		}
	}
	if(!$orders){
		Templates::Assign('errormsg', "未获取到相应的订单，或订单已支付，或订单已过期， 请核对后再试");
		Templates::Display('error.html');
		exit;
	}
	$redirect = 1;
}

$sign = _PTPPAYTOKEN."-1001-".$order_code."-1001-".time();
$sign = Func::encode($sign, _PTPPAYKEY);
if(!$sign){
	Templates::Assign('errormsg', "加密失败，请到订单列表页面继续完成支付");
	Templates::Display('error.html');
	exit;
}

$host = $_SERVER['HTTP_HOST'];
$md = md5($sign.$host.$rate);
$payurl = _PTPPAYURL."?sign=$sign&host=$host&rate=$rate&md=$md";
if($redirect){
	header("Location: $payurl");
	exit;
}
Templates::Assign('payurl', $payurl);

$rate = 1;
$md = md5($sign.$host.$rate);
$payurl_all = _PTPPAYURL."?sign=$sign&host=$host&rate=$rate&md=$md";
Templates::Assign('payurl_all', $payurl_all);

Templates::Assign('order_code', $order_code);
Templates::Display('pay.html');


