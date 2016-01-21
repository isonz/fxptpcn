<?php
class Orders extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_orders';

	static public function publicPayOrderSignVerify()
	{
		global $REQUEST;
		$sign = isset($_POST['sign']) ? $_POST['sign'] : '';
		$payhost = isset($_POST['payhost']) ? $_POST['payhost'] : '';
		$rate = isset($REQUEST['rate']) ? floatval($REQUEST['rate']) : 1;		//付款比率，1全款，0.5半款
		$md = isset($_POST['md']) ? $_POST['md'] : '';
		if($md !== md5($sign.$payhost.$rate)) ABase::toJson(1001,"客户端验证签名错误");
		
		$decode = Func::decode($sign, _PTPPAYKEY);
		if(!$decode) ABase::toJson(1002,"客户端解密错误");
		$decode = explode('-1001-', $decode);
		
		$time = isset($decode[2]) ? (int)$decode[2] : 0;
		if(time() - $time > 36000) ABase::toJson(1003,"客户端验证超时");   //10小时请求超时
		
		$token = isset($decode[0]) ? $decode[0] : '';
		if(!$token || _PTPPAYTOKEN != $token) ABase::toJson(1004,"客户端TOKEN验证失败");
		
		$order_code = isset($decode[1]) ? $decode[1] : '';
		$paymethod_code = isset($decode[3]) ? $decode[3] : '';
		$pay_transaction_id = isset($decode[4]) ? $decode[4] : '';
		$paid = isset($decode[5]) ? $decode[5] : '';
		
		if(!$order_code) ABase::toJson(1005,"客户端获取订单号失败");
		$orders = Orders::getOne(array('order_code'=>$order_code));
		if(!$orders) ABase::toJson(1006,"客户端获取订单数据失败");
		$orders['paymethod_code'] = $paymethod_code;
		$orders['pay_transaction_id'] = $pay_transaction_id;
		$orders['paid'] = $paid;
		$orders['payRate'] = $rate;
		
		return $orders;
	}
	
	static public function createYKOrder($sk_order_code)
	{
		if(!$sk_order_code) return false;
		
		$order_code = str_replace('SK', 'YK', $sk_order_code);
		if($order_code == $sk_order_code) return false;
		$yk_order = self::getOne(array('order_code' => $order_code), 'order_code');
		if($yk_order) return $yk_order;
		
		$order = self::getOne(array('order_code' => $sk_order_code));
		if(!$order) return false;
	
		unset($order['id']);
		$order['order_code'] = $order_code;
		$order['amount'] = $order['amount'] - $order['paid'];
		$order['paid'] = 0;
		$order['order_status'] = 1;
		$order['pay_method'] = 0;
		$order['pay_transaction_id'] = null;
		$order['pay_time'] = null;
		$order['create_time'] = time();
		
		if(self::insert($order)) return $order;
		return false;
	}
	
	static public function createBHOrder($order_code)
	{
		if(!$order_code) return false;
	
		$bh_order_code = str_replace('SK', 'BH', $order_code);
		$bh_order = self::getOne(array('order_code' => $bh_order_code), 'order_code');
		if($bh_order) return $bh_order;
	
		$order = self::getOne(array('order_code' => $order_code));
		if(!$order) return false;
	
		unset($order['id']);
		$order['order_code'] = $bh_order_code;
		$order['amount'] = 0;
		$order['paid'] = 0;
		$order['order_status'] = 2;
		$order['pay_method'] = 0;
		$order['pay_transaction_id'] = null;
		$order['pay_time'] = null;
		$order['create_time'] = time();
		$order['ship_name'] = null;
		$order['ship_no'] = null;
		$order['shipping_cost'] = 0;
		
		if(self::insert($order)) return $order;
		return false;
	}
	
	static public function cancelOrder($order_code, $user)
	{
		$order_type = substr($order_code, -2, 2);
		if('SK'!=$order_type) return false;
		
		$order = Orders::getOne(array('order_code'=>$order_code),'id, order_status');
		if(1 != $order['order_status']) return false;
		$oid = $order['id'];
		
		//DB::Debug();
		$stocks = ProductsStockLock::getList("order_code='$order_code' AND status=0");
		ABase::log("Stocks in cancelOrder: ".serialize($stocks), 'cancel_order_');
		
		DB::tranBegin('Orders.cancelOrder');	//事务开始
		OrdersLog::insert(array('order_code'=>$order_code, 'ex_status'=>'取消订单', 'admin'=>$user, 'action'=>'订单取消', 'ip'=>Func::getIP(), 'create_time'=>time()));
		foreach ($stocks as $stock){
			$sid = $stock['id'];
			$product_sku = $stock['product_sku'];
			$product_num = $stock['product_num'];
			$exp_date = $stock['exp_date'];
			ProductsStock::increase("product_sku='$product_sku' AND exp_date='$exp_date'", "stock", $product_num);
			ProductsStockLock::update($sid, array('status'=>2));
		}
		Orders::update($oid, array('order_status'=>7));
		$commit_status = DB::tranEnd('Orders.cancelOrder');		
	}
	
	static public function getOrderPrducts($order_code)
	{
		if(!$order_code) return array();
		//-- 处理重复ORDER SKU, 同一个SKU有不同批号时会出现重复
		$tmp = array();
		$products = OrdersProducts::getUserProducts($order_code);
		for($i=0; $i<count($products); $i++){
			$products[$i]['outstock'][] = array('product_num'=>$products[$i]['product_num'],'exp_date'=>$products[$i]['exp_date']);
			for($j=$i+1; $j<count($products); $j++){
				if($products[$i]['sku'] == $products[$j]['sku']){
					$products[$i]['outstock'][] = array('product_num'=>$products[$j]['product_num'],'exp_date'=>$products[$j]['exp_date']);
					$tmp[$j] = $j;
				}
			}
		}
		foreach ($tmp as $k=>$v){
			if(isset($products[$k])) unset($products[$k]);
		}
		//-- END 处理重复ORDER SKU
		ProductsSku::getProductsPic($products);
		//var_dump($products);
		return $products;
	}
	
	static public function getUserOrderNum($user_code)
	{
		if(!$user_code) return 0;
		$table = self::table();
		$sql = "SELECT count(id) AS num FROM $table WHERE (RIGHT(order_code,2)='SK' OR LEFT(order_code,4)='FXAD') AND user_code='$user_code' AND order_status=5";
		$nums = DB::GetQueryResult($sql, true);
		$nums = isset($nums['num']) ? (int)$nums['num'] : 0;
		return $nums;
	}
	
}


