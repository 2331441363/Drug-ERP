package com.drug.finance.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.Pay;
import com.drug.finance.service.payService;
import com.drug.util.ReturnDataUtils;
@Controller
public class payController {
	@Autowired
	private payService payservice;	
		
	/**
	 * 查询付款单
	 * @return
	 */
	@RequestMapping("/listPay")
	@ResponseBody
	public  Map<String,Object> listPay() {
		System.out.println("cccccccc");
		//查询所有付款单
		List<Pay> listPay =payservice.getPay();
		System.out.println("vvvvvvvvv");
		Map<String,Object> map = ReturnDataUtils.responseByData();
		map.put("data", listPay);
		return map;
		
	}
	
	/**
	 * 新增付款单
	 * @param pay 付款单
	 */
	@RequestMapping("/insertPay")
	@ResponseBody
	public String insertPay(Pay pay) {
		payservice.addPay(pay);
		return "ok";
		
	}
	
	
	
	
	
	
	
	
	
	
}
