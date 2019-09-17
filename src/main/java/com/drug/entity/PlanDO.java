package com.drug.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月10日 上午9:06:09
* 类说明：月计划DO
*/
@Data
public class PlanDO {
	/**
	 * 生产月计划id
	 */
	private String planId;
	
	/**
	 * 制定人id
	 */
	private int empId;
	
	/**
	 * 制定时间
	 */
	private Date planTime;
	
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
	private String planComment;

	/**
	 * 开始时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM") 
	private Date startTime;
	
	/**
	 * 结束时间
	 */
	private Date endTime;
	
	/**
	 * 计划完成数量
	 */
	private int plannedQuantity;
	
	/**
	 * 实际完成数量
	 */
	private int actualQuantity;
	
	/**
	 * 逻辑删除
	 */
	private int isDeleted;
	
	private List<PlanDetailDO> listDetailDO; 

	public List<PlanDetailDO> getListDetailDO() {
		return listDetailDO;
	}

	public void setListDetailDO(List<PlanDetailDO> listDetailDO) {
		this.listDetailDO = listDetailDO;
	}




	public PlanDO(String planId, int empId, Date planTime, String planComment, Date startTime, Date endTime,
			int plannedQuantity) {
		this.planId = planId;
		this.empId = empId;
		this.planTime = planTime;
		this.planComment = planComment;
		this.startTime = startTime;
		this.endTime = endTime;
		this.plannedQuantity = plannedQuantity;
	}
	
	
	
	
	public PlanDO(String planId, int empId, Date planTime, int auditId, Date auditTime, String auditState,
			String auditComment, String planComment, Date startTime, Date endTime, int plannedQuantity,
			int actualQuantity, int isDeleted) {
		super();
		this.planId = planId;
		this.empId = empId;
		this.planTime = planTime;
		this.auditId = auditId;
		this.auditTime = auditTime;
		this.auditState = auditState;
		this.auditComment = auditComment;
		this.planComment = planComment;
		this.startTime = startTime;
		this.endTime = endTime;
		this.plannedQuantity = plannedQuantity;
		this.actualQuantity = actualQuantity;
		this.isDeleted = isDeleted;
	}



	

	public PlanDO(String planId, int auditId, Date auditTime, String auditState, String auditComment) {
		this.planId = planId;
		this.auditId = auditId;
		this.auditTime = auditTime;
		this.auditState = auditState;
		this.auditComment = auditComment;
	}




	public PlanDO() {
	}



	public PlanDO(String planId) {
		this.planId = planId;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public Date getPlanTime() {
		return planTime;
	}

	public void setPlanTime(Date planTime) {
		this.planTime = planTime;
	}

	public int getAuditId() {
		return auditId;
	}

	public void setAuditId(int auditId) {
		this.auditId = auditId;
	}

	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}

	public String getAuditState() {
		return auditState;
	}

	public void setAuditState(String auditState) {
		this.auditState = auditState;
	}

	public String getAuditComment() {
		return auditComment;
	}

	public void setAuditComment(String auditComment) {
		this.auditComment = auditComment;
	}

	public String getPlanComment() {
		return planComment;
	}

	public void setPlanComment(String planComment) {
		this.planComment = planComment;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public int getPlannedQuantity() {
		return plannedQuantity;
	}

	public void setPlannedQuantity(int plannedQuantity) {
		this.plannedQuantity = plannedQuantity;
	}

	public int getActualuantity() {
		return actualQuantity;
	}

	public void setActualuantity(int actualQuantity) {
		this.actualQuantity = actualQuantity;
	}

	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	

}
