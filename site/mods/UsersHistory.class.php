<?php
class UsersHistory extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_users_history';	
	
	static public function addLog($userid, $module_id, $log)
	{
		if(!$userid || !$module_id || !$log) return false;
		$data = array(
			'user_id'		=> $userid,
			'module_id'		=> $module_id,
			'log'			=> $log,
			'create_time'	=> time()
		);
		return self::insert($data);
	}
	
	static public function getProductViewLog($userid, $exclude_id=0)
	{
		if(!$userid) return array();
		
		$module_id = ProductsSku::$module_id;
		$rs = self::getList("module_id='$module_id'",'log', 'create_time DESC LIMIT 100');
		$result = array();
		foreach ($rs as $r){
			$res = json_decode($r['log'], true);
			if('view' !== $res['op']) continue;
			$result[] = $res['id'];
		}
		$result = array_flip($result);
		$result = array_flip($result);
		$skuids = implode(',', $result);
		
		return ProductsSku::getSkusByIds($skuids, $exclude_id);
	}
	
	
}


