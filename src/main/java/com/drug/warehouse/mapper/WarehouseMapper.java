package com.drug.warehouse.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.drug.entity.WarehouseDO;

@Repository
public interface WarehouseMapper {
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
