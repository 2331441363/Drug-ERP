package com.drug.purchase.service;


import java.util.List;

import com.drug.entity.PurchaseEmployeeDO;

public interface PurchaseEmployeeService {
	/**
	 * 查询采购申请中所有的数据
	 * @return List<PurchaseEmployee> 采购申请对象
	 */
	public List<PurchaseEmployeeDO> showPurchaseEmployee();
	
	/**
	 * 查询采购申请中数据总条数
	 * @return int 返回一个int类型接收数据总条数
	 */
	public int countPage();
}
