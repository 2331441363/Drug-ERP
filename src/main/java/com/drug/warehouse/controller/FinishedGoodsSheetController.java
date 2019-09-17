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
import com.drug.warehouse.service.FinishedGoodsSheetService;

@Controller
public class FinishedGoodsSheetController {
	@Autowired
	private FinishedGoodsSheetService finishedGoodsSheetService;

	/**
	 * 查询成品仓库所有信息
	 */
	@RequestMapping("/selectFinishedGoodsSheet.do")
	public @ResponseBody Map<String, Object> selectFinishedGoodsSheet(int page, int limit) {
		Map<String, Object> mapf = new HashMap<String, Object>();
		int page1 = (page - 1) * limit;
		mapf.put("page", page1);
		mapf.put("rows", limit);
		List<WarehouseDO> list = finishedGoodsSheetService.selectFinishedGoodsSheet(mapf);
		list.forEach(System.out::println);
		// 获取总行数
		int count = finishedGoodsSheetService.getFinCount();
		Map<String, Object> map = ReturnDataUtils.responseByData();
		map.put("data", list);
		map.put("count", count);
		return map;
	}
}
