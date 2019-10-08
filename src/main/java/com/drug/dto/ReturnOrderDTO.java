package com.drug.dto;

import org.joda.time.DateTime;

/**
* @author 肖影
* @version 创建时间：2019年9月24日 下午7:05:18
* 类说明 分店退货单DO
*/
public class ReturnOrderDTO {
	/**
	 * 退货订单编号
	 */
	private int returnId;
	/**
	 * 分店名称
	 */
	private String branchName;
	/**
	 * 商品名称
	 */
	private String drugName;
	/**
	 * 商品数量
	 */
	private int returnQuantity;
	/**
	 * 合计
	 */
	private double returnTotal;
	/**
	 * 退货时间
	 */
	private DateTime returnTime;
	/**
	 * 审核状态
	 */
	private String checkStatus;
	/**
	 * 收款状态
	 */
	private String receiptStatus;
	/**
	 * 是否显示
	 */
	private int isShow;

}
