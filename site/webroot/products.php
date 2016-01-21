<?php
//产品列表
$cateid = isset($_GET['cateid']) ? (int)$_GET['cateid'] : 0;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$page_size = isset($_GET['page_size']) ? (int)$_GET['page_size'] : 30;

$cateids = array();
$products = array();
$paged = '';
$lists = array('data'=>array(),'page'=>'');
$cateids = ProductsCategory::getChild($cateid);
$is_paged = 0;

if(!$cateids){
	$is_paged = 1;
	$cate = ProductsCategory::getData($cateid);
	Templates::Assign('cate', $cate);
	
	$lists = ProductsItem::paging($page, $page_size, "category_id='$cateid' AND status=1", "create_time DESC");
	$products = $lists['data'];
	$products = getProducts($products);
	$paged = $lists['page'];	
}else{
	foreach ($cateids as $cid){
		$ccid = $cid['id'];
		if(!$ccids = ProductsCategory::getChild($ccid)){
			$produs =  ProductsItem::getCateProducts($ccid,'*','create_time DESC LIMIT 0,10');
		}else{
			$tmp = array();
			foreach ($ccids as $ccid){$tmp[] = $ccid['id'];}
			$ccid = implode(',', $tmp);
			$produs = ProductsItem::getList("category_id IN ($ccid) AND status=1", '*','create_time DESC LIMIT 0,10');
		}	
		$produs = getProducts($produs);
		$products[$cid['id']]['prod'] = $produs;
		$products[$cid['id']]['cate'] = array('id'=>$cid['id'], 'name'=>$cid['name']);
	}
}

//var_dump($products);

Templates::Assign('is_paged', $is_paged);
Templates::Assign('cateid', $cateid);
Templates::Assign('products', $products);
Templates::Assign('paged', $paged);
Templates::Display('products.html');


function getProducts($products)
{
	foreach ($products as $k=> $product){
		$skus = ProductsSku::getItemSkus($product['item']);
		$min = 100000.00;
		$max = 0.00;
		$price = '';
		foreach ($skus as $sku){
			if($min > $sku['current_price']) $min = $sku['current_price'];
			if($max < $sku['current_price']) $max = $sku['current_price'];
		}
		if($min == $max){
			$price = $min;
		}else{
			$price = "$min ~ $max";
		}
		$products[$k]['price'] = $price;
		
		if(!isset($products[$k]['pics']) || !$products[$k]['pics']){
			$path = '';
			foreach ($skus as $sku){
				$pic = ProductsPic::getOne(array('sku'=>$sku['sku']), 'path', 'sort DESC');
				$path = isset($pic['path']) ? $pic['path'] : '';
				if($path) break;
			}
			$products[$k]['pics'] = $path;
		}
	}
	return $products;
}
