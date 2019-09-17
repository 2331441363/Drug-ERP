package com.drug.dto;

import java.util.Date;

import com.drug.entity.PlanDO;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月10日 上午11:38:25
* 类说明：月生产计划DTO
*/
@Data
public class PlanDTO {
	/**
	 * 生产月计划id
	 */
	private String planId;
	
	/**
	 * 制定人id
	 */
	private Integer empId;
	
	/**
	 * 制定人姓名
	 */
	private String empName;
	
	/**
	 * 制定时间
	 */
	private Date planTime;
	
	/**
	 * 计划描述
	 */
	private String planComment;
	
	/**
	 * 开始时间
	 */
	private Date startTime;
	
	/**
	 * 开始时间-结束时间字符串
	 */
	private String time;
	/**
	 * 月计划结束时间
	 */
	private Date endTime;
	
	/**
	 * 月计划   计划完成数量
	 */
	private Integer plannedQuantity;
	
	/**
	 * 月计划  已完成数量
	 */
	private Integer actualQuantity;
	
	/**
	 * 月计划详情 计划完成数量
	 */
	private Integer planDetailQuantity;
	
	/**
	 * 月计划详情 已完成数量
	 */
	private Integer planDetailNumber;
	
	/**
	 * 药品id
	 */
	private Integer drugId;
	
	/**
	 * 审核人id
	 */
	private Integer auditId;
	
	/**
	 * 审核人姓名
	 */
	private String auditName;
	
	/**
	 * 审核时间
	 */
	private Date auditTime;
	
	/**
	 * 审核状态
	 */
	private Integer auditState;
	
	/**
	 * 审核备注
	 */
	private String auditComment;
	
	/**
	 * 搜索对象
	 */
	private PlanDO form;
}
