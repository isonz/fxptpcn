<?php
class ProductsItem extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_products_item';	
	
	static public function getCateProducts($cateid, $select='*', $order='id DESC')
	{
		$cateid = (int)$cateid;
		if(!$cateid) return array();
		$where = "category_id='$cateid' AND status=1";
		$list = self::getList($where, $select, $order);		
		return $list;
	}
	
	static public function getRand()
	{
		$table = self::table();
		$sql = "SELECT * FROM $table WHERE id >= ((SELECT MAX(id) FROM $table)-(SELECT MIN(id) FROM $table)) * RAND() + (SELECT MIN(id) FROM $table)  AND status=1 LIMIT 5";
		$rs = DB::GetQueryResult($sql, false);
		return $rs;
	}
	
	static public function getSkuItem($sku)
	{
		if(!$sku) return array();
		$sku = ProductsSku::getOne(array('sku'=>$sku), 'item, sku_name');
		$item = $sku['item'];
		$sku_name = $sku['sku_name'];
		if(!$item) return array();
		$items = self::getOne(array('item'=>$item));
		if(!$items) return array();
		$items['sku_name'] = $sku_name;
		return $items;
	}
	
}


