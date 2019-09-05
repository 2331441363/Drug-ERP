package com.drug.entity;

import lombok.Data;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:成品商品入库
 */
@Data
public class FinishedGoodsDO {
	/**
	 * 成品商品入库表id
	 */
	private int FnishedGoodsId;

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
	private String FinishedGoodsTime;

	/**
	 * 入库备注
	 */
	private String FinishedGoodsRemake;

	/**
	 * 审核状态，'0'为未审核 '1'为审核通过 '2'为审核不通过
	 */
	private int FinishedGoodsAudit ;

	/**
	 * 数据是否删除，'1'为删,'0'为不删
	 */
	private int IsDeleted;

	/**
	 * 日生产订单表id
	 */
	private int OrderPlanId;
}
