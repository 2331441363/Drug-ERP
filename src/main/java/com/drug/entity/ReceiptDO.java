package com.drug.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午4:46:44
* 类说明：收款单DO
*/
@Data
public class ReceiptDO {

	/**
	 * 编号
	 */
	private int receiptId;
	/**
	 * 收款日期
	 */
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date receiptTime;
	/**
	 * 员工id
	 */
	private int empId;
	/**
	 * 部门id
	 */
	private int departmentId;
	/**
	 * 分店id
	 */
	private int branchId;
	/**
	 * 收款金额
	 */
	private double receiptMoney;
	/**
	 * 收款状态
	 */
	private String receiptStatus;
	/**
	 * 收款类型
	 */
	private String receiptType;
	/**
	 * 收款备注
	 */
	private String receiptForm;
	/**
	 * 是否显示
	 */
	private int isShow;

}
