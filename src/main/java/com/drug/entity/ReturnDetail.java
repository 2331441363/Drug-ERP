package com.drug.entity;

public class ReturnDetail {
	//退货订单详情编号
	private int return_detail_id;
	//退货订单编号
	private int return_id;
	//成品id
	private int return_product_id;
	//药品单价
	private double return_price;
	//退货数量
	private int return_quantity;
	//分店id
	private int return_branch_id;
	public int getReturn_detail_id() {
		return return_detail_id;
	}
	public void setReturn_detail_id(int return_detail_id) {
		this.return_detail_id = return_detail_id;
	}
	public int getReturn_id() {
		return return_id;
	}
	public void setReturn_id(int return_id) {
		this.return_id = return_id;
	}
	public int getReturn_product_id() {
		return return_product_id;
	}
	public void setReturn_product_id(int return_product_id) {
		this.return_product_id = return_product_id;
	}
	public double getReturn_price() {
		return return_price;
	}
	public void setReturn_price(double return_price) {
		this.return_price = return_price;
	}
	public int getReturn_quantity() {
		return return_quantity;
	}
	public void setReturn_quantity(int return_quantity) {
		this.return_quantity = return_quantity;
	}
	public int getReturn_branch_id() {
		return return_branch_id;
	}
	public void setReturn_branch_id(int return_branch_id) {
		this.return_branch_id = return_branch_id;
	}
	public ReturnDetail(int return_detail_id, int return_id, int return_product_id, double return_price,
			int return_quantity, int return_branch_id) {
		super();
		this.return_detail_id = return_detail_id;
		this.return_id = return_id;
		this.return_product_id = return_product_id;
		this.return_price = return_price;
		this.return_quantity = return_quantity;
		this.return_branch_id = return_branch_id;
	}
	
	public ReturnDetail() {}
	
}
