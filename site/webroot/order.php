<?php
//订单详情
$type = isset($_REQUEST['t']) ? $_REQUEST['t'] : '';
$action = isset($_REQUEST['a']) ? $_REQUEST['a'] : '';
$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
$order_code = isset($_REQUEST['order_code']) ? $_REQUEST['order_code'] : "";
if(!$order_code){header("Location: /?order/error=001");	exit;}

if('ajax' == $type){
	switch ($action){
		case 'cancel':
			Orders::cancelOrder($order_code, $user);
			ABase::toJson(0,'ok');
			break;
		default:
			ABase::toJson(1,'action error');
	}
}else{
	$order_code = str_replace('YK', 'SK', $order_code);
	$order_code = str_replace('BH', 'SK', $order_code);
	$orders = Orders::getOne(array('order_code' => $order_code));
	$order_status = $orders['order_status'];
	
	$cancel_time = 0;
	if($order_status > 2){
		$shiped = OrdersLog::getOne(array('order_code' => $order_code, 'action' => '订单取消'), 'create_time');
		$cancel_time = isset($shiped['create_time']) ? (int) $shiped['create_time'] : 0;
	}
	$orders['cancel_time'] = $cancel_time;
	
	$shiped_time = 0;
	if($order_status > 2){
		$shiped = OrdersLog::getOne(array('order_code' => $order_code, 'action' => '已发货'), 'create_time');
		$shiped_time = isset($shiped['create_time']) ? (int) $shiped['create_time'] : 0;	
	}
	$orders['shiped_time'] = $shiped_time;
	
	$YK_orders = array();
	$yk_order_code = str_replace('SK', 'YK', $order_code);
	$YK_orders = Orders::getOne(array('order_code' => $yk_order_code));
	if($YK_orders){
		$yk_paymethodid = $YK_orders['pay_method'];
		$YK_orders['yk_pay_method'] =  PaymentMethod::getData($yk_paymethodid);
	}
	
	$BH_orders = array();
	$BH_products = array();
	$bh_order_code = str_replace('SK', 'BH', $order_code);
	$BH_orders = Orders::getOne(array('order_code' => $bh_order_code));
	if($BH_orders) $BH_products = Orders::getOrderPrducts($bh_order_code);
	
	$receiver_address_id = (int)$orders['receiver_address_id'];
	$address = ReceiverAddress::getInfo($receiver_address_id);
	
	$paymethodid = $orders['pay_method'];
	$paymethod = PaymentMethod::getData($paymethodid);
	
	$userlevel = Users::getLevel($userid);
	$discount = $userlevel['discount'];
	
	$products = Orders::getOrderPrducts($order_code);
	
	//获取order status 名称
	$statusname = OrdersStatus::getData($order_status);
	$orders['order_statusname'] = $statusname['name'];
	//var_dump($orders);

	Templates::Assign('order_code', $order_code);
	Templates::Assign('orders', $orders);
	Templates::Assign('YK_orders', $YK_orders);
	Templates::Assign('discount', $discount);
	Templates::Assign('address', $address);
	Templates::Assign('products', $products);
	Templates::Assign('BH_orders', $BH_orders);
	Templates::Assign('BH_products', $BH_products);
	Templates::Assign('paymethod', $paymethod);
	Templates::Display('order.html');
}


