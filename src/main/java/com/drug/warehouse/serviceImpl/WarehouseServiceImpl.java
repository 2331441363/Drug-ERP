package com.drug.warehouse.serviceImpl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.WarehouseDO;
import com.drug.warehouse.mapper.WarehouseMapper;
import com.drug.warehouse.service.WarehouseService;
	
@Service
public class WarehouseServiceImpl implements WarehouseService {
	@Autowired
	private WarehouseMapper warehouseMapper;

	/***
	 * 仓库管理新增仓库
	 */
	@Override
	public int insertWarehouse(WarehouseDO warehouseDO) {
		return warehouseMapper.insertWarehouse(warehouseDO);
	}

	/**
	 * 查询所有仓库信息
	 */
	@Override
	public List<WarehouseDO> getWarehouse(Map<String, Object> map1) {
		return warehouseMapper.getWarehouse(map1);
	}

	/**
	 * 查询仓库信息的总行数
	 */
	@Override
	public int getCount() {
		return warehouseMapper.getCount();
	}

}
