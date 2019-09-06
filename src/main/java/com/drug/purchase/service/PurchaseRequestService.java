package com.drug.purchase.service;

import com.drug.entity.PurchaseRequestDO;

public interface PurchaseRequestService {
	/**
	 * 新增采购申请信息
	 * @param p 采购申请对象
	 * @return int 返回一个int类型接收受影响的行数
	 */
	public int add(PurchaseRequestDO p);
}
