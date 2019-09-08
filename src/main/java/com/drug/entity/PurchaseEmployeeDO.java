package com.drug.entity;

import lombok.Data;
/**
 * 采购申请视图
 * @author 成灿华
 *
 */
@Data
public class PurchaseEmployeeDO {
	/**
	 * 采购申请id
	 */
	private int purchaseRequestId;
	/**
	 * 员工id
	 */
	private String empId;
	/**
	 * 员工姓名
	 */
	private String empName;
	/**
	 * 部门编号
	 */
	private int departmentId;
	/**
	 * 部门名称
	 */
	private String departmentName;
	/**
	 * 审核状态
	 */
	private int audit;
	/**
	 * 审核状态
	 */
	private String auditStatus;
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
	 * @param purchaseRequestId 采购申请编号
	 * @param empName 员工姓名
	 * @param departmentName 所属部门
	 * @param auditStatus 审核状态
	 * @param timeOfApplication 申请时间
	 * @param purchaseAmount 预计金额
	 * @param cause 申请原因
	 */
	public PurchaseEmployeeDO(int purchaseRequestId, String empName, String departmentName, String auditStatus,
			String timeOfApplication, double purchaseAmount, String cause) {
		this.purchaseRequestId = purchaseRequestId;
		this.empName = empName;
		this.departmentName = departmentName;
		this.auditStatus = auditStatus;
		this.timeOfApplication = timeOfApplication;
		this.purchaseAmount = purchaseAmount;
		this.cause = cause;
	}
	/**
	 * 构造方法
	 * @param purchaseRequestId 采购申请编号
	 * @param empId 员工id
	 * @param empName 员工姓名
	 * @param departmentId 部门id
	 * @param departmentName 所属部门
	 * @param audit 审核状态
	 * @param timeOfApplication 申请时间
	 * @param purchaseAmount 预计金额
	 * @param cause 申请原因
	 */
	public PurchaseEmployeeDO(int purchaseRequestId, String empId, String empName, int departmentId,
			String departmentName, int audit, String timeOfApplication, double purchaseAmount, String cause) {
		this.purchaseRequestId = purchaseRequestId;
		this.empId = empId;
		this.empName = empName;
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.audit = audit;
		this.timeOfApplication = timeOfApplication;
		this.purchaseAmount = purchaseAmount;
		this.cause = cause;
	}
	public PurchaseEmployeeDO() {
		super();
	}
	
	
	
	
	
}
