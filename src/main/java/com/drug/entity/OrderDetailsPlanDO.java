package com.drug.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
* @author 李杰
* @version 创建时间：2019年9月16日 下午2:51:13
* 类说明：生产订单详情DO
*/
@Data
@NoArgsConstructor
public class OrderDetailsPlanDO {
	/**
	 * 生产订单详情id
	 */
	private int orderDetailsPlanId;
	
	/**
	 * 生产订单id
	 */
	private String orderPlanId;
	
	/**
	 * 药品id
	 */
	private int drugId;
	
	/**
	 * 已生产数量
	 */
	private int planNumber;
	
	/**
	 * 计划完成数量
	 */
	private int orderDetailsPlanNumber;

	public OrderDetailsPlanDO(String orderPlanId, int drugId, int orderDetailsPlanNumber) {
		super();
		this.orderPlanId = orderPlanId;
		this.drugId = drugId;
		this.orderDetailsPlanNumber = orderDetailsPlanNumber;
	}
	
	
	
}
