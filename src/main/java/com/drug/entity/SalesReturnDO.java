package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:分店成品退货入库
 */
@Data
public class SalesReturnDO {
	/**
	 * 分店成品退货入库表id
	 */
	private int SalesReturnId;

	/**
	 * 员工表ID
	 */
	private int empId;

	/**
	 * 成品仓库id
	 */
	private int FinishedGoodsSheetId;

	/**
	 * 入库时间
	 */
	private String SalesReturnTime;

	/**
	 * 入库备注
	 */
	private String SalesReturnRemake;

	/**
	 * 审核状态，'0'为未审核 '1'为审核通过 '2'为审核不通过
	 */
	private int SalesReturnAudit ;

	/**
	 * 数据是否删除，'1'为删,'0'为不删
	 */
	private int IsDeleted;

	/**
	 * 分店退货表id
	 */
	private int returnedId ;
}
