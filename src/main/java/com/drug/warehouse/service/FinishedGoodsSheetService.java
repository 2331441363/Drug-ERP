package com.drug.warehouse.service;


import java.util.List;
import java.util.Map;

import com.drug.entity.WarehouseDO;

public interface FinishedGoodsSheetService {
	/**
	 * 查询成品仓库所有信息
	 */
	public List<WarehouseDO> selectFinishedGoodsSheet(Map<String, Object> mapf);
	
	/**
	 * 查询成品仓库总行数
	 */
	public int getFinCount();
}
