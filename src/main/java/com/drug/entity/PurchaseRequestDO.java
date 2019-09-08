package com.drug.entity;

import lombok.Data;

/**
 * 采购申请
 * @author 成灿华
 *
 */
@Data
public class PurchaseRequestDO {
	/**
	 * 采购申请id
	 */
	private int purchaseRequestId;
	/**
	 * 员工id
	 */
	private String empId;
	/**
	 * 部门id
	 */
	private int departmentId;
	/**
	 * 审核状态
	 */
	private int audit;
	/**
	 * 申请时间
	 */
	private String timeOfApplication;
	/**
	 * 预计金额
	 */
	private double purchaseAmount;
	/**
	 * 申请原因
	 */
	private String cause;
	
	/**
	 * 构造方法
	 * @param empId 员工id
	 * @param departmentId 部门id
	 * @param purchaseAmount 预计金额
	 * @param cause 申请原因
	 */
	public PurchaseRequestDO(String empId, int departmentId, double purchaseAmount, String cause) {
		this.empId = empId;
		this.departmentId = departmentId;
		this.purchaseAmount = purchaseAmount;
		this.cause = cause;
	}
	/**
	 * 构造方法
	 * @param empId 员工id
	 * @param departmentId 部门id
	 * @param audit 审核状态
	 * @param timeOfApplication 申请时间
	 * @param purchaseAmount 预计金额
	 * @param cause 申请原因
	 */
	public PurchaseRequestDO(String empId, int departmentId, int audit, String timeOfApplication, double purchaseAmount,
			String cause) {
		super();
		this.empId = empId;
		this.departmentId = departmentId;
		this.audit = audit;
		this.timeOfApplication = timeOfApplication;
		this.purchaseAmount = purchaseAmount;
		this.cause = cause;
	}
	public PurchaseRequestDO() {
		super();
	}
	
}
