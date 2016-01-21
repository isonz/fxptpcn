<?php
$action = isset($_GET['a']) ? $_GET['a'] : '';
switch ($action){
	case 'up':
		signUp();
		break;
	case 'bccl':
		BCCL();
		break;
	default:
		signIn();
}

function signIn()
{
	$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
	$errormsg = '';
	if(isset($_GET['in'])){
		if($user){header('Location: /');exit;}
		
		$user_phone = isset($_POST['userphone']) ? $_POST['userphone'] : '';
		$user_phone = substr($user_phone, 1);
		$yzm = isset($_POST['yzm']) ? (int)$_POST['yzm'] : '';
		$signintoken = isset($_POST['sigtoken']) ? $_POST['sigtoken'] : '';
		
		if($user_phone && $yzm && $signintoken && strlen($user_phone)==11 && Func::checkmobile($user_phone)){
			$user = Users::check($user_phone);
			$userid = isset($user['id']) ? (int)$user['id'] : 0;
			$utype = isset($user['type']) ? (int)$user['type'] : 0;
			$user_code = isset($user['user_code']) ? $user['user_code'] : '';
			$legal_name = isset($user['legal_name']) ? $user['legal_name'] : '';
			$enterprise_name = isset($user['enterprise_name']) ? $user['enterprise_name'] : '';
			$status = isset($user['status']) ? (int)$user['status'] : 0;
			
			$syzm = isset($_SESSION['dxyzm']) ? (int)$_SESSION['dxyzm'] : 0;
			$signin_token = isset($_SESSION['signin_token']) ? $_SESSION['signin_token'] : '';
			
			$signin_num = isset($_SESSION['signin_num']) ? (int)$_SESSION['signin_num'] : 0;
			if($status < 0){
				$errormsg = '您的账号被冻结，详情请致电本公司咨询。';
			}else if($signin_num > 9){
				$errormsg = '您今日登入失败的次数过多';
			}else{
				$_SESSION['signin_num'] = $signin_num + 1;
				
				if($userid > 0 && $yzm === $syzm && $signintoken===$signin_token){
					$_SESSION['user'] = $user_phone;
					$_SESSION['userid'] = $userid;
					$_SESSION['user_code'] = $user_code;
					$_SESSION['usertype'] = $utype;
					$_SESSION['name'] = $utype ? $enterprise_name : $legal_name;
					$_SESSION['userstatus'] = $status;
					
					if(isset($_SESSION['tmp_user'])) unset($_SESSION['tmp_user']);
					if(isset($_SESSION['dxyzm'])) unset($_SESSION['dxyzm']);
					if(isset($_SESSION['signin_token'])) unset($_SESSION['signin_token']);
					if(isset($_SESSION['signin_num'])) unset($_SESSION['signin_num']);
					if(isset($_SESSION['dxyzm_send_num'])) unset($_SESSION['dxyzm_send_num']);
					Users::loginUpdate($userid);
					header('Location: /');exit;
				}else{
					$errormsg = "手机号或者验证码错误";
				}
			}
		}
	}
	
	if(isset($_GET['out'])){
		session_destroy();
		session_unset();
		unset($_SESSION);
		header('Location: /');exit;
	}
	
	$tmp_user = isset($_SESSION['tmp_user']) ? $_SESSION['tmp_user'] : '';		//保存在输入框的临时信息
	$tmp_get_yzm = isset($_SESSION['tmp_get_yzm']) ? (int)$_SESSION['tmp_get_yzm'] : 0;		//重复点击获取验证码按钮刷新后的自动触发
	if(isset($_SESSION['tmp_get_yzm'])) unset($_SESSION['tmp_get_yzm']);
	
	$token = ABase::token();
	$signin_token = $_SESSION['signin_token'] = Func::getRandomCode(30);
	
	$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
	Templates::Assign('user', $user);
	Templates::Assign('tmp_user', $tmp_user);
	Templates::Assign('tmp_get_yzm', $tmp_get_yzm);
	Templates::Assign('token', $token);
	Templates::Assign('signin_token', $signin_token);
	Templates::Assign('errormsg', $errormsg);
	Templates::Display('signin.html');
}

