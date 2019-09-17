package com.drug.finance.controller;

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
	public Map<String,Object>  listReceipt(
			@RequestParam(value="receiptTime",required=false,defaultValue="")String receiptTime,
			@RequestParam(value="branchName",required=false,defaultValue="") String branchName,
			@RequestParam(value="receiptType",required=false,defaultValue="")String receiptType,
			LayuiTablePageDO layuiTablePageDO) {
		System.out.println("wwwwww");
		Map<String, Object> map= new HashMap<>();
			 map.put("date", receiptTime);
				map.put("branch", branchName);
				map.put("receiptType", receiptType);	
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		map.put("endRow", layuiTablePageDO.getEndRow());
		System.out.println(layuiTablePageDO.getEndRow());
		
		List<ReceiptDTO> receiptList =receiptservice.getReceipt(map);
		/*for (ReceiptDTO recept : receiptList) {
			System.out.println("gggggggggg");
			System.out.println(recept.getDepartmentName());
		}*/
		Map<String,Object> util = ReturnDataUtils.responseByData();
		util.put("data", receiptList);
		util.put("count", receiptservice.getReceptCount());
		return util;
	}
	
	
	/**
	 * 查询收款日期、合计
	 * @return
	 */
	@RequestMapping("/getReceiptDateMoney")
	@ResponseBody
	public List<Double> getReceiptDateMoney() {
System.out.println("11111111111");		
		List<Double> arrReceTotal=new ArrayList<Double>();
		List<ReceiptDTO> receiptDateMoney =receiptservice.getReceiptDateMoney();
		SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
		 double total1=0;
		 double total2=0;
		 double total3=0;
		 double total4=0;
		 double total5=0;
		 for (ReceiptDTO receipt : receiptDateMoney) {
			Date date= receipt.getReceiptTime();
			 String dateStr= simple.format(date);
			 String[] dateArr =dateStr.split("-");
			 int day =Integer.parseInt(dateArr[2]);
			 if (day/7<=1 && (day%7>=0 && day%7<=6)) {
				//第 1周
				 double money =receipt.getReceiptMoney();
				 total1+=money;
			}else if(day/7<=2 && (day%7>=0 && day%7<=6)) {
				//第2周
				 double money =receipt.getReceiptMoney();
				 total2+=money;
			}else if(day/7<=3 && (day%7>=0 && day%7<=6)) {
				//3周
				 double money =receipt.getReceiptMoney();
				 total3+=money;
			}else if( day/7<=4 && (day%7>=0 && day%7<=6)) {
				//第4周
				 double money =receipt.getReceiptMoney();
				 total4+=money;
			}else if(day/7<=5 && (day%7>=0 && day%7<=6)) {
				//第5周
				 double money =receipt.getReceiptMoney();
				 total5+=money;
			}
		}
		 arrReceTotal.add(total1);
		 arrReceTotal.add(total2);
		 arrReceTotal.add(total3);
		 arrReceTotal.add(total4);
		 arrReceTotal.add(total5);

		  return arrReceTotal;
	}
	
	
	
	
	
	
	
}
