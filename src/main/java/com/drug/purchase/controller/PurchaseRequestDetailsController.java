package com.drug.purchase.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.PurchaseRequestDetailsDO;
import com.drug.purchase.service.PurchaseRequestDetailsService;
import com.drug.util.ReturnDataUtils;

@Controller
public class PurchaseRequestDetailsController {
	@Autowired
	private PurchaseRequestDetailsService purchaseRequestDetailsBiz;
	@RequestMapping("/selectByIdPurchaseRequest.do")
	@ResponseBody
	public Map<String,Object> showPurchaseEmployee(@RequestParam
			(value="page",required=true,defaultValue="1")int page,
			@RequestParam
			(value="limit",required=true,defaultValue="10")int limit,int id){
		Map<String,Object> showMap=new HashMap<String,Object>();
		showMap.put("page", (page-1)*limit);
		showMap.put("limit", limit);
		showMap.put("id", id);
		Map<String,Object> map=ReturnDataUtils.responseByData();
		//得到采购申请详情数据
		List<PurchaseRequestDetailsDO> list=
				purchaseRequestDetailsBiz.selectById(showMap);
		//采购申请详情数据总条数
		int countPage=purchaseRequestDetailsBiz.countPage(id);
		map.put("data", list);
		map.put("count", countPage);
		return  map;
	}
	/**
	 * 添加采购申请详情数据
	 * @param p 采购申请详情对象
	 * @return int 受影响的行数
	 */
	@RequestMapping("/addPurchaseRequestDetails.do")
	public @ResponseBody int add(PurchaseRequestDetailsDO p) {
		//添加数据
		int row=purchaseRequestDetailsBiz.add(new 
				PurchaseRequestDetailsDO(p.getPurchaseRequestId(),
						p.getMaterialId(),p.getNumber(),p.getNumber()));//未写完
		return row;
	}
}
