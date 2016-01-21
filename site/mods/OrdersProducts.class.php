<?php
class OrdersProducts extends ABase
{
	static public $_class = __CLASS__;
	static public $_table = '#_orders_products';
	
	
	static public function getUserProducts($order_code)
	{
		//DB::Debug();
		if(!$order_code) return array();
		$table = self::table();
		$productsku_table = ProductsSku::table();
		$productitem_table = ProductsItem::table();
		
		$sql = "SELECT a.product_num, a.exp_date, b.id as skuid, b.sku, b.attribute_id, b.sku_name, b.old_price, b.current_price, c.id as itemid, c.item, c.title, c.category_id
		FROM $table AS a, $productsku_table AS b, $productitem_table AS c WHERE b.item=c.item AND b.sku=a.product_sku AND a.order_code='$order_code'";
		$prodcuts = DB::GetQueryResult($sql, false);
		return $prodcuts;
	}
	
	static public function getUserProductsNum($user_code)
	{
		if(!$user_code) return array();
		$table = self::table();
		$order_table = Orders::table();
		$sql = "SELECT SUM(a.product_num) AS product_num FROM $table AS a, $order_table AS b WHERE (RIGHT(b.order_code,2)='SK' OR LEFT(b.order_code,4)='FXAD') AND b.order_code=a.order_code AND b.order_status=5 AND b.user_code='$user_code'";
		$product_nums = DB::GetQueryResult($sql, true);
		$product_nums = isset($product_nums['product_num']) ? (int)$product_nums['product_num'] : 0;
		return $product_nums;
	}
	
	static public function getSkuAllNum($sku)
	{
		if(!$sku) return array();
		$table = self::table();
		$order_table = Orders::table();
		$sql = "SELECT SUM(a.product_num) AS product_num FROM $table AS a, $order_table AS b WHERE b.order_code=a.order_code AND b.order_status IN (2,3,4,5) AND a.product_sku='$sku'";
		$product_nums = DB::GetQueryResult($sql, true);
		$product_nums = isset($product_nums['product_num']) ? (int)$product_nums['product_num'] : 0;
		return $product_nums;
	}
	
	static public function getOrderSku($order_code)
	{
		if(!$order_code) return array();
		
		$table = self::table();
		$sku_table = ProductsSku::table();
		$item_table = ProductsItem::table();
		$pic_table = ProductsPic::table();
		
		$sql = "SELECT c.title, b.sku, b.sku_name, b.item, b.current_price, SUM(a.product_num) AS product_num
		FROM $table AS a, $sku_table AS b, $item_table AS c
		WHERE c.item=b.item AND a.product_sku=b.sku AND a.order_code='$order_code' GROUP BY a.product_sku";
		$rs = DB::GetQueryResult($sql, false);

		return $rs;
	}
	
	static public function updateOrderProductStock($order_code)
	{
		if(!$order_code) return false;

		$stocklocks = ProductsStockLock::getList("order_code='$order_code'", '*', 'id ASC');
		if(!$stocklocks) return false;
		foreach ($stocklocks as $stocklock){
			$product_sku = $stocklock['product_sku'];
			$product_num = $stocklock['product_num'];
			$exp_date = $stocklock['exp_date'];
			
			$orderpro = OrdersProducts::getOne(array("order_code"=>$order_code, 'product_sku'=>$product_sku), 'id, exp_date');
			$id = isset($orderpro['id']) ? (int)$orderpro['id'] : 0;
			$expdate = isset($orderpro['exp_date']) ? (int)$orderpro['exp_date'] : 0;
			if($id && !$expdate){
				OrdersProducts::update($id, array('product_num'=>$product_num, 'exp_date' => $exp_date));
			}else{
				$data = array(
					'order_code'		=> $order_code,
					'product_sku'		=> $product_sku,
					'product_num'		=> $product_num,
					'exp_date'			=> $stocklock['exp_date']
				);
				OrdersProducts::insert($data);
			}
		}
	}
	
}


