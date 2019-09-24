package com.drug.dto;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午8:11:43
* 类说明 分店销售详情DTO
*/
@Data
public class BranchSaleDetailDTO {
	
	/**
	 * 商品名称
	 */
	private String branchGoodsName;
	/**
	 *  销售数量	
	 */
	private int branchSaleQuantity;

}
