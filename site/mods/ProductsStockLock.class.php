<?php
class ProductsStockLock extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_products_stock_lock';	
	
	static public function add($order_code, $product_sku, $product_num)
	{
		if(!$order_code || !$product_sku || !$product_num) return false;
		$stock_ids = ProductsStock::getSkuOutStock($product_sku, $product_num);
		if(!$stock_ids) return false;

		DB::tranBegin();	//事务开始
		foreach ($stock_ids as $id => $stocks){
			$exp_date = isset($stocks['exp_date']) ? (int)$stocks['exp_date'] : 0;
			$stock = isset($stocks['stock']) ? (int)$stocks['stock'] : 0;
			ProductsStockLock::insert(array('order_code'=>$order_code, 'product_sku'=>$product_sku, 'product_num'=>$stock, 'exp_date'=>$exp_date, 'create_time'=>time(), 'status'=>0));
			ProductsStock::reduce("id='$id'", 'stock', $stock);
		}
		$commit_status = DB::tranEnd();
		return $commit_status;
	}
	
	static public function changeStatus($order_code, $status)
	{
		if(!$order_code) return false;
		return self::update(array('order_code'=>$order_code), array('status'=>$status));
	}
	
}


