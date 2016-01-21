<?php
$status = isset($_GET['status']) ? (int)$_GET['status'] : 0;
$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : '';
$stardate = isset($_GET['stardate']) ? $_GET['stardate'] : '';
$enddate = isset($_GET['enddate']) ? $_GET['enddate'] : '';

if($status < 0) $status = 0;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$page_size = isset($_GET['page_size']) ? (int)$_GET['page_size'] : 15;

$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$userinfo = Users::getInfo($userid);
$user_code = isset($userinfo['user_code']) ? $userinfo['user_code'] : null;
$product_num = OrdersProducts::getUserProductsNum($user_code);
$userlevel = Users::getLevel($userid);

$order = array('data'=>array(),'page'=>'');
$where0 = "(RIGHT(order_code,2)='SK' OR LEFT(order_code,4)='FXAD') AND ";
if($user_code){
	if(!$status){
		$where = $where0 . "user_code='$user_code'";
	}else{
		$where = $where0 . "user_code='$user_code' AND order_status=$status";
	}
	if($stardate && $enddate){
		$stardate = (int)strtotime($stardate);
		$enddate = (int)strtotime($enddate);
		$enddate = date('Y-m-d 23:59:59',$enddate);
		$enddate = (int)strtotime($enddate);
		if($enddate > 0 && $stardate > 0 && $enddate >= $stardate){
			$where = $where0 . "user_code='$user_code' AND create_time>=$stardate AND create_time<=$enddate";
		}
	}
	if(!$keyword){
		//DB::Debug();
		$order = Orders::paging($page, $page_size, $where, "id DESC", "*");
	}else if('bh'==$keyword){
		//DB::Debug();
		$ordertable = Orders::table();
		$orderproducttable = OrdersProducts::table();
		$sql = " SELECT a.* FROM $ordertable AS a, $orderproducttable AS b WHERE RIGHT(a.order_code,2)='BH' AND a.order_code=b.order_code AND a.user_code='$user_code' ORDER BY a.id DESC";
		$order = Paging::bySQL($sql, $page, $page_size, 'a');
	}else{
		//DB::Debug();
		$ordertable = Orders::table();
		$orderproducttable = OrdersProducts::table();
		$sql = " SELECT a.* FROM $ordertable AS a, $orderproducttable AS b WHERE (RIGHT(a.order_code,2)='SK' OR LEFT(a.order_code,4)='FXAD') AND a.order_code=b.order_code AND a.user_code='$user_code' AND (a.order_code LIKE '%$keyword%' OR b.product_sku LIKE '%$keyword%')  GROUP BY a.order_code ORDER BY a.id DESC";
		$order = Paging::bySQL($sql, $page, $page_size, 'a');
	}
	
}
$orders = $order['data'];
$paged = $order['page'];
foreach ($orders as $k => $order){
	$order_code = $order['order_code'];	
	$products = OrdersProducts::getUserProducts($order_code);

	$tmp = array();
	//获取各个PRODCUT STOCK
	$len = count($products);
	for ($i=0; $i<$len; $i++){
		if(!isset($products[$i])) continue;
		/*
		//合并相同 ITEM 的SKU 
		for ($j=$i+1; $j<$len; $j++){
			if(!isset($products[$j])) continue;
			if($products[$i]['item']===$products[$j]['item']){
				$products[$i]['outstock'][] = array('product_num'=>$products[$j]['product_num'],'exp_date'=>$products[$j]['exp_date']);
				unset($products[$j]);
			}
		}
		*/
		for($j=$i+1; $j<$len; $j++){
			if($products[$i]['sku'] == $products[$j]['sku']){
				$products[$i]['outstock'][] = array('product_num'=>$products[$j]['product_num'],'exp_date'=>$products[$j]['exp_date']);
				$tmp[$j] = $j;
			}
		}

		$products[$i]['outstock'][] = array('product_num'=>$products[$i]['product_num'],'exp_date'=>$products[$i]['exp_date']);
		unset($products[$i]['product_num'], $products[$i]['exp_date']);
	}
	foreach ($tmp as $pk=>$v){
		if(isset($products[$pk])) unset($products[$pk]);
	}
	ProductsSku::getProductsPic($products);
	$orders[$k]['products'] = $products;
	$status_name = OrdersStatus::getName($order['order_status']);
	$orders[$k]['status_name'] = $status_name;
}

if((int)$stardate>0 && (int)$enddate>0){
	$stardate = date('Y-m-d',$stardate);
	$enddate = date('Y-m-d',$enddate);
}
Templates::Assign('stardate', $stardate);
Templates::Assign('enddate', $enddate);
Templates::Assign('keyword', $keyword);
Templates::Assign('paged', $paged);
Templates::Assign('orders', $orders);
Templates::Assign('ordercount', Orders::getUserOrderNum($user_code));
Templates::Assign('status', $status);
Templates::Assign('product_num', $product_num);
Templates::Assign('userlevel', $userlevel);
Templates::Assign('userinfo', $userinfo);
Templates::Display('orderList.html');

