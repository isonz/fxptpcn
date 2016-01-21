<?php
class ProductsSku extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_products_sku';	
	static public $module_id = 5;
	
	static public function getItemSkus($item, $select='*', $order='id DESC')
	{
		if(!$item) return array();
		return self::getList("item = '$item' AND status=1", $select, $order);
	}
	
	static public function getItemFirstSku($item)
	{
		if(!$item) return array();
		return self::getOne(array('item'=>$item, 'status'=>1), 'id', 'id DESC');
	}
	
	static public function getRand($exclude_item_code='', $n=5)
	{
		$table = self::table();
		
		$exclude = '';
		if($exclude_item_code) $exclude = "item <> '$exclude_item_code' AND ";
		
		$sql = "SELECT * FROM $table WHERE $exclude id >= ((SELECT MAX(id) FROM $table)-(SELECT MIN(id) FROM $table)) * RAND() + (SELECT MIN(id) FROM $table) GROUP BY item LIMIT $n";
		$rs = DB::GetQueryResult($sql, false);
		return $rs;
	}
	
	static public function getSkuItem($item, $select='*')
	{
		if(!$item) return array();
		return ProductsItem::getOne(array('item'=>$item, 'status'=>1), $select);
	}

	static public function getSkusByIds($ids, $exclude_id=0, $n=5)
	{
		if(!$ids) return array();
		$table = self::table();
		$exclude = '';
		if($exclude_id) $exclude = "AND id <> '$exclude_id'";
	
		$sql = "SELECT * FROM $table WHERE id IN (9,6) $exclude AND status=1 GROUP BY item ORDER BY id DESC LIMIT $n";
		$rs = DB::GetQueryResult($sql, false);
		return $rs;
	}
	
	
	//-------------------------------------
	static public function getProductsPic(&$products)
	{
		foreach ($products as $k => $sk){
			$pic = ProductsPic::getOne(array('sku'=>$sk['sku']), 'path', 'sort DESC');
			$path = isset($pic['path']) ? $pic['path'] : '';
			$products[$k]['pic'] = $path;
		}
		return $products;
	}
	
	static public function getProductsItemTitle(&$products)
	{
		foreach ($products as $k => $p){
			$it = isset($p['item']) ? $p['item'] : '';
			if(!$it){
				$sku = isset($p['sku']) ? $p['sku'] : '';
				if(!$sku) continue;
				$its = self::getOne(array('sku'=>$sku), 'id, item, sku_name');
				$it = $its['item'];
				$products[$k]['sku_name'] = $its['sku_name'];
				$products[$k]['skuid'] = $its['id'];
			}
			$item = ProductsSku::getSkuItem($it, 'title');
			$products[$k]['title'] = $item['title'];
		}
		return $products;
	}
	
}


