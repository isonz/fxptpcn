<?php
$uri = isset($_SERVER["REQUEST_URI"]) ? $_SERVER["REQUEST_URI"] : null;
$action = null;
if($uri){
	$uri = explode("/", $uri);
	$action = isset($uri[2]) ? $uri[2] : null;
	$action = explode("?", $action);
	$action = isset($action[0]) ? $action[0] : null;
}

$payhost = isset($_POST['payhost']) ? $_POST['payhost'] : '';
if(!$payhost){
	if(!checkurl()) $action = null;
}else{
	if(!payHost($payhost) && !payHost($payhost, 'admin')) $action = null;
}

function checkurl()
{
	if(!isset($_SERVER['HTTP_REFERER'])) return false;
	$urlar = parse_url($_SERVER['HTTP_REFERER']);
	$port = isset($urlar["port"]) ? ':'.$urlar["port"] : '';
	if('80' == $port) $port = '';
	$fhost = $urlar["host"].$port;
	if($_SERVER['HTTP_HOST'] == $fhost) return true;
	return false;
}

function payHost($host, $admin='')
{
	$payhost = str_replace('https://', '', _PTPPAYURL);
	$payhost = str_replace('http://', '', $payhost);
	$payhost = str_replace('/', '', $payhost);
	if($admin) $payhost = $admin.'.'.$payhost;
	if($host && $host==$payhost) return $payhost;
	return false;
}

switch ($action){
	case 'county':
		getCountys();
		break;
	case 'vcode':
		getVcode();
		break;
	case 'upload':
		uploadFile($uri);
		break;
	case 'files':
		files();
		break;
	case 'dxyzm':
		dxyzm();
		break;
	case 'cleartmpuserphone':
		clearTmpUserPhone();
		break;
	case 'getOrder':
		getOrder();
		break;
	case 'orderNotify':
		orderNotify();
		break;
	default:
		ABase::toJson(1,'Error code 404');
}

function getCountys(){
	$pid = isset($_GET['pid']) ? (int)$_GET['pid'] : 0;
	$ajax = isset($_GET['ajax']) ? (int)$_GET['ajax'] : 0;
	$countys = Countys::getCountys($pid);
	if($ajax) ABase::toJson(0,'OK',$countys);
}

function getVcode()
{
	require_once _LIBS."Vcode/Vcode.class.php";
	$image = Vcode::show();
	header("Content-type: image/png");
	$image = imagePng($image);
	imagedestroy($image);
	exit;
}

function uploadFile($uri='')
{
	$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
	$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
	if(!$user || !$userid){header('Location: /');exit;}
	
	$folder = isset($uri[3]) ? $uri[3] : '';
	$param_name = isset($uri[4]) ? $uri[4] : 'files';
	$options = array(
		'upload_dir'	=> _UPLOAD.$folder.'/',
		'upload_url'	=> '/public/files/?op=view&path='.$folder.'&file=',
		'deleteUrl'		=> '/public/files/?op=delete&path='.$folder.'&',
		'image_versions'=> array(),
		'filename'		=> $user.'_'.$userid.'_'.$param_name,			//使用同一个文件名，避免重复上传占用空间
		'param_name'	=> $param_name,							//input 名称
		'override'	=> true,									//覆盖重名文件
	);
	$upload_handler = new UploadHandler($options);
}
function files()
{
	$user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
	$userid = isset($_SESSION['userid']) ? (int)$_SESSION['userid'] : 0;
	if(!$user || !$userid){header('Location: /');exit;}

	$op = isset($_GET['op']) ? $_GET['op'] : null;
	$path = isset($_GET['path']) ? $_GET['path'] : '';
	$file = isset($_GET['file']) ? $_GET['file'] : '';
	$files = _UPLOAD."$path/$file";
	if(!$path || !$file || !file_exists($files)) exit('File is not exists.');
	
	$fuser = explode("_", $file);
	$fuser = isset($fuser[0]) ? $fuser[0] : 0;
	if($user != $fuser) exit('Not enough access permissions.');
	
	switch ($op){
		case 'delete':
			
			break;
		default:
			header("Content-Type:text/html;charset=utf-8");
			header("Content-type: image/jpeg");
			$width = isset($_GET['width']) ? (int)$_GET['width'] : 0;
			$height = isset($_GET['height']) ? (int)$_GET['height'] : 0;
			echo Func::resizeImage($files, $width, $height);
	}
}

