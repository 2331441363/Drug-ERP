package com.drug.entity;

import java.util.Date;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 上午10:35:23
* 类说明：付款单DO
*/
@Data
public class PayDO {
	/**
	 * 编号
	 */
	private int payId;
	/**
	 * 付款日期
	 */
	private Date payDate;
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
	 * 付款金额
	 */
	private double money;
	/**
	 * 付款类型
	 */
	private String payType;
	/**
	 * 付款备注
	 */
	private String payNote;
	/**
	 * 是否显示
	 */
	private int isShow;
}
