<?php
//立即支付
$userstatus = isset($_SESSION['userstatus']) ? (int)$_SESSION['userstatus'] : 0;
if(!$userstatus){header("Location: /sign/?a=bccl"); exit;}

$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$product_ids = isset($_POST['product_ids']) ? $_POST['product_ids'] : array();
$qts = isset($_POST['qts']) ? $_POST['qts'] : array();

$skus = array();
$total = 0.00;
foreach ($product_ids as $sku_id =>$product_id){
	$qt = isset($qts[$sku_id]) ? (int)$qts[$sku_id] : 0;
	if($qt<1) continue;
	
	$skus[$sku_id]['qt'] = $qt;
	$skus[$sku_id]['info'] = $info = ProductsSku::getData($sku_id);
	$current_price = isset($info['current_price']) ? $info['current_price'] : 0.00;
	
	$pic = ProductsPic::getOne(array('sku'=>$info['sku']), 'path', 'sort DESC');
	$skus[$sku_id]['info']['pic'] = $pic['path'];
	
	$item = ProductsSku::getSkuItem($info['item'], 'title');
	$skus[$sku_id]['info']['title'] = $item['title'];
	
	$total = $total + ($qt*$current_price);
}
//var_dump($product_ids,$skus);exit;

$userlevel = Users::getLevel($userid);
$discount = $userlevel['discount'];
$newtotal = $total * $discount;

$address = ReceiverAddress::getInfoByUser($userid);
//var_dump($address);
$yunfei = 0.00;

$token = ABase::token();
Templates::Assign('yunfei', $yunfei);
Templates::Assign('token', $token);
Templates::Assign('address', $address);
Templates::Assign('userlevel', $userlevel);
Templates::Assign('newtotal', $newtotal);
Templates::Assign('total', $total);
Templates::Assign('skus', $skus);
Templates::Display('buy.html');

