package com.drug.entity;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午8:04:02
* 类说明：分店商品DO
*/
@Data
public class BranchGoodsDO {
	/**
	 * 商品id	
	 */
	private int branchGoodsId;
	/**
	 * 商品名称
	 */
	private String branchGoodsName;
	/**
	 * 商品单价
	 */
	private double branchGoodsPrice;
	/**
	 * 库存数量
	 */
	private int branchGoodsStoreQuantity;
}
