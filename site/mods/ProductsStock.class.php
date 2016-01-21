<?php
class ProductsStock extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_products_stock';	
	
	static private $_expday = 60;		//DAY，设置产品至少应有的有效期天数
	
	//改变库存,$n为正负整数
	static function updateStock($product_sku, $n)
	{
		$n = (int)$n;
		if(!$product_sku || !$n) return false;
		
		$rs = null;
		DB::tranBegin();	//事务开始
		$rs = self::increase("product_sku='$product_sku'", "stock", $n);
		$rs = ProductsTag::increase("id=1", "status", $n);
		DB::tranEnd();
		return $rs;		//false or object
	}

	//获取SKU的库存量
	static public function getSkuStock($sku)
	{
		if(!$sku) return 0;
		
		$table = self::table();
		$time = time() + 3600*24*self::$_expday;
		$sql = "SELECT SUM(stock) AS stock FROM $table WHERE exp_date > $time AND product_sku='$sku'";
		$stock = DB::GetQueryResult($sql, true);
		$stock = isset($stock['stock']) ? (int)$stock['stock'] : 0;
		return $stock;
	}
	
	
	//出库
	static public function getSkuOutStock($sku, $num)
	{
		$num = (int)$num;
		if(!$sku || !$num) return array();
		
		//DB::Debug();
		$time = time() + 3600*24*self::$_expday;
		$stocks = self::getList("product_sku='$sku' AND exp_date > $time", '*', 'exp_date ASC');
		
		$num_tmp = 0;
		$id_tmp = array();
		foreach ($stocks as $stock){
			$num_pre = $num_tmp;
			$num_tmp = $num_tmp + (int)$stock['stock'];
			if($num_tmp < $num){
				$id_tmp[$stock['id']] = array('stock' => (int)$stock['stock'], 'exp_date' => $stock['exp_date']);
			}else{
				$id_tmp[$stock['id']] = array('stock' => $num - $num_pre, 'exp_date' => $stock['exp_date']);
				break;
			}
		}
		if($num_tmp < $num) return array();
		return $id_tmp;
	}
	
	//减库存并按批次插入订单产品表
	static public function outStockInsertOrderProduct($order_code, $sku, $qt)
	{
		//DB::Debug();
		$stocknum = ProductsStock::getSkuStock($sku);				//检查库存是否充足
		if($stocknum < $qt) return false;
		
		DB::tranBegin('outStockInsertOrderProduct');				//事务开始
		$stock_ids = ProductsStock::getSkuOutStock($sku, $qt);		//查询库存中的批号
		if(!$stock_ids) return false;
		
		foreach ($stock_ids as $sid => $stocks){
			$exp_date = isset($stocks['exp_date']) ? (int)$stocks['exp_date'] : 0;
			$stock = isset($stocks['stock']) ? (int)$stocks['stock'] : 0;
			if($stock < 1) continue;
			ProductsStock::reduce("id='$sid'", 'stock', $stock);		//从库存和批号中减去
			OrdersProducts::insert(array('order_code'=> $order_code,'product_sku'=> $sku,'product_num'=> $stock,'exp_date'=> $exp_date));
		}
		$commit_status = DB::tranEnd('outStockInsertOrderProduct');
		return $commit_status;
	}
	
}


