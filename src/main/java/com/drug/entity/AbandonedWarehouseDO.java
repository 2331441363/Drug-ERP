package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:废弃仓库
 */
@Data
public class AbandonedWarehouseDO {
	/**
	 * 废弃仓库ID
	 */
	private int AbandonedWarehouseId;

	/**
	 * 药物名称
	 */
	private String AbandonedWarehouseName;

	/**
	 * 药物数量
	 */
	private int AbandonedWarehouseQuantity;

	/**
	 * 药物类型 
	 */
	private String AbandonedWarehouseType;
	
	/**
	 * 仓库管理信息表id
	 */
	private int WarehouseId;
}
