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
import com.drug.warehouse.service.AbandonService;

/**
* @author 喻锦文
* @version 创建时间：2019年9月7日 上午10:18:51
* 类说明
*/
@Controller
public class AbandonController {
	@Autowired
	private AbandonService  abandonService;
	/**
	 * 查询成品仓库所有信息
	 */
	@RequestMapping("/selectAbandonedWarehouseUBW.do")
	public @ResponseBody Map<String, Object> selectAbandonedWarehouseUBW(int page, int limit, String warehouseName,
			String abandonedWarehouseName) {
		Map<String, Object> mapf = new HashMap<String, Object>();
		int page1 = (page - 1) * limit;
		mapf.put("page", page1);
		mapf.put("rows", limit);
		mapf.put("warehouseName", warehouseName);
		mapf.put("abandonedWarehouseName", abandonedWarehouseName);
		List<WarehouseDO> list = abandonService.selectAbandonedWarehouseUBW(mapf);
		list.forEach(System.out::println);
		// 获取总行数
		int count = abandonService.getAbaCount();
		Map<String, Object> map = ReturnDataUtils.responseByData();
		map.put("data", list);
		map.put("count", count);
		return map;
	}

	/**
	 * 查询出所有成品仓库
	 */
	@RequestMapping("/selectAbandonedWarehouse.do")
	public @ResponseBody Map<String, Object> selectAbandonedWarehouse() {
		List<WarehouseDO> list = abandonService.selectAbandonedWarehouse();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		map.put("code", 0);
		return map;
	}
}

