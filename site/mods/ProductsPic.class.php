<?php
class ProductsPic extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_products_pic';	
	
	static public function getSkuPics($sku, $select='*', $order='sort DESC')
	{
		if(!$sku) return array();
		return self::getList("sku='$sku'", $select, $order);
	}
	
	
}


