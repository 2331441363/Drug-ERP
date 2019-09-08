package com.drug.warehouse.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.WarehouseDO;
import com.drug.warehouse.mapper.MaterialsWarehouseMapper;
import com.drug.warehouse.service.MaterialsWarehouseService;

/**
 * @author 喻锦文
 * @version 创建时间：2019年9月6日 上午11:14:02 类说明
 */
@Service
public class MaterialsWarehouseImpl implements MaterialsWarehouseService {
	@Autowired
	private MaterialsWarehouseMapper materialsWarehouseMapper;

	/**
	 * 查询出原材料仓库所有数据
	 */
	@Override
	public List<WarehouseDO> selectMaterialsWarehouse(Map<String, Object> map) {
		return materialsWarehouseMapper.selectMaterialsWarehouse(map);
	}

	/**
	 * 查询出原材料仓库总行数
	 */
	@Override
	public int getMatCount() {
		return materialsWarehouseMapper.getMatCount();
	}

	/**
	 * 查询出所有原材料仓库
	 */
	@Override
	public List<WarehouseDO> selectMaterialsWarehouseype() {
		return materialsWarehouseMapper.selectMaterialsWarehouseype();
	}

}
