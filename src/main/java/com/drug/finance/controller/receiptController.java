package com.drug.finance.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.ReceiptDO;
import com.drug.finance.service.receiptService;
import com.drug.util.ToolClass;

/**
* @author 肖影
* @version 创建时间：2019年9月5日 下午7:02:17
* 类说明
*/
@Controller
public class receiptController {
	@Autowired
	private receiptService receiptservice;
	
	/**
	 * 查询收款单
	 * @return 收款单集合
	 */
	@RequestMapping("/listReceipt")
	@ResponseBody
	public Map<String,Object>  listReceipt() {
		List<ReceiptDO> receiptList =receiptservice.getReceipt();
		Map<String,Object> map = ToolClass.responseByData();
		map.put("data", receiptList);
		return map;
	}
	
	
	/**
	 * 新增收款单
	 * @param receipt 收款单
	 */
	@RequestMapping("/insertReceipt")
	@ResponseBody
	public void insertReceipt(ReceiptDO receipt) {
		receiptservice.addReceipt(receipt);
	}
	
	
	
	
	
	
	
	
	
	
}
