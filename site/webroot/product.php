<?php
//产品详情
$item_id = isset($_GET['item_id']) ? (int)$_GET['item_id'] : 0;

if($item_id){
	$info = ProductsItem::getData($item_id);
	$status = isset($info['status']) ? (int)$info['status'] : 0;
	if(!$info || !$status){header("Location: /html/404.html?001");	exit;}
	
	$item = isset($info['item']) ? $info['item'] : '';
	$sku = ProductsSku::getItemFirstSku($item);
	$skuid = isset($sku['id']) ? (int)$sku['id'] : 0;
	if(!$skuid){header("Location: /html/404.html?002");	exit;}
	
	header("Location: /product/?id=$skuid");	
	exit;
}else{
	$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
	if(!$id){header("Location: /html/404.html?003"); exit;}
	
	$sku = ProductsSku::getData($id);
	if(!$sku){header("Location: /html/404.html?004"); exit;}
	
	$item_code = $sku['item'];
	$item = ProductsItem::getOne(array('item'=>$item_code, 'status'=>1));
	if(!$item){header("Location: /html/404.html?005"); exit;}
	$sku['iteminfo'] = $item;
	
	$sku_code = $sku['sku'];
	$pics = ProductsPic::getSkuPics($sku_code,'path','sort DESC LIMIT 0,3');
	$sku['pics'] = $pics;
	$sku['order_num'] = OrdersProducts::getSkuAllNum($sku_code);
	$sku['stock'] = ProductsStock::getSkuStock($sku_code);
	
	$skus = ProductsSku::getItemSkus($item_code, "id,sku,sku_name");
	$skus = ProductsSku::getProductsPic($skus);
	$sku['skus'] = $skus;

	$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
	$history = array();
	if($userid) $history = UsersHistory::getProductViewLog($userid, $id);
	if(!$history) $history = ProductsSku::getRand($item_code);
	$history = ProductsSku::getProductsPic($history);
	$history = ProductsSku::getProductsItemTitle($history);
	
	ProductsSku::increase("id=$id", 'view_num');
	$log = array('op'=>'view', 'id'=>$id, 'url'=>Func::getCurrentURL());
	$log = json_encode($log);
	UsersHistory::addLog($userid, ProductsSku::$module_id, $log);
	
	Templates::Assign('history', $history);
	Templates::Assign('sku', $sku);
	Templates::Display('product.html');
}




