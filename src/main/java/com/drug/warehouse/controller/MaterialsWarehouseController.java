package com.drug.warehouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.WarehouseDO;
import com.drug.util.ReturnDataUtils;
import com.drug.warehouse.service.MaterialsWarehouseService;

/**
 * @author 喻锦文
 * @version 创建时间：2019年9月6日 上午11:17:20 类说明
 */
@Controller
public class MaterialsWarehouseController {
	@Autowired
	private MaterialsWarehouseService materialsWarehouseService;

	/**
	 * 查询出原材料仓库所有数据
	 */
	@RequestMapping("/selectMaterialsWarehouse.do")
	public @ResponseBody Map<String, Object> selectMaterialsWarehouse(int page, int limit, String warehouseName,
			String materialsWarehouseName) {
		Map<String, Object> map = new HashMap<String, Object>();
		int page1 = (page - 1) * limit;
		map.put("page", page1);
		map.put("rows", limit);
		map.put("warehouseName", warehouseName);
		map.put("materialsWarehouseName", materialsWarehouseName);
		List<WarehouseDO> list = materialsWarehouseService.selectMaterialsWarehouse(map);
		int count = materialsWarehouseService.getMatCount();
		Map<String, Object> maps = ReturnDataUtils.responseByData();
		maps.put("data", list);
		maps.put("count", count);
		return maps;
	}

	/**
	 * 查询出所有原材料仓库
	 */
	@RequestMapping("/selectMaterialsWarehouseype.do")
	public @ResponseBody Map<String, Object> selectMaterialsWarehouseype() {
		List<WarehouseDO> list = materialsWarehouseService.selectMaterialsWarehouseype();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("code", 0);
		return map;
	}
}
