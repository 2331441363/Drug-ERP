package com.drug.warehouse.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.WarehouseDO;
import com.drug.warehouse.mapper.AbandonMapper;
import com.drug.warehouse.service.AbandonService;

/**
 * @author 喻锦文
 * @version 创建时间：2019年9月7日 上午10:14:29 类说明
 */
@Service
public class AbandonServiceImpl implements AbandonService {
	@Autowired
	private AbandonMapper abandonMapper;

	/**
	 * 查询出原材料仓库所有数据
	 */
	@Override
	public List<WarehouseDO> selectAbandonedWarehouseUBW(Map<String, Object> map) {
		return abandonMapper.selectAbandonedWarehouseUBW(map);
	}

	/**
	 * 查询出原材料仓库总行数
	 */
	@Override
	public int getAbaCount() {
		return abandonMapper.getAbaCount();
	}

	/**
	 * 查询出所有原材料仓库
	 */
	@Override
	public List<WarehouseDO> selectAbandonedWarehouse() {
		return abandonMapper.selectAbandonedWarehouse();
	}

}
