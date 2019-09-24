package com.drug.entity;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午8:00:53
* 类说明：分店销售详情DO
*/
@Data
public class BranchSaleDetailDO {
	/**
	 * 详情单id
	 */
	private int branchSaleDetailId;
	/**
	 * 订单id
	 */
	private int branchSaleId;
	/**
	 * 商品id
	 */
	private int branchGoodsId;
	/**
	 * 销售数量
	 */
	private int branchSaleQuantity;
}
