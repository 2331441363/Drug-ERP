package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:原材料仓库
 */
@Data
public class MaterialsWarehouseDO {
	/**
	 * 原材料仓库ID
	 */
	private int MaterialsWarehouseId;

	/**
	 * 药物名称
	 */
	private String MaterialsWarehouseName;

	/**
	 * 药物数量
	 */
	private int MaterialsWarehouseQuantity;

	/**
	 * 药物类型 
	 */
	private String MaterialsWarehouseType;
	
	/**
	 * 仓库管理信息表id
	 */
	private int WarehouseId;
}
