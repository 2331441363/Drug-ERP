package com.drug.entity;
import java.util.Date;

public class ReturnOrder {
	//退货订单编号
	private int return_id;
	//合计
	private double return_total;
	//退货时间
	private Date return_time;
	//审核状态
	private String check_status;
	
	public int getReturn_id() {
		return return_id;
	}
	public void setReturn_id(int return_id) {
		this.return_id = return_id;
	}
	public double getReturn_total() {
		return return_total;
	}
	public void setReturn_total(double return_total) {
		this.return_total = return_total;
	}
	public Date getReturn_time() {
		return return_time;
	}
	public void setReturn_time(Date return_time) {
		this.return_time = return_time;
	}
	public String getCheck_status() {
		return check_status;
	}
	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}
	public ReturnOrder(int return_id, double return_total, Date return_time, String check_status) {
		super();
		this.return_id = return_id;
		this.return_total = return_total;
		this.return_time = return_time;
		this.check_status = check_status;
	}

	public ReturnOrder() {}
		
}
