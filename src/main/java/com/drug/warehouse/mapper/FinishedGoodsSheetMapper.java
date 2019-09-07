package com.drug.warehouse.mapper;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import com.drug.entity.WarehouseDO;

@Repository
public interface FinishedGoodsSheetMapper {
	/**
	 * 查询成品仓库所有信息
	 */
	public List<WarehouseDO> selectFinishedGoodsSheet(Map<String, Object> mapf);

	/**
	 * 查询成品仓库总行数
	 */
	public int getFinCount();

	/**
	 * 查询出所有成品仓库
	 */
	public List<WarehouseDO> selectWarehouseType();
}
