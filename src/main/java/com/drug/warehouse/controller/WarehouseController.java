package com.drug.warehouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.WarehouseDO;
import com.drug.util.ToolClass;
import com.drug.warehouse.service.WarehouseService;

@Controller
public class WarehouseController {
	@Autowired
	private WarehouseService warehouseService;

	@Autowired
	private WarehouseDO warehouseDO;

	/**
	 * 查询所有仓库信息
	 */
	@RequestMapping("/getWarehouse.do")
	public @ResponseBody Map<String, Object> getWarehouse(int page, int limit,String WarehouseType) {
		Map<String, Object> map1 = new HashMap<String, Object>();
		int page1 = (page - 1) * limit;
		map1.put("page", page1);
		map1.put("rows", limit);
		map1.put("warehouseType", WarehouseType);
		List<WarehouseDO> list = warehouseService.getWarehouse(map1);
		// 获取总行数
		int count = warehouseService.getCount();
		Map<String, Object> map = ToolClass.responseByData();
		map.put("data", list);
		map.put("count", count);
		return map;
	}

	/**
	 * 仓库管理新增仓库
	 */
	@RequestMapping("/insertWarehouse.do")
	public String insertWarehouse(int empId, String WarehouseName, String WarehouseType, String WarehouseTime) {
		// 生成随机数
		int max = 1000000, min = 1;
		long randomNum = System.currentTimeMillis();
		int ran3 = (int) (randomNum % (max - min) + min);
		String ran4 = "FATE" + ran3;
		// 赋值给warehouseDO类
		warehouseDO.setEmpId(empId);
		warehouseDO.setWarehouseName(WarehouseName);
		warehouseDO.setWarehouseType(WarehouseType);
		warehouseDO.setWarehouseTime(WarehouseTime);
		warehouseDO.setWarehouseSerial(ran4);
		// 调用warehouseService
		int row = warehouseService.insertWarehouse(warehouseDO);
		// 进行判断大于0则新增成功，小于0对于0则新增失败
		if (row > 0) {
			// 新增成功后重新查询数据
			return "redirect:/admin/warehouse/Warehouse.jsp";
		} else {
			// 新增失败后重新查询数据
			return "redirect:/admin/warehouse/Warehouse.jsp";
		}
	}
}
