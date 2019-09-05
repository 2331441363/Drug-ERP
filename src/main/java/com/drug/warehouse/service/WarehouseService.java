package com.drug.warehouse.service;


import java.util.List;
import java.util.Map;

import com.drug.entity.WarehouseDO;

public interface WarehouseService {
	/***
	 * 仓库管理新增仓库
	 */
	public int insertWarehouse(WarehouseDO warehouseDO);
	
	/**
	 * 查询所有仓库信息
	 */
	public List<WarehouseDO> getWarehouse(Map<String, Object> map1);
	
	/**
	 * 查询仓库信息的总行数
	 */
	public int getCount();
}
