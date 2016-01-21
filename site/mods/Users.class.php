<?php
class Users extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_users';	
	
	static public function check($username_phone='', $user_code='', $userid=0)
	{
		if(!$username_phone && !$user_code && !$userid) return false;
		if($userid) return self::getOne(array("id"=>$userid),'type,status');
		if($username_phone) return self::getOne(array("username_phone"=>$username_phone),'id,user_code,type,legal_name,enterprise_name,status');
		if($user_code) return self::getOne(array("user_code"=>$user_code),'id,type,status');
		return false;
	}
	
	static public function getInfo($id=0, $username_phone=null, $user_code=null)
	{
		if(!$id && !$username_phone && !$user_code) return array();
		if($id){
			return self::getOne(array("id"=>$id));
		}else if($username_phone){
			return self::getOne(array("username_phone"=>$username_phone));
		}else if($user_code){
			return self::getOne(array("user_code"=>$user_code));
		}else{
			return array();
		}
	}
	
	static public function loginUpdate($userid)
	{
		if(!$userid) return false;
		
		$info = self::getInfo($userid);
		self::increase("id='$userid'", 'login_count');
		$data = array(
			'last_login_time'	=> isset($info['login_time']) ? (int)$info['login_time'] : 0,
			'last_login_ip'		=> isset($info['login_ip']) ? $info['login_ip'] : null,
			'login_time'		=> time(),
			'login_ip'			=> Func::getIP(),
		);
		return self::update($userid, $data);
	}
	
	static public function signUp(array $data)
	{
		if(!$data) return false;
		if(!isset($data['last_login_time']))  $data['last_login_time'] = time();
		if(!isset($data['last_login_ip']))  $data['last_login_ip'] = Func::getIP();
		if(!isset($data['login_time']))  $data['login_time'] = time();
		if(!isset($data['login_ip']))  $data['login_ip'] = Func::getIP();
		if(!isset($data['create_time']))  $data['create_time'] = time();
		$data['login_count'] = 1;
		$data['user_code'] = self::getNewUserCode();
		
		$insertid = 0;
		DB::tranBegin();
		$insertid = self::insert($data);
		DB::tranEnd();
		return $insertid;
	}
	
	static public function getNewUserCode()
	{
		$new_code = self::getOne(array('user_code'=>array('!='=>'')),'user_code', 'user_code DESC');
		$new_code = isset($new_code['user_code']) ? $new_code['user_code'] : '';
		if(strlen($new_code)<5) return false;
		
		$new_fix = substr($new_code, 0, 1);
		$new_code = $new_fix.((int)substr($new_code, 1) + 1);
		return $new_code;
	}
	
	static public function getLevel($id=0, $username_phone=null, $user_code=null)
	{
		$info = self::getInfo($id, $username_phone, $user_code);
		$level = isset($info['user_level']) ? (int)$info['user_level'] : 1;
		$start_time = isset($info['level_start_time']) ? $info['level_start_time'] : 0;
		
		$userlevel = UsersLevel::getData($level);
		if(1==$level){
			return $userlevel;
		}else{
			$exp_days = isset($userlevel['exp_days']) ? (int)$userlevel['exp_days'] : 0;
			$exp_time = $exp_days * 24 * 3600;
			if(time() - $start_time > $exp_time) return UsersLevel::getData(1);	//过期
			return $userlevel;
		}
		
	}
	
}


