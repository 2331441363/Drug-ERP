package com.drug.finance.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.finance.service.returnOrderService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月25日 上午8:57:51 
 * 类说明 分店退货单controller
 */
@Controller
public class returnOrderController {
	@Autowired
	private returnOrderService returnOrderService;

	/**
	 * 修改分店退货单收款状态
	 * 
	 * @param returnId      退货单id
	 * @param receiptStatus 收款状态
	 * @return
	 */
	@RequestMapping("/updBranchReturnStatus")
	@ResponseBody
	public String updBranchReturnStatus(int returnId, String receiptStatus) {
		Map<String, Object> map = new HashMap<>();
		map.put("returnId", returnId);
		map.put("receiptStatus", receiptStatus);
		int row = returnOrderService.updBranchReturnStatus(map);
		if (row > 0) {
			System.out.println("修改分店退货单收款状态成功");
			return "ok";
		} else {
			System.out.println("修改分店退货单收款状态失败");
			return "no";
		}
	}
}
