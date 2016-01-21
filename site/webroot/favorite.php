<?php
//收藏夹
$type = isset($_REQUEST['t']) ? $_REQUEST['t'] : '';
$action = isset($_REQUEST['a']) ? $_REQUEST['a'] : '';
$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;

if('ajax' == $type){
	switch ($action){
		case 'add':
			$sku_id = isset($_POST['sku_id']) ? (int)$_POST['sku_id'] : 0;
			if(!$sku_id) ABase::toJson(1,'error 001');
			if(Favorite::add($userid, $sku_id)) ABase::toJson(0,'ok');
			ABase::toJson(1,'error 009');
			break;
		case 'remove':
			$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
			if($id){
				if(Favorite::del($id)){
					ABase::toJson(0,'ok');
				}else{
					ABase::toJson(1,'error 010');
				}
			}
			ABase::toJson(1,'error 011');
			break;
		default:
			ABase::toJson(1,'action error');
	}
}else{
	$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
	$page_size = isset($_GET['page_size']) ? (int)$_GET['page_size'] : 16;
	$favorites = Favorite::getLists($userid, $page, $page_size);	
	
	//var_dump($favorites);exit;
	Templates::Assign('favorites', $favorites['data']);
	Templates::Assign('paged', $favorites['page']);
	Templates::Display('favorite.html');
}


