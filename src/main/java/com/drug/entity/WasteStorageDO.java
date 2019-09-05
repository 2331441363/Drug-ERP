package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:废料入库
 */
@Data
public class WasteStorageDO {
	/**
	 * 废料入库表id
	 */
	private int WasteStorageId;

	/**
	 * 员工表ID
	 */
	private int empId;

	/**
	 * 废料仓库id
	 */
	private int AbandonedWarehouseId;

	/**
	 * 入库时间
	 */
	private String WasteStorageTime;

	/**
	 * 入库备注
	 */
	private String WasteStorageRemake;

	/**
	 * 审核状态，'0'为未审核 '1'为审核通过 '2'为审核不通过
	 */
	private int WasteStorageAudit;

	/**
	 * 数据是否删除，'1'为删,'0'为不删
	 */
	private int IsDeleted;

	/**
	 * 原材料废料单id
	 */
	private int WasteId;
	
}
