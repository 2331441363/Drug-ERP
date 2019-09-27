package com.drug.finance.controller;

import java.sql.Timestamp;
import java.text.ParseException;
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

import com.drug.dto.PayDTO;
import com.drug.dto.ReceiptDTO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.finance.service.receiptService;
import com.drug.util.ReturnDataUtils;

/**
 * @author 肖影
 * @version 创建时间：2019年9月5日 下午7:02:17 
 * 类说明 收款单Controller
 */
@Controller
public class receiptController {
	@Autowired
	private receiptService receiptservice;

	/**
	 * 查询所有收款单
	 * 
	 * @return 收款单集合
	 */
	@RequestMapping("/listReceipt")
	@ResponseBody
	public Map<String, Object> listReceipt(
			@RequestParam(value = "receiptTime", required = false, defaultValue = "") String receiptTime,
			@RequestParam(value = "branchName", required = false, defaultValue = "") String branchName,
			@RequestParam(value = "receiptType", required = false, defaultValue = "") String receiptType,
			LayuiTablePageDO layuiTablePageDO) {
		// 新建一个map类对象1
		Map<String, Object> map = new HashMap<>();
		// 把查询条件加入map集合
		map.put("date", receiptTime);
		map.put("branch", branchName);
		map.put("receiptType", receiptType);
		// 把 分页起始页 加入 map集合
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		// 把 分页结束页 加入 map集合
		map.put("endRow", layuiTablePageDO.getEndRow());
		// 查询所有收款单
		List<ReceiptDTO> receiptList = receiptservice.getReceipt(map);
		// 新建一个map类对象2
		Map<String, Object> util = ReturnDataUtils.responseByData();
		// 要显示的数据
		util.put("data", receiptList);
		// 要显示的行数
		util.put("count", receiptservice.getReceptCount());
		// 返回 map类对象2
		return util;
	}

	/**
	 * 删除收款
	 * 
	 * @param rid 收款id
	 * @return 删除是否成功信息
	 */
	@RequestMapping("/delReceipt")
	@ResponseBody
	public String delReceipt(int receiptId) {
		//// 根据收款单id删除收款单
		int row = receiptservice.delReceipt(receiptId);
		if (row > 0) {
			System.out.println("删除收款成功");
			return "ok";
		} else {
			System.out.println("删除收款失败");
			return "no";
		}
	}

	/**
	 * 修改收款单
	 * 
	 * @param receiptId        收款单id
	 * @param receiptTime      收款日期
	 * @param receiptMoney收款金额
	 * @param receiptType      收款类型
	 * @param receiptForm      收款备注
	 * @return
	 */
	@RequestMapping("/updReceipt")
	@ResponseBody
	public String updReceipt(String receiptId, String receiptTime, String receiptMoney, String receiptType,
			String receiptForm) {
		// 新建一个SimpleDateFormat类对象
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 新建一个空Date类对象
		Date dt = null;
		try {
			// 把 收款日期 由字符串类型转为日期类型
			dt = simple.parse(receiptTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 新建一个Timestamp类对象
		Timestamp newReceiptTime = new Timestamp(dt.getTime());
		// 新建一个map类对象
		Map<String, Object> map = new HashMap<>();
		// 把 修改信息 加入 map集合
		map.put("receiptId", receiptId);
		map.put("receiptTime", newReceiptTime);
		map.put("receiptMoney", receiptMoney);
		map.put("receiptType", receiptType);
		map.put("receiptForm", receiptForm);
		// 修改收款信息
		int row = receiptservice.updReceipt(map);
		if (row > 0) {
			System.out.println("修改收款单成功");
			return "ok";
		} else {
			System.out.println("修改收款单失败");
			return "no";
		}
	}
}
