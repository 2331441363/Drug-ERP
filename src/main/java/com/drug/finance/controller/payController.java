package com.drug.finance.controller;
/**
 * @author 肖影
 * @version 创建时间：2019年9月17日 下午8:38:52 
 * 类说明 付款单Controller
 */

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
import com.drug.entity.LayuiTablePageDO;
import com.drug.finance.service.payService;
import com.drug.util.ReturnDataUtils;

@Controller
public class payController {
	@Autowired
	private payService payservice;

	/**
	 * 查询付款单
	 */
	@RequestMapping("/listPay")
	@ResponseBody
	public Map<String, Object> listPay(
			@RequestParam(value = "payDate", required = false, defaultValue = "") String payDate,
			@RequestParam(value = "branchName", required = false, defaultValue = "") String branchName,
			@RequestParam(value = "payType", required = false, defaultValue = "") String payType,
			LayuiTablePageDO layuiTablePageDO) {
		// 新建一个map类对象1
		Map<String, Object> map = new HashMap<String, Object>();
		// 把查询条件加入map集合
		map.put("date", payDate);
		map.put("branch", branchName);
		map.put("payType", payType);
		// 把 分页起始页 加入 map集合
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		// 把 分页结束页 加入 map集合
		map.put("endRow", layuiTablePageDO.getEndRow());
		// 查询所有付款单
		List<PayDTO> listPay = payservice.getPay(map);
		// 新建一个map类对象2
		Map<String, Object> util = ReturnDataUtils.responseByData();
		// 要显示的数据
		util.put("data", listPay);
		// 要显示的行数
		util.put("count", payservice.getPayCount(map));
		// 返回 map类对象2
		return util;
	}

	
	/**
	 * 删除付款单
	 * 
	 * @param payId 付款单id
	 */
	@RequestMapping("/delPay")
	public void delPay(int payId) {
		// 根据付款单id删除付款单
		int row = payservice.delPay(payId);
		if (row > 0) {
			System.out.println("删除付款单成功");
		} else {
			System.out.println("删除付款单失败");
		}
	}

	/**
	 * 修改付款单
	 * 
	 * @param payId          付款单id
	 * @param payDate        付款日期
	 * @param money          付款金额
	 * @param payType        付款类型
	 * @param payNote        付款备注
	 * @return 修改是否成功信息
	 */
	@RequestMapping("/updPay")
	@ResponseBody
	public String updPay(int payId, String payDate, 
			String money, String payType, String payNote) {
		// 新建一个SimpleDateFormat类对象
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 新建一个空Date类对象
		Date dt = null;
		try {
			// 把 付款日期 由字符串类型转为日期类型
			dt = simple.parse(payDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 新建一个Timestamp类对象
		Timestamp newSignTime = new Timestamp(dt.getTime());
		
		// 新建一个map类对象
		Map<String, Object> map = new HashMap<String, Object>();
		// 把 修改信息 加入 map集合
		map.put("payId", payId);
		map.put("payDate", newSignTime);
		map.put("money", money);
		map.put("payType", payType);
		map.put("payNote", payNote);
		// 修改付款信息
		int row = payservice.updPay(map);
		if (row > 0) {
			System.out.println("修改付款单成功");
			return "ok";
		} else {
			System.out.println("修改付款单失败");
			return "no";
		}
	}
	
	/**
	 * 修改分店退货单付款状态
	 * @param payId 分店退货单id
	 * @param payStatus 付款状态
	 * @return 修改是否成功信息
	 */
	@RequestMapping("/updBrachBackPay")
	@ResponseBody
	public String updBrachBackPay(int payId,String payStatus) {
		// 新建一个map类对象
				Map<String, Object> map = new HashMap<String, Object>();
				// 把 修改信息 加入 map集合
				map.put("payId", payId);
				map.put("payStatus", payStatus);
				// 修改付款信息
				int row = payservice.updBrachBackPay(map);
				if (row > 0) {
					System.out.println("修改分店退货单付款状态成功");
					return "ok";
				} else {
					System.out.println("修改分店退货单付款状态失败");
					return "no";
				}
	}
	
	
	
	
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
		List<PayDTO> listDateMoney = payservice.getDateMoney();
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

}
