package com.drug.dto;

import java.util.Date;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月16日 下午3:04:53
* 类说明生产订单DTO
*/
@Data
public class OrderPlanDTO {
	/**
	 * 生产订单id
	 */
	private String orderPlanId;
	
	/**
	 * 负责人id
	 */
	private int empId;
	
	/**
	 * 负责人姓名
	 */
	private String empName;
	
	/**
	 * 创建时间
	 */
	private Date orderPlanTime;
	
	/**
	 * 审核人编号
	 */
	private int auditId;
	
	/**
	 * 审核时间
	 */
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
