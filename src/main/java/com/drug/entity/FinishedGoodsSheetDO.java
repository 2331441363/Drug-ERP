package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:成品仓库
 */
@Data
public class FinishedGoodsSheetDO {
	/**
	 * 成品仓库ID
	 */
	private int finishedGoodsSheetId;

	/**
	 * 药物名称
	 */
	private String finishedGoodsSheetName;

	/**
	 * 药物数量
	 */
	private int finishedGoodsSheetQuantity;

	/**
	 * 药物类型 
	 */
	private String finishedGoodsSheetType;
	
	/**
	 * 仓库管理信息表id
	 */
	private int warehouseId;
}
