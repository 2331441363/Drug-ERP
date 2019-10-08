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
		Map<String, Object> map = new HashMap<String, Object>();
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
		Map<String, Object> map = new HashMap<String, Object>();
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
	
	/**
	 * 查询收款日期、合计
	 * 
	 * @return 合计集合
	 */
	@RequestMapping("/getReceiptDateMoney")
	@ResponseBody
	public List<Double> getReceiptDateMoney() {
		// 新建一个用来装5周收入总计的List集合
		List<Double> arrReceTotal = new ArrayList<Double>();
		// 查询所有付款日期、合计
		List<ReceiptDTO> receiptDateMoney = receiptservice.getReceiptDateMoney();
		// 新建一个SimpleDateFormat类对象
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		// 新建5个用来装 合计 的变量
		double total1 = 0;
		double total2 = 0;
		double total3 = 0;
		double total4 = 0;
		double total5 = 0;
		for (ReceiptDTO receipt : receiptDateMoney) {
			// 得到收款日期
			Date date = receipt.getReceiptTime();
			// 把 收款日期 由日期时间类型转为字符串类型
			String dateStr = simple.format(date);
			// 分割字符串类型的 收款日期
			String[] dateArr = dateStr.split("-");
			// 得到 收款日期的‘日‘
			int day = Integer.parseInt(dateArr[2]);
			// 判断 付款日期的‘日’在第几周
			if (day / 7 <= 1 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第 1周
				// 得到 收款金额
				double money = receipt.getReceiptMoney();
				// 计算第1周财务收入
				total1 += money;
			} else if (day / 7 <= 2 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第2周
				// 得到 收款金额
				double money = receipt.getReceiptMoney();
				// 计算第2周财务收入
				total2 += money;
			} else if (day / 7 <= 3 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 3周
				// 得到 收款金额
				double money = receipt.getReceiptMoney();
				// 计算第3周财务收入
				total3 += money;
			} else if (day / 7 <= 4 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第4周
				// 得到 收款金额
				double money = receipt.getReceiptMoney();
				// 计算第4周财务收入
				total4 += money;
			} else if (day / 7 <= 5 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第5周
				// 得到 收款金额
				double money = receipt.getReceiptMoney();
				// 计算第5周财务收入
				total5 += money;
			}
		}
		// 把 5周的收入总计分别 加入 用来装5周收入总计的List集合
		arrReceTotal.add(total1);
		arrReceTotal.add(total2);
		arrReceTotal.add(total3);
		arrReceTotal.add(total4);
		arrReceTotal.add(total5);
		// 返回 装了5周收入总计的List集合
		return arrReceTotal;
	}
}
