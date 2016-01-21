<?php
$action = isset($_REQUEST['a']) ? $_REQUEST['a'] : '';
switch ($action){
	case 'showShippingInfo':
		showShippingInfo();
		break;
	default:
		ABase::toJson(1,'action error');
}


function showShippingInfo()
{
	$no = isset($_POST['ship_no']) ? $_POST['ship_no'] : '';
	$name = isset($_POST['ship_name']) ? $_POST['ship_name'] : '';
	$no = substr($no, 1);
	$info = Shipping::get($name, $no);
	if(!$info){
		ABase::toJson(1,'showShippingInfo : No Data');
	}else{
		ABase::toJson(0,'ok',$info);
	}
}




