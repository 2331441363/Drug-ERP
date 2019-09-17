package com.drug.purchase.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.PurchaseEmployeeDO;
import com.drug.entity.PurchaseRequestDO;
import com.drug.purchase.service.PurchaseEmployeeService;
import com.drug.purchase.service.PurchaseRequestService;
import com.drug.util.ReturnDataUtils;

@Controller
public class PurchaseEmployeeController {
	@Autowired
	private PurchaseEmployeeService purchaseEmployeeBiz;
	@Autowired
	private PurchaseRequestService purchaseRequestService;
	/**
	 * 得到采购申请的所有数据和数据总条数
	 * @param page 页数
	 * @param limit 数据条数
	 * @return Map 返回数据集合和数据总条数
	 */
	@RequestMapping("/showPurchaseEmployee.do")
	@ResponseBody
	public Map<String,Object> showPurchaseEmployee(@RequestParam
			(value="page",required=true,defaultValue="1")int page,
			@RequestParam
			(value="limit",required=true,defaultValue="10")int limit){
		Map<String,Object> showMap=new HashMap<String,Object>();
		showMap.put("page", (page-1)*limit);
		showMap.put("limit", limit);
		//采购申请所有数据集合
		List<PurchaseEmployeeDO> list=purchaseEmployeeBiz.showPurchaseEmployee(showMap);
		List<PurchaseEmployeeDO> purchaseEmployeeDOList=new ArrayList<PurchaseEmployeeDO>();
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
		Map<String,Object> map=ReturnDataUtils.responseByData();
		map.put("data", purchaseEmployeeDOList);
		map.put("count", countPage);
		return  map;
	}
	/**
	 * 新增采购申请
	 * @param p 采购申请对象
	 * @return int 受影响的行数
	 */
	@RequestMapping("/addPurchaseEmployee.do")
	public  String add(PurchaseRequestDO p) {
		//转换时间格式
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		int row=purchaseRequestService.add(
				new PurchaseRequestDO(p.getEmpId(),p.getDepartmentId(),
						0,ft.format(new Date()),p.getPurchaseAmount(),p.getCause() ));
		return "redirect:admin/purchase/purchasingRequisition.jsp";
	}
}
