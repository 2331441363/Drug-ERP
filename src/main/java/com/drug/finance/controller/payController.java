package com.drug.finance.controller;
/**
 * @author 肖影
 * @version 创建时间：2019年9月17日 下午8:38:52 
 * 类说明 付款单Controller
 */

import java.awt.image.ColorConvertOp;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.dto.PayDTO;
import com.drug.entity.EmployeeDO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.finance.service.payService;
import com.drug.util.ReturnDataUtils;
import com.sun.tools.javac.util.Convert;

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
		Map<String, Object> map = new HashMap<>();
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
	public String updPay(String payId, String payDate, 
			String money, String payType, String payNote,String payStatus) {
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
		Map<String, Object> map = new HashMap<>();
		// 把 修改信息 加入 map集合
		map.put("payId", payId);
		map.put("payDate", newSignTime);
		map.put("money", money);
		map.put("payType", payType);
		map.put("payNote", payNote);
		map.put("payStatus", payStatus);
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
}
