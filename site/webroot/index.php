<?php
require_once('../config.php');

//---------- session
$PHPSESSID = isset($_COOKIE['PHPSESSID']) ? $_COOKIE['PHPSESSID'] : null;
if($PHPSESSID) session_id($PHPSESSID);
session_start();
$sessionid = session_id();
setcookie('PHPSESSID', $sessionid, time()+86400, '/');

//---------- Security
$POST = array(); $GET = array();
if($_POST){
	$POST = $_POST;		//非安全
	$_POST = Security::getRequest('post');	//安全
}else if($_GET){
	$GET = $_GET;
	$_GET = Security::getRequest('get');
}
$REQUEST = $_REQUEST;
$_REQUEST = Security::getRequest('request');
//------------ End Security

//---------------- 控制器
$uri = isset($_SERVER["REQUEST_URI"]) ? $_SERVER["REQUEST_URI"] : null;
$action = null;
if($uri){
	$uri = explode("/", $uri);
	$action = isset($uri[1]) ? $uri[1] : null;
	$action = explode("?", $action); 
	$action = isset($action[0]) ? $action[0] : null;
}

//----------------- user
$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
$name = isset($_SESSION['name']) ? $_SESSION['name'] : null;
$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
$usertype = isset($_SESSION['usertype']) ? (int)$_SESSION['usertype'] : 0;

Templates::Assign('username', $user);
Templates::Assign('name', $name);
Templates::Assign('userid', $userid);
Templates::Assign('usertype', $usertype);
if(!$user && !in_array($action, $GLOBALS['EXCLUDE_URL'])){require_once 'sign.php';exit;}

include_once 'index_ext.php';
Templates::Assign('action', $action);

//------------------------ action
if($action){
	$action = $action.".php";
	$flag = 0;
	foreach (glob("*.php") as $webroot){
		if($action === $webroot){
			require_once $action;
			$flag = 1;
			exit;
		}
	}
	if(!$flag){header("Location: /html/404.html");	exit;}
}
include_once 'home.php';



