package com.drug.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午8:08:52
* 类说明：分店销售订单DO
*/
@Data
public class BranchSaleOrderDO {

	/**
	 * 订单id	
	 */
	private int branchSaleId;
	/**
	 * 销售时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date branchSaleTime;
	/**
	 * 销售总金额
	 */
	private double branchSaleTotal;
	/**
	 * 收款状态
	 */
	private int branchSaleReceiptStatus;

}
