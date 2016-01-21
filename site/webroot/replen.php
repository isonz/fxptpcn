<?php
//补货申请
$action = isset($_REQUEST['a']) ? $_REQUEST['a'] : '';
$order_code = isset($_REQUEST['order_code']) ? $_REQUEST['order_code'] : "";
if(!$order_code){header("Location: /?replen/error=001");	exit;}
$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;

$order = Orders::getOne(array('order_code'=>$order_code));
if(!$order){
	Templates::Assign('errormsg', "未找到对应的订单");
	Templates::Display('error.html');
	exit;
}
$order_status = isset($order['order_status']) ? (int)$order['order_status'] : 0;
if(5!=$order_status){
	Templates::Assign('errormsg', "该订单目前状态下不能申请补货，在订单完结的时候有一次申请补货机会。");
	Templates::Display('error.html');
	exit;
}
$bh_order_code = str_replace('SK', 'BH', $order_code);
$order_bh = Orders::getOne(array('order_code'=>$bh_order_code));
if($order_bh){
	$time = $order_bh['create_time'];
	$time = date('Y-m-d H:i:s', $time);
	Templates::Assign('errormsg', "订单已在 $time 补过一次货，不能再补货了。");
	Templates::Display('error.html');
	exit;
}

switch ($action){
	case 'save':
		save();
		break;
	default:
		$products = OrdersBH::getList("user='$user' AND order_code='$order_code' AND status=0");
		ProductsSku::getProductsPic($products);
		ProductsSku::getProductsItemTitle($products);
		
		//var_dump($products);exit;
		Templates::Assign('products', $products);
		Templates::Assign('productlen', count($products));
		Templates::Assign('order_code', $order_code);
		Templates::Display('replen.html');
}

function save()
{
	$ids = isset($_REQUEST['ids']) ? $_REQUEST['ids'] : array();
	$order_code = isset($_REQUEST['order_code']) ? $_REQUEST['order_code'] : '';
	$user_code = isset($_SESSION['user_code']) ? $_SESSION['user_code'] : '';
	
	$bh_order_code = str_replace('SK', 'BH', $order_code);
	$order_bh = Orders::getOne(array('order_code'=>$bh_order_code));
	if($order_bh){
		$time = $order_bh['create_time'];
		$time = date('Y-m-d H:i:s', $time);
		Templates::Assign('errormsg', "订单已在 $time 补过一次货，不能再补货了。");
		Templates::Display('error.html');
		exit;
	}
	
	$orders = Orders::getOne(array('order_code'=>$order_code, 'order_status'=>5),'id, order_status');
	$order_status = isset($orders['order_status']) ? (int)$orders['order_status'] : 0;
	if(!$orders){
		Templates::Assign('errormsg', "订单未找到，请核对该订单能补货 ,订单号： $order_code, order_status : $order_status");
		Templates::Display('error.html');
		exit;
	}

	DB::Debug();
	DB::tranBegin('replen');				//事务开始
	Orders::createBHOrder($order_code);		//生成补货订单
	foreach ($ids as $id){
		$replen = OrdersBH::getData($id);
		$qt = $replen['num'];
		$sku = $replen['sku'];
		$status = ProductsStock::outStockInsertOrderProduct($bh_order_code, $sku, $qt);
		if(!$status){
			DB::rollBack();
			Templates::Assign('errormsg', "补货保存失败，[$sku] 库存不足，错误代码 BH001");
			Templates::Display('error.html');
			exit;
		}
		OrdersBH::update($id, array('status'=>1));
	}
	$commit_status = DB::tranEnd('replen');
	header("Location: /order/?order_code=$order_code");
}


