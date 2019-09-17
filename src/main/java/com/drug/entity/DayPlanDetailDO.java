package com.drug.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* @author 李杰
* @version 创建时间：2019年9月15日 下午3:20:54
* 类说明
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DayPlanDetailDO {
	/**
	 * 详细日计划编号
	 */
	private int dayPlanDetailId;
	
	/**
	 * 日计划id
	 */
	private String dayPlanId;
	
	/**
	 * 药品id
	 */
	private int drugId;
	
	/**
	 * 已生产数量
	 */
	private int planNumber;
	
	/**
	 * 计划生产数量
	 */
	private int dayPlanNumber;

	public DayPlanDetailDO(String dayPlanId, int drugId, int dayPlanNumber) {
		this.dayPlanId = dayPlanId;
		this.drugId = drugId;
		this.dayPlanNumber = dayPlanNumber;
	}
	
	
}
