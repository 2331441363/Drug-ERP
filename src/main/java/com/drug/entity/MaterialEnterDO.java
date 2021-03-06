package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:原材料入库
 */
@Data
public class MaterialEnterDO {
	/**
	 * 原材料入库表id
	 */
	private int MaterialEnterId;

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
	private String MaterialEnterTime;

	/**
	 * 入库备注
	 */
	private String MaterialEnterRemake;

	/**
	 * 审核状态，'0'为未审核 '1'为审核通过 '2'为审核不通过
	 */
	private int MaterialEnterAudit;

	/**
	 * 数据是否删除，'1'为删,'0'为不删
	 */
	private int IsDeleted;

	/**
	 * 采购订单表id
	 */
	private int PurchaseId;
}
