package com.drug.warehouse.serviceImpl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.WarehouseDO;
import com.drug.warehouse.mapper.FinishedGoodsSheetMapper;
import com.drug.warehouse.service.FinishedGoodsSheetService;

@Service
public class FinishedGoodsSheetServiceImpl implements FinishedGoodsSheetService {
	@Autowired
	private FinishedGoodsSheetMapper finishedGoodsSheetMapper;

	/**
	 * 查询成品仓库所有信息
	 */
	@Override
	public List<WarehouseDO> selectFinishedGoodsSheet(Map<String, Object> mapf) {
		return finishedGoodsSheetMapper.selectFinishedGoodsSheet(mapf);
	}

	/**
	 * 查询成品仓库总行数
	 */
	@Override
	public int getFinCount() {
		return finishedGoodsSheetMapper.getFinCount();
	}

}
