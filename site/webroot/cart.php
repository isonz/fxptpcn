<?php
//购物车
$type = isset($_REQUEST['t']) ? $_REQUEST['t'] : '';
$action = isset($_REQUEST['a']) ? $_REQUEST['a'] : '';

$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
if('ajax' == $type){
	switch ($action){
		case 'add':
			$qt = isset($_POST['qt']) ? (int)$_POST['qt'] : 0;
			$sku_id = isset($_POST['sku_id']) ? (int)$_POST['sku_id'] : 0;
			if(!$qt || !$sku_id) ABase::toJson(1,'error 001');
			if(Cart::add($userid, $sku_id, $qt)) ABase::toJson(0,'ok');
			ABase::toJson(1,'error 009');
			break;
		case 'remove':
			$sku_id = isset($_POST['sku_id']) ? (int)$_POST['sku_id'] : 0;
			if($sku_id){
				if(Cart::del(0, array('user_id'=>$userid, 'sku_id'=>$sku_id))){
					ABase::toJson(0,'ok');
				}else{
					ABase::toJson(1,'error 010');
				}
			}
			ABase::toJson(1,'error 011');
			break;
		default:
			ABase::toJson(1,'action error');
	}
}else{
	$products = Cart::getProducts($userid);
	$userlevel = Users::getLevel($userid);

	Templates::Assign('userlevel', $userlevel);
	Templates::Assign('products', $products);
	Templates::Display('cart.html');
}
