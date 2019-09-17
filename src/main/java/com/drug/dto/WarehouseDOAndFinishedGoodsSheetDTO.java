package com.drug.dto;

import com.drug.entity.FinishedGoodsSheetDO;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间：2019年9月5日 下午3:20:01 类说明:仓库管理信息表和成品仓库表关联
 */
@Data
public class WarehouseDOAndFinishedGoodsSheetDTO {
	/**
	 * 仓库信息管理ID
	 */
	private int warehouseId;

	/**
	 * 仓库名称
	 */
	private String warehouseName;

	/**
	 * 仓库类型
	 */
	private String warehouseType;

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

}
