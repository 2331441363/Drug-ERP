package com.drug.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月16日 上午9:59:32
* 类说明：日计划DTO
*/
@Data
public class DayPlanDTO {
	/**
	 * 日计划id
	 */
	private String dayPlanId;
	
	/**
	 * 制定人id
	 */
	private int empId;
	
	/**
	 * 制定人姓名
	 */
	private String empName;
	
	/**
	 * 制定时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date dayPlanTime;
	
	/**
	 * 计划生产日期
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date dayBeginTime;
	
	/**
	 * 审核人id
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
	 * 计划描述
	 */
	private String dayPlanComment;
	
	/**
	 * 计划完成数量
	 */
	private int dayPlannedQuantity;
	
	/**
	 * 实际完成数量
	 */
	private int dayDetailNumber;
	
	/**
	 * 是否删除
	 */
	private int isDeleted;
	
	/**
	 * 月计划id
	 */
	private String planId;
}
