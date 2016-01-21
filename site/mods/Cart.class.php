<?php
class Cart extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_cart';
	
	//检查购物车是否已经有相同的产品
	static public function check($user_id, $sku_id, $status=0)
	{
		$user_id = (int)$user_id;
		$sku_id = (int)$sku_id;
		if(!$user_id || !$sku_id) return false;
		return self::getOne(array('user_id'=>$user_id, 'sku_id'=>$sku_id, 'status'=>$status));
	}
	
	//增加到购物车
	static public function add($user_id, $sku_id, $qt)
	{
		$user_id = (int)$user_id;
		$sku_id = (int)$sku_id;
		$qt = (int)$qt;
		if(!$user_id || !$sku_id || !$qt) return false;
		if(!$rs = self::check($user_id, $sku_id)){
			$data = array(
				'user_id'		=> $user_id,
				'sku_id'		=> $sku_id,
				'qt'			=> $qt,
				'update_time'	=> time(),
				'create_time'	=> time(),
				'status'		=> 0
			);
			return self::insert($data);
		}else{
			$qt = $qt + $rs['qt'];
			$data = array(
				'qt'	=> $qt,
				'update_time'	=> time()
			);
			
			return self::update($rs['id'], $data);
		}
	}

	static public function getNum($user_id)
	{
		$user_id = (int)$user_id;
		if(!$user_id) 0;
		
		$table = self::table();		
		$sql = "SELECT SUM(qt) as count FROM $table WHERE user_id='$user_id' AND status=0";
		$rs = DB::GetQueryResult($sql, false);
		$rs = isset($rs[0]['count']) ? (int)$rs[0]['count'] : 0;
		return $rs;
	}
	
	static public function getProducts($user_id)
	{
		$user_id = (int)$user_id;
		if(!$user_id) return array();
		
		$rs = self::getList("user_id='$user_id' AND status=0",'sku_id, qt','update_time DESC');
		foreach ($rs as $k => $v){
			$rs[$k]['sku'] = $skus = ProductsSku::getData($v['sku_id']);
			
			$pic = ProductsPic::getOne(array('sku'=>$skus['sku']), 'path', 'sort DESC');
			$rs[$k]['sku']['pic'] = $pic['path'];

			$item = ProductsSku::getSkuItem($skus['item'], 'title');
			$rs[$k]['sku']['title'] = $item['title'];
		}
		return $rs;
	}
	
	static public function clearCart($user_id, $sku_id)
	{
		if(!$user_id || !$sku_id) return false;
		return self::update(array('user_id'=>$user_id, 'sku_id'=>$sku_id), array('status'=>1));
	}
	
	
}


