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
	 * @return 修改是否成功信息
	 */
	@RequestMapping("/updBranchReturnStatus")
	@ResponseBody
	public String updBranchReturnStatus(int returnId, String receiptStatus) {
		// 新建一个map对象
		Map<String, Object> map = new HashMap<String, Object>();
		//把修改信息加入map集合
		map.put("returnId", returnId);
		map.put("receiptStatus", receiptStatus);
		//修改分店退货单收款状态
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
