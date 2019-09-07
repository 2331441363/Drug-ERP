package com.drug.entity;

import lombok.Data;

/**
 * 采购申请详情
 * @author 成灿华
 *
 */
@Data
public class PurchaseRequestDetailsDO {
	//采购申请订单详情id
	private int purchaseRdId;
	//采购申请id
	private int purchaseRequestId;
	//原材料id
	private int materialId;
	//采购数量
	private int number;
	//小计
	private double subtotal;
	/**
	 * 空的构造方法
	 */
	public PurchaseRequestDetailsDO() {
	}
	/**
	 * 构造方法
	 * @param purchaseRequestId 采购申请id
	 * @param materialId 原材料id
	 * @param number 数量
	 * @param subtotal 小计
	 */
	public PurchaseRequestDetailsDO(int purchaseRequestId, int materialId, int number, double subtotal) {
		super();
		this.purchaseRequestId = purchaseRequestId;
		this.materialId = materialId;
		this.number = number;
		this.subtotal = subtotal;
	}
	/**
	 * 构造方法
	 * @param purchaseRequestId 采购申请id
	 * @param materialId 原材料id
	 * @param number 数量
	 */
	public PurchaseRequestDetailsDO(int purchaseRequestId, int materialId, int number) {
		super();
		this.purchaseRequestId = purchaseRequestId;
		this.materialId = materialId;
		this.number = number;
	}
	
}
