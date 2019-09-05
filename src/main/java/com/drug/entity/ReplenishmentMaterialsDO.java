package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:原材料补料出库
 */
@Data
public class ReplenishmentMaterialsDO {
	/**
	 * 分店成品退货入库表id
	 */
	private int ReplenishmentMaterialsId;

	/**
	 * 员工表ID
	 */
	private int empId;

	/**
	 * 原材料仓库id
	 */
	private int MaterialsWarehouseId;

	/**
	 * 入库时间
	 */
	private String ReplenishmentMaterialsTime;

	/**
	 * 入库备注
	 */
	private String ReplenishmentMaterialsRemake;

	/**
	 * 审核状态，'0'为未审核 '1'为审核通过 '2'为审核不通过
	 */
	private int ReplenishmentMaterialsAudit ;

	/**
	 * 数据是否删除，'1'为删,'0'为不删
	 */
	private int IsDeleted;

	/**
	 * 生产补料单id
	 */
	private int SupplementaryId;
}
