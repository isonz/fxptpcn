<?php
class Shipping
{
	static private $_key = '358b0139ee9805df';
	static private $_url = 'http://api.kuaidi100.com/api?id=#KEY#&com=#CODE#&nu=#NO#&show=0&muti=1&order=asc';
	static private $_url2 = 'http://www.kuaidi100.com/applyurl?key=#KEY#&com=#CODE#&nu=#NO#';
	
	static public function get($name, $no)
	{
		if(!$name || !$no) return array();
		$map = array_flip(self::codeMap());
		$code = isset($map[$name]) ? $map[$name] : '';
		if(!$code) return array();
		
		/* API 模式
		$url = str_replace('#NO#', $no, str_replace('#CODE#', $code, str_replace('#KEY#', self::$_key, self::$_url)));
		$result = self::getCurl($code, $no, $url);
		$result = json_decode($result, true);
		$status = isset($result['status']) ? $result['status'] : 0;
		if(2 == $status) return array();
		*/
		
		$url = str_replace('#NO#', $no, str_replace('#CODE#', $code, str_replace('#KEY#', self::$_key, self::$_url2)));
		$result = self::getCurl($code, $no, $url);
		return $result;
	}
	
	static public function getCurl($code, $no, $url)
	{
		if (function_exists('curl_init') == 1){
			$result = Func::curlGet($url);
		}else{
			$snoopy = new Snoopy();
			$snoopy->referer = 'http://www.baidu.com/';//伪装来源
			$snoopy->fetch($url);
			$result = $snoopy->results;
		}
		return $result;
	}
	
	static public function codeMap()
	{
		return array(
			'yunda'			=> '韵达速递',
			'yuantong'		=> '圆通快递',
			'zhongtong'		=> '中通速递',
			'shentong'		=> '申通快递',
			'shunfeng'		=> '顺丰快递',
			'debangwuliu'	=> '德邦物流',
			'xinbangwuliu'	=> '新邦物流',
			'suer'			=> '速尔物流',
		);
	}
	
}