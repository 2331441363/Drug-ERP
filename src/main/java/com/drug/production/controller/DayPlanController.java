package com.drug.production.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.dto.DayPlanDTO;
import com.drug.entity.DayPlanDO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.production.service.DayPlanService;
import com.drug.util.ReturnDataUtils;

/**
* @author 李杰
* @version 创建时间：2019年9月15日 下午5:34:15
* 类说明：日生产计划Controller
*/
@Controller
public class DayPlanController {
	@Autowired
	private DayPlanService dayPlanService;
	
	/**
	 * 制定生产日计划
	 * @param dayplanDO 日生产DO 
	 * @return 结果
	 */
	@RequestMapping("/insertDayPlan")
	@ResponseBody
	public String insertDayPlan(DayPlanDO dayPlanDO) {
		return dayPlanService.insertByDayPlan(dayPlanDO);
	}
	
	/**
	 * 查询所有日计划
	 */
	@RequestMapping("/getAllDayPlan")
	@ResponseBody
	public Map<String, Object> getAllDayPlan(DayPlanDO dayPlanDO,LayuiTablePageDO layuiTablePageDO) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("dayPlan", dayPlanDO);	//要搜索的日计划
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		map.put("endRow", layuiTablePageDO.getEndRow());
		//查询分页后数据
		List<DayPlanDTO> listDayPlan = dayPlanService.getDayPlan(map);
		//查询总行数
		int sumRow = dayPlanService.getSumLineDayPlan(map);
		//调用返回数据工具类
		Map<String, Object> util = ReturnDataUtils.responseByData();
		util.put("data", listDayPlan);	//数据
		util.put("count", sumRow);	//总行数
		return util;
	}
	
	/**
	 * 审核日计划
	 * @param dayPlan 审核对象
	 * @return 结果
	 */
	@RequestMapping("/auditDayPlan")
	@ResponseBody
	public String updateAuditPlan(DayPlanDO dayplan) {
		int row = dayPlanService.updateAuditState(dayplan);
		if(row > 0) {
			return "true";
		}
		return "false";
	}
	
}
