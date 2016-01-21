<?php
class ProductsCategory extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_products_category';
	
	static public function getRoot()
	{
		$where = "pid=0 AND status=1";
		return self::getList($where, '*', 'sort DESC');
	}
	
	static public function getChild($id)
	{
		$where = "pid=$id AND status=1";
		return self::getList($where, '*', 'sort DESC');
	}
	
	
}


