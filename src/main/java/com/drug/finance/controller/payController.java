package com.drug.finance.controller;


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
	 * @return
	 */
	@RequestMapping("/listPay")
	@ResponseBody
	public  Map<String,Object> listPay(
			@RequestParam(value="payDate",required=false,defaultValue="")String payDate,
			@RequestParam(value="branchName",required=false,defaultValue="") String branchName,
			@RequestParam(value="payType",required=false,defaultValue="")String payType,
			LayuiTablePageDO layuiTablePageDO) {
		System.out.println(payDate);
		System.out.println(branchName);
		System.out.println(payType);
		Map<String, Object> map= new HashMap<>();
		System.out.println("cccccccc");
			 map.put("date", payDate);
				map.put("branch", branchName);
				map.put("payType", payType);
		
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		map.put("endRow", layuiTablePageDO.getEndRow());
		
		Set<String> keys =map.keySet();
		for (String k : keys) {
			System.out.println(map.get(k));	
		}
		
		
		//查询所有付款单
		List<PayDTO> listPay =payservice.getPay(map);
		/*if(listPay!=null) {
		for (PayDTO pay : listPay) {
			System.out.println(pay.getDepartmentName());
		}
		}*/
		Map<String,Object> util = ReturnDataUtils.responseByData();
		//要显示的数据
		util.put("data", listPay);
		//总行数
		util.put("count", payservice.getPayCount(map));
		return util;
	}
	
	
	/**
	 * 查询付款日期、合计
	 * @return 1--5周付款数额数组
	 */
	@RequestMapping("/getDateMoney")
	@ResponseBody
	public List<Double> getDateMoney() {
		List<Double> arrPayTotal=new ArrayList<Double>();
		//查询所有付款日期、合计
	 List<PayDTO>	listDateMoney= payservice.getDateMoney();
	 SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
	 double total1=0;
	 double total2=0;
	 double total3=0;
	 double total4=0;
	 double total5=0;
	 for (PayDTO pay : listDateMoney) {
		Date date= pay.getPayDate();
		 String dateStr= simple.format(date);
		 String[] dateArr =dateStr.split("-");
		 int day =Integer.parseInt(dateArr[2]);
		 if (day/7<=1 && (day%7>=0 && day%7<=6)) {
			//第 1周
			 double money =pay.getMoney();
			 total1+=money;
		}else if(day/7<=2 && (day%7>=0 && day%7<=6)) {
			//第2周
			 double money =pay.getMoney();
			 total2+=money;
		}else if(day/7<=3 && (day%7>=0 && day%7<=6)) {
			//3周
			 double money =pay.getMoney();
			 total3+=money;
		}else if( day/7<=4 && (day%7>=0 && day%7<=6)) {
			//第4周
			 double money =pay.getMoney();
			 total4+=money;
		}else if(day/7<=5 && (day%7>=0 && day%7<=6)) {
			//第5周
			 double money =pay.getMoney();
			 total5+=money;
		}
	}
	 arrPayTotal.add(total1);
	 arrPayTotal.add(total2);
	 arrPayTotal.add(total3);
	 arrPayTotal.add(total4);
	 arrPayTotal.add(total5);

	  return arrPayTotal;
	}
	
	
	
	/**
	 * 删除付款单
	 * @param payId 付款单id
	 */
	@RequestMapping("/delPay")
	public void delPay(int payId) {
		System.out.println("删除");
		int row =payservice.delPay(payId);
		if (row>0) {
			System.out.println("删除付款单成功");
		} else {
			System.out.println("删除付款单失败");
		}
	}
	
	
	/**
	 * 修改付款单
	 * @param payDTO
	 * @return 
	 */
	@RequestMapping("/updPay")
	@ResponseBody
	public String updPay(PayDTO payDTO) {
		int row =payservice.updPay(payDTO);
		if (row>0) {
			return "ok";
		} else {
			return null;
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
