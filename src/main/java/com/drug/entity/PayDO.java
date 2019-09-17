package com.drug.entity;

import java.util.Date;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 上午10:35:23
* 类说明
*/
@Data
public class PayDO {
	/**
	 * 编号
	 */
	private int pay_id;
	/**
	 * 付款日期
	 */
	private Date pay_date;
	/**
	 * 员工id
	 */
	private int emp_id;
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
	private String pay_type;
	/**
	 * 付款备注
	 */
	private String pay_note;
	/**
	 * 是否显示
	 */
	private int is_show;
}
