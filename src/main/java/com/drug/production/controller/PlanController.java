package com.drug.production.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.dto.PlanDTO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.entity.PlanDO;
import com.drug.production.service.PlanService;
import com.drug.util.ReturnDataUtils;

/**
* @author 李杰
* @version 创建时间：2019年9月12日 上午9:06:02
* 类说明:月计划controller
*/
@Controller
public class PlanController {
	@Autowired
	private PlanService planService;
	
	@RequestMapping("/insertPlan")
	@ResponseBody
	public String insertPlan(@RequestBody Map<String,List<PlanDTO>> data) {
		int row = planService.insertPlan(data);
		return row+"";
	}
	
	/**
	 * 查询所有月计划
	 */
	@RequestMapping("/queryPlan")
	@ResponseBody
	public Map<String, Object> getAllEmploye(PlanDO planDO,LayuiTablePageDO layuiTablePageDO) {
		planDO.toString();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("plan", planDO);	//要搜索的月计划
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		map.put("endRow", layuiTablePageDO.getEndRow());
		//查询分页后数据
		List<PlanDTO> listPlan = planService.getAllPlan(map);
		//查询总行数
		int sumRow = planService.getSumLinePlan(map);
		//调用返回数据工具类
		Map<String, Object> util = ReturnDataUtils.responseByData();
		util.put("data", listPlan);	//数据
		util.put("count", sumRow);	//总行数
		return util;
	}
	
	
	/**
	 * 审核月计划
	 * @param plan 审核对象
	 * @return 结果
	 */
	@RequestMapping("/auditPlan")
	@ResponseBody
	public String updateAuditPlan(PlanDO plan) {
		System.out.println(plan.getPlanId());
		System.out.println(plan.getAuditTime()+"============-");
		int row = planService.updateAuditState(plan);
		if(row > 0) {
			return "true";
		}
		return "false";
	}
	
	
	/**
	 * 根据id查询月计划
	 * @param planId 月计划id
	 * @return 月计划DO
	 */
	@RequestMapping("/getPlanById")
	@ResponseBody
	public PlanDO getPlanById(String planId) {
		return planService.getPlanById(planId);
	}
}
