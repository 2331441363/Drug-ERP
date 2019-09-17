package com.drug.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* @author 李杰
* @version 创建时间：2019年9月10日 上午9:18:07
* 类说明 月计划详情
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlanDetailDO {
	/**
	 * 月计划详情编号
	 */
	private int planDetailId;
	
	/**
	 * 月计划id
	 */
	private String planId;
	
	/**
	 * 药品id
	 */
	private int drugId;
	
	/**
	 * 计划完成数量
	 */
	private int planDetailQuantity;
	
	/**
	 * 实际完成数量
	 */
	private int planDetailNumber;

	public PlanDetailDO(String planId, int drugId, int planDetailQuantity) {
		this.planId = planId;
		this.drugId = drugId;
		this.planDetailQuantity = planDetailQuantity;
	}
	
	
	
	
}
