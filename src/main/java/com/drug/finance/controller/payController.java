package com.drug.finance.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.Pay;
import com.drug.finance.service.payService;
@Controller
public class payController {
	@Autowired
	private payService payservice;	
	
	/**
	 * 查询付款单
	 * @return
	 */
	@RequestMapping("/getPays.do")
	public  List<Pay> getPays() {
		//查询所有付款单
		List<Pay> listPay =payservice.getPay();
		return listPay;
		
	}
	
	/**
	 * 新增付款单
	 * @param pay 付款单
	 */
	@RequestMapping("/addPays.do")
	@ResponseBody
	public String addPays(Pay pay) {
		payservice.addPay(pay);
		return "ok";
		
	}
	
	
	
	
	
	
	
	
	
	
}
