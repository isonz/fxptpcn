<?php
Templates::Assign('picpath', _PRODUCTIMGPATH);

$root_cates = ProductsCategory::getRoot();
Templates::Assign('root_cates', $root_cates);

$cateid = isset($_GET['cateid']) ? $_GET['cateid'] : 0;
Templates::Assign('cateid', $cateid);

$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$userstatus = isset($_SESSION['userstatus']) ? (int)$_SESSION['userstatus'] : 0;
if(!$userstatus){
	$user = Users::check('','',$userid);
	$userstatus = isset($user['status']) ? (int)$user['status'] : 0;
	$_SESSION['userstatus'] = $userstatus;
}
Templates::Assign('userstatus', $userstatus);

//获取购物车
$cart_num = Cart::getNum($userid);
Templates::Assign('cart_num', $cart_num);


//------------- 微信 OPENID
$wxopenid = isset($_REQUEST['openid']) ? $_REQUEST['openid'] : (isset($_SESSION['wx']['openid']) ? $_SESSION['wx']['openid'] : '');
$wxnickname = isset($_REQUEST['nickname']) ? $_REQUEST['nickname'] : (isset($_SESSION['wx']['nickname']) ? $_SESSION['wx']['nickname'] : '');
$_SESSION['wx']['openid'] = $wxopenid;
$_SESSION['wx']['nickname'] = $wxnickname;
Templates::Assign('is_weixin', Func::isInWeixin());

