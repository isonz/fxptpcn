<?php
class OrdersStatus extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_orders_status';
	
	static public function getName($id)
	{
		$data = self::getData($id);
		return $data['name'];
	}
	
	static public function getCode($id)
	{
		$data = self::getData($id);
		return $data['code'];
	}
	
}


