package com.drug.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
/**
* @author 肖影
* @version 创建时间：2019年9月9日 下午5:10:02
* 类说明：付款记录数据DTO
*/
@Data
public class PayDTO {
	//编号
	private Integer payId;
	//付款日期
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date payDate;
	//付款人
	private String empName;
	//部门
	private String departmentName;
	//分店
	private String branchName;
	//付款金额
	private double money;
	//付款类型
	private String payType;
	//付款备注
	private String payNote;
}