function signUp()
{
	$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
	if($user){header('Location: /');exit;}
	
	$user_phone = isset($_POST['userphone']) ? $_POST['userphone'] : null;
	if($user_phone) $user_phone = substr($user_phone, 1);
	$yzm = isset($_POST['yzm']) ? (int)$_POST['yzm'] : 0;
	$signintoken = isset($_POST['sigtoken']) ? $_POST['sigtoken'] : null;
	
	$errormsg = '';
	if($user_phone && $signintoken && strlen($user_phone)==11 && Func::checkmobile($user_phone)){
		$syzm = isset($_SESSION['dxyzm']) ? (int)$_SESSION['dxyzm'] : 0;
		$signin_token = isset($_SESSION['signin_token']) ? $_SESSION['signin_token'] : null;
		if($yzm && $yzm === $syzm && $signintoken===$signin_token){
			$enterprise_name = isset($_COOKIE['enterprise_name']) ? $_COOKIE['enterprise_name'] : null;
			if($enterprise_name && 'null'!=$enterprise_name) $data['enterprise_name']  = $enterprise_name;
			$data['identity'] = $identity =  isset($_COOKIE['identity']) ? $_COOKIE['identity'] : null;
			$legal_identitys = isset($_COOKIE['legal_identity']) ? $_COOKIE['legal_identity'] : null;
			if($legal_identitys && 'null'!=$legal_identitys) $data['legal_identity'] = $legal_identitys;
			$data['legal_name'] = $legal_name = isset($_COOKIE['legal_name']) ? $_COOKIE['legal_name'] : null;
			$data['type'] = $type = isset($_POST['type']) ? $_POST['type'] : null;
			if(1==$type){
				if(!$enterprise_name || !$identity || !$legal_identitys || !$legal_name) ABase::toJson(1,'注册信息不完整');
			}else{
				if(!$identity || !$legal_name) ABase::toJson(1,'注册信息不完整');
			}
			$data['email'] = isset($_COOKIE['email']) ? $_COOKIE['email'] : null;			
			$data['username_phone'] = $user_phone;
			
			$userid = Users::signUp($data);
			if($userid){
				$rdata['user_id'] = $userid;
				$rdata['module_id'] = 2;
				$rdata['receiver_name'] = $legal_name;
				$rdata['receiver_phone'] = $user_phone;
				$rdata['receiver_province'] = isset($_COOKIE['province']) ? $_COOKIE['province'] : 0;
				$rdata['receiver_city'] = isset($_COOKIE['city']) ? $_COOKIE['city'] : 0;
				$rdata['receiver_county'] = isset($_COOKIE['county']) ? $_COOKIE['county'] : 0;
				$rdata['receiver_address'] = isset($_COOKIE['address']) ? $_COOKIE['address'] : null;
				$rdata['receiver_postcode'] = isset($_COOKIE['postcode']) ? $_COOKIE['postcode'] : null;
				$receiver_address_id = ReceiverAddress::add($rdata);
				
				$user = Users::getData($userid);
				$utype = isset($user['type']) ? (int)$user['type'] : 0;
				$user_code = isset($user['user_code']) ? $user['user_code'] : '';
				$legal_name = isset($user['legal_name']) ? $user['legal_name'] : '';
				$enterprise_name = isset($user['enterprise_name']) ? $user['enterprise_name'] : '';
				$status = isset($user['status']) ? (int)$user['status'] : 0;
				$_SESSION['user'] = $user_phone;
				$_SESSION['userid'] = $userid;
				$_SESSION['user_code'] = $user_code;
				$_SESSION['usertype'] = $utype;
				$_SESSION['name'] = $utype ? $enterprise_name : $legal_name;
				$_SESSION['userstatus'] = $status;
					
				if(isset($_SESSION['tmp_user'])) unset($_SESSION['tmp_user']);
				if(isset($_SESSION['dxyzm'])) unset($_SESSION['dxyzm']);
				if(isset($_SESSION['signin_token'])) unset($_SESSION['signin_token']);
				if(isset($_SESSION['signin_num'])) unset($_SESSION['signin_num']);
				if(isset($_SESSION['dxyzm_send_num'])) unset($_SESSION['dxyzm_send_num']);

				if($receiver_address_id) Users::update($userid, array('receiver_address_id'=>$receiver_address_id));
				ABase::toJson(0,'ok');
			}else{
				ABase::toJson(1,'注册失败，请重试');
			}
		}else{
			ABase::toJson(1,'验证码错误');
		}
	}else{
		$type = isset($_GET['t']) ? (int)$_GET['t'] : 0;	//0:个人，1:企业
		$step = isset($_GET['s']) ? (int)$_GET['s'] : 1;	//下一步
		if($step<1) $step = 1;
		
		$tmp_user = isset($_SESSION['tmp_user']) ? $_SESSION['tmp_user'] : '';		//保存在输入框的临时信息
		$tmp_get_yzm = isset($_SESSION['tmp_get_yzm']) ? (int)$_SESSION['tmp_get_yzm'] : 0;		//重复点击获取验证码按钮刷新后的自动触发
		if(isset($_SESSION['tmp_get_yzm'])) unset($_SESSION['tmp_get_yzm']);
		
		$provinces = Countys::getCountys();
		$token = ABase::token();
		$signin_token = $_SESSION['signin_token'] = Func::getRandomCode(30);
		
		$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
		Templates::Assign('user', $user);
		Templates::Assign('tmp_user', $tmp_user);
		Templates::Assign('tmp_get_yzm', $tmp_get_yzm);
		Templates::Assign('provinces', $provinces);
		Templates::Assign('type', $type);
		Templates::Assign('step', $step);
		Templates::Assign('token', $token);
		Templates::Assign('signin_token', $signin_token);
		Templates::Assign('errormsg', $errormsg);
		Templates::Display('signup.html');
	}
}

