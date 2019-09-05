package com.drug.purchase.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.PurchaseEmployeeDO;
import com.drug.purchase.service.PurchaseEmployeeService;
import com.drug.util.ToolClass;

@Controller
public class PurchaseEmployeeController {
	@Autowired
	private PurchaseEmployeeService purchaseEmployeeBiz;
	/**
	 * 得到采购申请的所有数据和数据总条数
	 * @return Map 返回数据集合和数据总条数
	 */
	@RequestMapping("/showPurchaseEmployee.do")
	@ResponseBody
	public Map<String,Object> showPurchaseEmployee(){
		//采购申请所有数据集合
		List<PurchaseEmployeeDO> list=purchaseEmployeeBiz.showPurchaseEmployee();
		List<PurchaseEmployeeDO> purchaseEmployeeDOList=null;
		for(PurchaseEmployeeDO p:list) {
			if(p.getAudit()==0) {
				purchaseEmployeeDOList.add(
						new PurchaseEmployeeDO(
								p.getPurchaseRequestId(),
								p.getEmpName(),p.getDepartmentName(),
								"未审核",p.getTimeOfApplication(),
								p.getPurchaseAmount(),p.getCause()));
			}else if(p.getAudit()==1){
				purchaseEmployeeDOList.add(
						new PurchaseEmployeeDO(
								p.getPurchaseRequestId(),
								p.getEmpName(),p.getDepartmentName(),
								"审核通过",p.getTimeOfApplication(),
								p.getPurchaseAmount(),p.getCause()));
			}else if(p.getAudit()==2) {
				purchaseEmployeeDOList.add(
						new PurchaseEmployeeDO(
								p.getPurchaseRequestId(),
								p.getEmpName(),p.getDepartmentName(),
								"审核不通过",p.getTimeOfApplication(),
								p.getPurchaseAmount(),p.getCause()));
			}
		}
		//采购申请数据总条数
		int countPage=purchaseEmployeeBiz.countPage();
		Map<String,Object> map=ToolClass.responseByData();
		map.put("data", purchaseEmployeeDOList);
		map.put("count", countPage);
		return  map;
	}
}
