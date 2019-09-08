package com.drug.entity;

import java.util.Date;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月5日 下午5:15:00
* 类说明
*/
@Data
public class ReceiptDO {
	//编号
		private Integer receiptId;
		//付款日期
		private Date receiptTime;
		//付款人
		private String receiptPayee;
		//部门
		private String receiptDept;
		//分店
		private String receiptBsubbranch;
		//公司账户
		private String receiptAccount;
		//付款金额
		private double receiptMoney;
		//付款类型
		private String receiptType;
		//付款备注
		private String receiptForm;
}
