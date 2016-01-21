<?php
class ReceiverAddress extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_receiver_address';	
	
	static public function add(array $data)
	{
		if(!$data) return false;
		
		$user_id = isset($data['user_id']) ? (int)$data['user_id'] : 0;
		$module_id = isset($data['module_id']) ? (int)$data['module_id'] : 0;
		$receiver_name = isset($data['receiver_name']) ? $data['receiver_name'] : '';
		$receiver_phone = isset($data['receiver_phone']) ? $data['receiver_phone'] : '';
		$receiver_province = isset($data['receiver_province']) ? (int)$data['receiver_province'] : 0;
		$receiver_city = isset($data['receiver_city']) ? (int)$data['receiver_city'] : 0;
		$receiver_county = isset($data['receiver_county']) ? (int)$data['receiver_county'] : 0;
		$receiver_address = isset($data['receiver_address']) ? $data['receiver_address'] : '';
		if(!$user_id || !$module_id || !$receiver_name || !$receiver_phone || !$receiver_province || !$receiver_city || !$receiver_county || !$receiver_address) return false;
		
		$data['create_time'] = time();
		return self::insert($data);
	}
	
	static public function getInfo($id)
	{
		$data = self::getData($id);
		$province = Countys::getName($data['receiver_province']);
		$city = Countys::getName($data['receiver_city']);
		$county = Countys::getName($data['receiver_county']);
		$data['pcc'] = $province.'省'.$city.'市'.$county;
		return $data;
	}
	
	static public function getInfoByUser($user_id, $ids=2)
	{
		$datas = self::getList("user_id='$user_id' AND module_id IN ($ids)", '*', "sort DESC, id DESC");
		$address = array();
		foreach($datas as $data){
			$province = Countys::getName($data['receiver_province']);
			$city = Countys::getName($data['receiver_city']);
			$county = Countys::getName($data['receiver_county']);
			
			$id = $data['id'];
			$address[$id]['pcc'] = $province.'省'.$city.'市'.$county;
			$address[$id]['addr'] = $data['receiver_address'];
			$address[$id]['postcode'] = $data['receiver_postcode'];
			$address[$id]['receiver_name'] = $data['receiver_name'];
			$address[$id]['receiver_phone'] = $data['receiver_phone'];
			$address[$id]['receiver_province'] = $data['receiver_province'];
			$address[$id]['receiver_city'] = $data['receiver_city'];
			$address[$id]['receiver_county'] = $data['receiver_county'];
		}
		return $address;
	}
	
	static public function setDefault($user_id, $id)
	{
		$user_id = (int)$user_id;
		$id = (int)$id;
		if(!$user_id || !$id) return false;

		self::update(array('user_id'=>$user_id, 'sort'=>9999), array('sort'=>0));
		self::update(array('user_id'=>$user_id, 'id'=>$id), array('sort'=>9999));
		return true;
	}
	
	static public function delete($user_id, $id)
	{
		//DB::Debug();
		$user_id = (int)$user_id;
		$id = (int)$id;
		if(!$user_id || !$id) return false;	
		$condition = array('user_id'=>$user_id, 'id'=>$id);
		return DB::Delete(static::$_table, $condition);
	}
	
}


