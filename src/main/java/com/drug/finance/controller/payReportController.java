package com.drug.finance.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.dto.PayDTO;
import com.drug.dto.ReceiptDTO;
import com.drug.finance.service.payReportService;
import com.drug.finance.service.payService;

/**
 * @author 冯真真
 * @version 创建时间：2019年9月26日 下午4:22:56 
 * 类说明 总店财务报表controller
 */
@Controller
public class payReportController {
	@Autowired
	private payReportService payReportService;

	/**
	 * 查询付款日期、合计
	 * 
	 * @return 1--5周付款数额数组
	 */
	@RequestMapping("/getDateMoney")
	@ResponseBody
	public List<Double> getDateMoney() {
		// 新建一个用来装5周支出总计的List集合
		List<Double> arrPayTotal = new ArrayList<Double>();
		// 查询所有付款日期、合计
		List<PayDTO> listDateMoney = payReportService.getDateMoney();
		// 新建一个SimpleDateFormat类对象
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		// 新建5个用来装 合计 的变量
		double total1 = 0;
		double total2 = 0;
		double total3 = 0;
		double total4 = 0;
		double total5 = 0;
		for (PayDTO pay : listDateMoney) {
			// 得到付款日期
			Date date = pay.getPayDate();
			// 把 付款日期 由日期时间类型转为字符串类型
			String dateStr = simple.format(date);
			// 分割字符串类型的 付款日期
			String[] dateArr = dateStr.split("-");
			// 得到 付款日期的‘日’
			int day = Integer.parseInt(dateArr[2]);
			// 判断 付款日期的‘日’在第几周
			if (day / 7 <= 1 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第 1周
				// 得到 付款金额
				double money = pay.getMoney();
				// 计算第1周财务支出
				total1 += money;
			} else if (day / 7 <= 2 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第2周
				// 得到 付款金额
				double money = pay.getMoney();
				// 计算第2周财务支出
				total2 += money;
			} else if (day / 7 <= 3 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 3周
				// 得到 付款金额
				double money = pay.getMoney();
				// 计算第3周财务支出
				total3 += money;
			} else if (day / 7 <= 4 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第4周
				// 得到 付款金额
				double money = pay.getMoney();
				// 计算第4周财务支出
				total4 += money;
			} else if (day / 7 <= 5 && (day % 7 >= 0 && day % 7 <= 6)) {
				// 第5周
				// 得到 付款金额
				double money = pay.getMoney();
				// 计算第5周财务支出
				total5 += money;
			}
		}
		// 把 5周的支出总计分别 加入 用来装5周支出总计的List集合
		arrPayTotal.add(total1);
		arrPayTotal.add(total2);
		arrPayTotal.add(total3);
		arrPayTotal.add(total4);
		arrPayTotal.add(total5);
		// 返回 装了5周支出总计的List集合
		return arrPayTotal;
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
		List<ReceiptDTO> receiptDateMoney = payReportService.getReceiptDateMoney();
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
