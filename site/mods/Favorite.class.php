<?php
class Favorite extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_favorite';
	
	//检查是否已经有相同的产品
	static public function check($user_id, $sku_id)
	{
		$user_id = (int)$user_id;
		$sku_id = (int)$sku_id;
		if(!$user_id || !$sku_id) return false;
		return self::getOne(array('user_id'=>$user_id, 'sku_id'=>$sku_id));
	}
	
	static public function add($user_id, $sku_id)
	{
		$user_id = (int)$user_id;
		$sku_id = (int)$sku_id;
		if(!$user_id || !$sku_id) return false;
		if(!$rs = self::check($user_id, $sku_id)){
			$data = array(
				'user_id'		=> $user_id,
				'sku_id'		=> $sku_id,
				'create_time'	=> time()
			);
			return self::insert($data);
		}
		return true;
	}	
	
	static public function getLists($user_id, $page, $page_size)
	{
		$user_id = (int)$user_id;
		if(!$user_id) return array();
		
		$table = self::table();
		$sku_table = ProductsSku::table();
		$item_table = ProductsItem::table();
		
		$sql = " SELECT a.id, b.id AS skuid, c.title, b.sku, b.sku_name, b.current_price FROM $table AS a, $sku_table AS b, $item_table AS c WHERE b.item=c.item AND a.sku_id=b.id AND a.user_id='$user_id' ORDER BY a.id DESC";
		$lists = Paging::bySQL($sql, $page, $page_size, 'a');
		ProductsSku::getProductsPic($lists['data']);
		return $lists;
	}
	
}