function BCCL()
{
	$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
	if(!$user){header('Location: /');exit;}

	$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
	$usertype = isset($_SESSION['usertype']) ? (int)$_SESSION['usertype'] : 0;
	$name = isset($_SESSION['name']) ? $_SESSION['name'] : '';
	$userstatus = isset($_SESSION['userstatus']) ? (int)$_SESSION['userstatus'] : 0;
	if($userstatus){header('Location: /');exit;}		//状态为0时才显示本页

	
	$savestatus = 0;
	$errormsg = '';
	
	$data['sales_channel'] = $sales_channel = isset($_POST['sales_channel']) ? $_POST['sales_channel'] : '';
	$data['how_to_kown_we'] = $how_to_kown_we = isset($_POST['how_to_kown_we']) ? $_POST['how_to_kown_we'] : '';
	$data['certification_photo'] = $certification_photo = isset($_POST['certification_photo_val']) ? $_POST['certification_photo_val'] : '';
	$data['person_hold_photo'] = $person_hold_photo = isset($_POST['person_hold_photo_val']) ? $_POST['person_hold_photo_val'] : '';
	$data['others_photo'] = $others_photo = isset($_POST['others_photo_val']) ? $_POST['others_photo_val'] : '';
	
	if($sales_channel && $how_to_kown_we && $certification_photo && $person_hold_photo){
		if(1==$usertype){
			$data['enterprise_legal_photo'] = $enterprise_legal_photo = isset($_POST['enterprise_legal_photo_val']) ? $_POST['enterprise_legal_photo_val'] : '';
			$data['enterprise_grant_photo'] = $enterprise_grant_photo = isset($_POST['enterprise_grant_photo_val']) ? $_POST['enterprise_grant_photo_val'] : '';
			$data['enterprise_tax_photo'] = $enterprise_tax_photo = isset($_POST['enterprise_tax_photo_val']) ? $_POST['enterprise_tax_photo_val'] : '';
			if(!$enterprise_legal_photo){
				$errormsg = '信息未填写完整。';
				$savestatus = -1;
			}else{
				Users::update($userid, $data);
				$savestatus = 1;
			}
		}else{		
			Users::update($userid, $data);
			$savestatus = 1;
		}
	}

	if(!$savestatus){
		$userinfo = Users::getData($userid,'certification_photo');
		$savestatus = isset($userinfo['certification_photo']) ? $userinfo['certification_photo'] : '';
		if($savestatus) $savestatus = 1;
	}
	
	Templates::Assign('user', $user);
	Templates::Assign('usertype', $usertype);
	Templates::Assign('userid', $userid);
	Templates::Assign('name', $name);
	Templates::Assign('errormsg', $errormsg);
	Templates::Assign('savestatus', $savestatus);
	Templates::Display('signbccl.html');
}


