package com.drug.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月16日 下午2:42:56
* 类说明:生产订单DO
*/
@Data	
public class OrderPlanDO {
	/**
	 * 生产订单id
	 */
	private String orderPlanId;
	
	/**
	 * 负责人id
	 */
	private int empId;
	
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date orderPlanTime;
	
	/**
	 * 审核人编号
	 */
	private int auditId;
	
	/**
	 * 审核时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date auditTime;
	
	/**
	 * 审核状态
	 */
	private String auditState;
	
	/**
	 * 审核备注
	 */
	private String auditComment;
	
	/**
	 * 订单生产状态
	 */
	private int orderState;
	
	/**
	 * 生产入库状态
	 */
	private int orderEntryState;
	/**
	 * 是否领料
	 */
	private int isPicking;
	
	/**
	 * 逻辑删除
	 */
	private int isDeleted;
	
	/**
	 * 日计划id
	 */
	private String dayPlanId;
	
	/**
	 * 计划生产数量
	 */
	private int orderPlanNumber;
	
	/**
	 * 实际完成总数量
	 */
	private int orderDetailNumber;
	
	/**
	 * 订单备注
	 */
	private String orderComment;

}
