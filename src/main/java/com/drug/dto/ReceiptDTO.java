package com.drug.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月9日 下午5:10:02
* 类说明
*/
@Data
public class ReceiptDTO {
	
	/**
	 * 编号
	 */
	private Integer receiptId;
	
	/**
	 * 收款人
	 */
	private String empName;
	/**
	 * 收款时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date receiptTime;
	
	/**
	 * 部门
	 */
	private String departmentName;
	
	/**
	 * 分店
	 */
	private String branchName;
	
	/**
	 * 收款金额
	 */
	private double receiptMoney;
	
	/**
	 * /收款类型
	 */
	private String receiptType;
	
	/**
	 * 备注
	 */
	private String receiptForm;

}
