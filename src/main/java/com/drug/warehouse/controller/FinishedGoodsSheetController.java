package com.drug.warehouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.util.StandardSessionIdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.WarehouseDO;
import com.drug.util.ReturnDataUtils;
import com.drug.warehouse.service.FinishedGoodsSheetService;

@Controller
public class FinishedGoodsSheetController {
	@Autowired
	private FinishedGoodsSheetService finishedGoodsSheetService;

	/**
	 * 查询成品仓库所有信息
	 */
	@RequestMapping("/selectFinishedGoodsSheet.do")
	public @ResponseBody Map<String, Object> selectFinishedGoodsSheet(int page, int limit, String warehouseName,
			String finishedGoodsSheetName) {
		System.out.println(warehouseName + "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
		System.out.println(finishedGoodsSheetName + "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
		Map<String, Object> mapf = new HashMap<String, Object>();
		int page1 = (page - 1) * limit;
		mapf.put("page", page1);
		mapf.put("rows", limit);
		mapf.put("warehouseName", warehouseName);
		mapf.put("finishedGoodsSheetName", finishedGoodsSheetName);
		List<WarehouseDO> list = finishedGoodsSheetService.selectFinishedGoodsSheet(mapf);
		list.forEach(System.out::println);
		// 获取总行数
		int count = finishedGoodsSheetService.getFinCount();
		Map<String, Object> map = ReturnDataUtils.responseByData();
		map.put("data", list);
		map.put("count", count);
		return map;
	}

	/**
	 * 查询出所有成品仓库
	 */
	@RequestMapping("/selectWarehouseType.do")
	public @ResponseBody Map<String, Object> selectWarehouseType() {
		List<WarehouseDO> list = finishedGoodsSheetService.selectWarehouseType();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("code", 0);
		return map;
	}
}
