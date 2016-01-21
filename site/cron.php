<?php
require_once('config.php');

//---------- 过期未支付订单库存回收(3个小时)
$time = time()-3600;
$orders = Orders::getList("create_time<$time AND order_status=1", 'id, order_code');	//首先在1个小时内使订单失效
$ids  = array();
foreach ($orders as $k => $order){
	$order_type = substr($order['order_code'], -2, 2);
	if('SK'!=$order_type){
		unset($orders[$k]);
		continue;
	}
	$ids[] = $order['id'];
}
$ids = implode(',', $ids);
if($ids) Orders::inUpdate("id IN ($ids)", "order_status=6");		//先把状态改成 订单取消，回滚完库存把状态改成7:订单关闭
ABase::log("Order ids in 1 hour : ".serialize($ids), 'cron_');

$time = time()-10800; 	//3小时前的订单库存回收,考虑订单生成后还差一分钟订单失效时用户点击付款，并在付款操作时又等待了2小时
$orders = Orders::getList("create_time<$time AND order_status=6", 'id,order_code');	//首先在1个小时内使订单失效
foreach ($orders as $k => $order){
	$oid = $order['id'];
	$order_code = $order['order_code'];
	$order_type = substr($order_code, -2, 2);
	if('SK'!=$order_type){
		unset($orders[$k]);
		continue;
	}
	//DB::Debug();
	$stocks = ProductsStockLock::getList("order_code='$order_code' AND status=0");
	ABase::log("Stocks in 3 hour order: ".serialize($stocks), 'cron_');
	DB::tranBegin('stock_recycle');
	foreach ($stocks as $stock){
		$sid = $stock['id'];
		$product_sku = $stock['product_sku'];
		$product_num = $stock['product_num'];
		$exp_date = $stock['exp_date'];
		ProductsStock::increase("product_sku='$product_sku' AND exp_date='$exp_date'", "stock", $product_num);
		ProductsStockLock::update($sid, array('status'=>2));
	}
	Orders::update($oid, array('order_status'=>7));
	$commit_status = DB::tranEnd('stock_recycle');
}
ABase::log("Orders in 3 hour : ".serialize($orders), 'cron_');
//---------- END 过期未支付订单库存回收




