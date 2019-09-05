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
	private int depId;
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
}
