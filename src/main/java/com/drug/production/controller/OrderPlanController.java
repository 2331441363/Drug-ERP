package com.drug.production.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.dto.OrderPlanDTO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.entity.OrderPlanDO;
import com.drug.production.service.OrderPlanService;
import com.drug.util.ReturnDataUtils;

/**
* @author 李杰
* @version 创建时间：2019年9月16日 下午2:42:22
* 类说明 生产订单controller
*/
@Controller
public class OrderPlanController {
	@Autowired
	private OrderPlanService orderPlanService;

	/**
	 * 新增生产订单
	 * @param orderPlan 生产订单DO
	 * @return 结果
	 */
	@RequestMapping("/insertOrderPlan")
	@ResponseBody
	public String insertOrderPlan(OrderPlanDO orderPlanDO) {
		return orderPlanService.insertByOrderPlan(orderPlanDO);
	}
	
	
	/**
	 * 审核生产订单
	 * @param orderPlan 审核对象
	 * @return 结果
	 */
	@RequestMapping("/auditOrderPlan")
	@ResponseBody
	public String updateAuditOrderPlan(OrderPlanDO orderPlan) {
		System.out.println(orderPlan.toString());
		System.out.println("==========");
		int row = orderPlanService.updateAuditState(orderPlan);
		if(row > 0) {
			return "true";
		}
		return "false";
	}
	
	/**
	 * 查询所有生产订单
	 */
	@RequestMapping("/getAllOrderPlan")
	@ResponseBody
	public Map<String, Object> getAlOrderPlan(OrderPlanDO orderPlan,LayuiTablePageDO layuiTablePageDO) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderPlan", orderPlan);	//要搜索的生产订单
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		map.put("endRow", layuiTablePageDO.getEndRow());
		//查询分页后数据
		List<OrderPlanDTO> listDayPlan = orderPlanService.getOrderPlan(map);
		//查询总行数
		int sumRow =orderPlanService.getSumLineOrderPlan(map);
		//调用返回数据工具类
		Map<String, Object> util = ReturnDataUtils.responseByData();
		listDayPlan.forEach(System.out::println);
		util.put("data", listDayPlan);	//数据
		util.put("count", sumRow);	//总行数
		return util;
	}
	
}
