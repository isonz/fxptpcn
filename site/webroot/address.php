<?php
//用户地址列表
$type = isset($_REQUEST['t']) ? $_REQUEST['t'] : '';
$action = isset($_REQUEST['a']) ? $_REQUEST['a'] : '';
$n = isset($_REQUEST['n']) ? (int)$_REQUEST['n'] : 0;
$addrid = isset($_REQUEST['addressid']) ? (int)$_REQUEST['addressid'] : 0;
$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;

if('ajax' == $type){
	switch ($action){
		case 'setDefault':
			if(ReceiverAddress::setDefault($userid, $addrid)){
				if(!$n) ABase::toJson(0,'ok');
				ABase::toJson(-1,'ok');
			}
			ABase::toJson(1,'error 001');
		case 'addNew':
			addNew($userid);
			break;
		case 'edit':
			edit($userid, $addrid);
			break;
		case 'save':
			save($userid, $addrid);
			break;
		case 'del':
			if(ReceiverAddress::delete($userid, $addrid)) ABase::toJson(0,'ok');
			ABase::toJson(1,'error 002');
			break;
		default:
			ABase::toJson(1,'action error');
	}
}else{
	$address = ReceiverAddress::getInfoByUser($userid);
	Templates::Assign('address', $address);
	Templates::Display('address.html');
}

function addNew($userid)
{
	$n = isset($_REQUEST['n']) ? (int)$_REQUEST['n'] : 0;
	$provinces = Countys::getCountys();
	Templates::Assign('provinces', $provinces);
	Templates::Assign('n', $n);
	Templates::Display('addressnew.html');
}

function edit($userid, $addrid)
{
	$addrs = ReceiverAddress::getData($addrid);
	$provinces = Countys::getCountys();

	$n = isset($_REQUEST['n']) ? (int)$_REQUEST['n'] : 0;
	Templates::Assign('n', $n);
	Templates::Assign('addrs', $addrs);
	Templates::Assign('provinces', $provinces);
	Templates::Display('addressnew.html');
}

function save($userid, $addrid=0)
{
	$n = isset($_REQUEST['n']) ? (int)$_REQUEST['n'] : 0;
	$rdata['user_id'] = $userid;
	$rdata['module_id'] = 2;
	$rdata['receiver_name'] = $name = isset($_POST['truename']) ? $_POST['truename'] : '';
	$phone = isset($_POST['mmobile']) ? $_POST['mmobile'] : '';
	if($phone) $rdata['receiver_phone'] = substr($phone, 1);
	
	$rdata['receiver_province'] = $province = isset($_POST['province']) ? $_POST['province'] : 0;
	$rdata['receiver_city'] = $city = isset($_POST['city']) ? $_POST['city'] : 0;
	$rdata['receiver_county'] = $county = isset($_POST['county']) ? $_POST['county'] : 0;
	$rdata['receiver_address'] = $address = isset($_POST['address']) ? $_POST['address'] : '';
	$rdata['receiver_postcode'] = $postcode = isset($_POST['postcode']) ? $_POST['postcode'] : '';
	$setDefault = isset($_POST['setDefault']) ? $_POST['setDefault'] : '';
	
	//var_dump($rdata); exit;
	if(!$name || !$phone || !$province || !$city || !$county || !$address){if(!$n){header("Location: /address"); exit;} ABase::toJson(1,'error 001');}
	
	if(!$addrid){
		$receiver_address_id = ReceiverAddress::add($rdata);
	}else{
		unset($rdata['user_id'], $rdata['module_id']);
		ReceiverAddress::update($addrid, $rdata);
		$receiver_address_id = $addrid;
	}
	if($setDefault) ReceiverAddress::setDefault($userid, $receiver_address_id);
	
	if(!$n){header("Location: /address"); exit;}
	$data = ReceiverAddress::getInfo($receiver_address_id);
	ABase::toJson(0,'ok', $data);
}

