package com.drug.entity;

import java.util.Date;

import lombok.Data;
@Data
public class Pay {
	//编号
	private Integer payId;
	//付款日期
	private Date payDate;
	//付款人
	private String payPerson;
	//部门
	private String dept;
	//分店
	private String payBranch;
	//公司账户
	private String companyAccount;
	//付款金额
	private double money;
	//付款类型
	private String payType;
	//付款备注
	private String payNote;

	
}
