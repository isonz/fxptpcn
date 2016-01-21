<?php
error_reporting(E_ALL);
ini_set("display_startup_errors","1");
ini_set("display_errors","On");

ini_set('date.timezone','Asia/Shanghai');

//======================================= Basic
if (!defined('DS')) {
    define('DS', DIRECTORY_SEPARATOR);
}
if(!defined('_SITE')){
    define('_SITE', dirname(__FILE__) . DS);
}
if(!defined('_LIBS')){
    define('_LIBS', _SITE . 'libs' . DS);
}
if(!defined('_MODS')){
	define('_MODS', _SITE . 'mods' . DS);
}
if(!defined('_MODULES')){
	define('_MODULES', _SITE . 'modules' . DS);
}
if(!defined('_DATA')){
	define('_DATA', _SITE . 'data' . DS);
}
if(!defined('_LOGS')){
    define('_LOGS', _DATA . 'logs' . DS);
}
foreach (glob(_LIBS."/*.php") as $libs){
	require_once $libs;
}
foreach (glob(_MODS."/*.php") as $mods){
	require_once $mods;
}
foreach (glob(_MODULES."/*.php") as $modules){
	require_once $modules;
}
//======================================== Config
$GLOBALS['CONFIG_DATABASE'] = array(
	'host'      => '192.168.75.140',
    'user'      => 'root',
    'pwd'       => 'admin888',
    'dbname'    => 'fxptpcn',
	'port'      => 3306,
	'tb_prefix' => 'fx_'
);

//======================================= Smarty
if(!defined('_SMARTY')){
	define('_SMARTY', _LIBS . 'Smarty' . DS);
}
foreach (glob(_SMARTY."/*.php") as $lib_smarty){
	require_once $lib_smarty;
}
//====================================== Template
$detect = new MobileDetect();
if($detect->isMobile() || $detect->isTablet() && '192.168.75.99:86'==$_SERVER['HTTP_HOST']){
	define('_DEVICE', 'mo' . DS);
}else{
	define('_DEVICE', 'pc' . DS);
}

if(!defined('_SMARTY_TEMPLATE')){
	define('_SMARTY_TEMPLATE', _SITE .'template' . DS . _DEVICE);
}
if(!defined('_SMARTY_COMPILED')){
	define('_SMARTY_COMPILED', _DATA . 'compileds' . DS . _DEVICE);
}
if(!defined('_SMARTY_CACHE')){
	define('_SMARTY_CACHE', _DATA . 'caches' . DS . _DEVICE);
}

if(!defined('_UPLOAD')){
	define('_UPLOAD', _SITE . 'upload' . DS);
}

$GLOBALS['EXCLUDE_URL'] = array('public');
define('_PRODUCTIMGPATH', '/images/uploads/products/');


define('_USERMOBSEND', 'http://sso.ptp.cn/sso/captchamsg/commonsend');		//短信发送平台

define('_PTPPAYURL', 'http://pays.ptp.cn/');								//支付平台
define('_PTPPAYTOKEN', 'b25535c80047cb523240335d50231f24');					//支付平台TOKEN
define('_PTPPAYKEY', 'fx.ptp.cn@163.com');									//支付平台加密密钥

define('_DEVDEBUG', 1);