function dxyzm()
{
	$sessionid = session_id();
	$user_phone = isset($_POST['userphone']) ? $_POST['userphone'] : '';
	$sign = isset($_POST['sign']) ? $_POST['sign'] : 'in';
	$user_phone = substr($user_phone, 1);
	$token = isset($_POST['token']) ? $_POST['token'] : '';
	if(!$user_phone || strlen($user_phone)!=11 || !Func::checkmobile($user_phone)) ABase::toJson(1,'请正确输入手机号码');
	$_SESSION['tmp_user'] = $user_phone;
	if(!$sessionid || !$token || !ABase::token($token)){
		$_SESSION['tmp_get_yzm'] = 1;
		ABase::toJson(-1,'请求异常或自动刷新');
	}
	
	$dxyzm_send_num = isset($_SESSION['dxyzm_send_num']) ? (int)$_SESSION['dxyzm_send_num'] : 0;
	if($dxyzm_send_num > 10) ABase::toJson(1,'您今日发送短信数过多');
		
	$user = Users::check($user_phone);
	$userid = isset($user['id']) ? (int)$user['id'] : 0;
	$ustatus = isset($user['status']) ? (int)$user['status'] : 0;
	
	if('in'===$sign){
		if(!$userid) ABase::toJson(1,'手机号码未注册');
		if($ustatus < 0) ABase::toJson(1,'该账号被冻结，详情请致电本公司。');
	}else{
		if($userid) ABase::toJson(1,'手机号码被占用');
	}

	$_SESSION['dxyzm_send_num'] = $dxyzm_send_num + 1;
	$_SESSION['dxyzm'] = $vcode = rand(100000, 999999);
	$plaintext = $user_phone.'-1001-'.$vcode;
	if(!_DEVDEBUG){
		$pcontent = ABase::RSASignature($plaintext, _USERMOBSEND);
	}else{
		$pcontent = "1,ok"; 	//test
	}
	
	$pcontent = explode(',',$pcontent);
	$status = isset($pcontent[0]) ? (int)$pcontent[0] : 0;
	$msg = isset($pcontent[1]) ? $pcontent[1] : '';
	if(1 != $status){
		ABase::toJson(1, $msg);
	}else{
		if(!_DEVDEBUG){
			ABase::toJson(0, $msg);
		}else{
			ABase::toJson(0, $msg, array($vcode));   //test
		}
	}
}

function clearTmpUserPhone()
{
	if(isset($_SESSION['tmp_user'])) unset($_SESSION['tmp_user']);
	ABase::toJson(0,'ok');
}

function getOrder()
{
	$orders = Orders::publicPayOrderSignVerify();
	$order_code = isset($orders['order_code']) ? $orders['order_code'] : '';
	$order_id = isset($orders['id']) ? (int)$orders['id'] : 0;
	$paid = isset($orders['paid']) ? (float)$orders['paid'] : 0.00;
	$order_amount = isset($orders['amount']) ? (float)$orders['amount'] : 0.00;
	$payRate = isset($orders['payRate']) ? floatval($orders['payRate']) : 1;
	
	$order_type = substr($order_code, -2, 2);
	if('SK' == $order_type) $orders['amount'] = round($order_amount*$payRate, 2);
	
	$order_status = isset($orders['order_status']) ? (int)$orders['order_status'] : 0;
	if('YK' == $order_type){
		if($order_status > 5) ABase::toJson(1007,"订单状态已改变 order_status: $order_status");
		$sk_order_code = str_replace('YK', 'SK', $order_code);
		$products = OrdersProducts::getList("order_code='$sk_order_code'", 'product_sku,product_num', 'product_sku');
	}else{
		if($order_status > 1) ABase::toJson(1009,"订单状态已改变");
		$products = OrdersProducts::getList("order_code='$order_code'", 'product_sku,product_num', 'product_sku');
	}
	if(!$products) ABase::toJson(1008,"订单产品获取失败");
		
	$len = count($products);
	if($len > 1){
		$title = "合并 | $len 笔订单";
	}else{
		$product_sku = isset($products[0]['product_sku']) ? $products[0]['product_sku'] : '';
		$product_num = isset($products[0]['product_num']) ? (int)$products[0]['product_num'] : '';
		if(!$product_sku) ABase::toJson(1009,"无法获取订单产品SKU");
		$items = ProductsItem::getSkuItem($product_sku);
		$title = isset($items['title']) ? $items['title'] : '';
		$sku_name = isset($items['sku_name']) ? $items['sku_name'] : '';
		$title = $title ." ". $sku_name . " × ".$product_num;
	}
	$orders['title'] = $title;
	$orders['order_code'] = $order_code;
	ABase::toJson(0,'SUCCESS', $orders);
}

//付款成功才会收到通知
function orderNotify()
{
	$orders = Orders::publicPayOrderSignVerify();
	$order_code = isset($orders['order_code']) ? $orders['order_code'] : '';
	$order_id = isset($orders['id']) ? (int)$orders['id'] : 0;
	$order_status = isset($orders['order_status']) ? (int)$orders['order_status'] : 0;
	$pay_transaction_id = isset($orders['pay_transaction_id']) ? $orders['pay_transaction_id'] : '';
	$paid = isset($orders['paid']) ? $orders['paid'] : 0;
	
	$paymethod_code = $orders['paymethod_code'];
	if(1 == $order_status){
		$pay_method = PaymentMethod::getOne(array('code' => $paymethod_code),'id');
		$pay_method = isset($pay_method['id']) ? (int)$pay_method['id'] : 0;
		
		$sk_order_code = null;
		$order_type = substr($order_code, -2, 2);
		if('YK'==$order_type) $sk_order_code = str_replace('YK', 'SK', $order_code);
		
		DB::tranBegin('notify');	//事务开始
		Orders::update(array('order_code' => $order_code), array('paid'=>$paid, 'order_status'=>2, 'pay_method'=>$pay_method, 'pay_transaction_id'=>$pay_transaction_id, 'pay_time'=>time()));
		if($sk_order_code) Orders::update(array('order_code' => $sk_order_code), array('order_status'=>5));
		ProductsStockLock::changeStatus($order_code, 1);
		OrdersProducts::updateOrderProductStock($order_code);
		$commit_status = DB::tranEnd('notify');
		
		if(!$commit_status){
			ABase::toJson(1,'FAIL', $orders);
		}
	}
	ABase::toJson(0,'SUCCESS', $orders);
}





