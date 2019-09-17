package com.drug.finance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.finance.service.branchinfrService;

/**
* @author 肖影
* @version 创建时间：2019年9月15日 上午8:46:13
* 类说明
*/
@Controller
public class branchinfrController {
	@Autowired
	private branchinfrService branchinfrservice;
	
	/**
	 * 查询分店名称
	 * @return 分店名称集合
	 */
	@RequestMapping("/getAllBranchName.do")
	@ResponseBody
	public List<String> getAllBranchName() {
		System.out.println("xxxxxxxxxxx");
		//查询所有分店名称
		List<String> brachNameList =branchinfrservice.getAllBranchName();
		for (String bname : brachNameList) {
			System.out.println(bname);
		}
		/*Map<String, Object> map=new HashMap<String, Object>();
		map.put("data", brachNameList);*/
		return brachNameList;
		
		
	}
}
