package com.drug.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
* @author 李杰
* @version 创建时间：2019年9月15日 下午3:20:37
* 类说明
*/
@Data
@NoArgsConstructor
public class DayPlanDO {
	/**
	 * 日计划id
	 */
	private String dayPlanId;
	
	/**
	 * 制定人id
	 */
	private int empId;
	
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
	
	private List<DayPlanDetailDO> listDayPlanDetail;

}
