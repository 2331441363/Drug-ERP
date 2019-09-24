package com.drug.finance.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.BranchinfrDO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.finance.service.branchinfrService;
import com.drug.util.ReturnDataUtils;
import com.sun.tools.javac.util.Convert;

/**
 * @author 肖影
 * @version 创建时间：2019年9月15日 上午8:46:13 
 * 类说明 分店信息Controller
 */
@Controller
public class branchinfrController {
	@Autowired
	private branchinfrService branchinfrservice;

	/**
	 * 查询分店名称
	 * 
	 * @return 分店名称集合
	 */
	@RequestMapping("/getAllBranchName.do")
	@ResponseBody
	public List<String> getAllBranchName() {
		// 查询所有分店名称
		List<String> brachNameList = branchinfrservice.getAllBranchName();
		// 返回 分店名称集合
		return brachNameList;
	}

	/**
	 * 查询所有分店
	 * 
	 * @param layuiTablePageDO 分页信息DO
	 * @return 所有分店集合
	 */
	@RequestMapping("/getAllBranch")
	@ResponseBody
	public Map<String, Object> getAllBranch(LayuiTablePageDO layuiTablePageDO) {
		// 新建一个map集合1
		Map<String, Object> map = new HashMap<>();
		// 得到分页起始页
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		// 得到分页尾页
		map.put("endRow", layuiTablePageDO.getEndRow());
		// 查询所有分店
		List<BranchinfrDO> branchList = branchinfrservice.getAllBranch(map);

		// 新建一个map集合2
		Map<String, Object> util = ReturnDataUtils.responseByData();
		// 要显示的数据
		util.put("data", branchList);
		// 要显示的行数
		util.put("count", branchinfrservice.getAllBranchCount(map));
		// 返回 map集合2
		return util;
	}

	/**
	 * 新增分店
	 * 
	 * @param bName          分店名称
	 * @param province       分店所在省份
	 * @param city           分店所在市区
	 * @param addrDetl       （分店）详细地址
	 * @param signTime       签订时间
	 * @param isBargin       合同状态
	 * @param branchBossName 分店老板姓名
	 * @param branchTel      （分店）联系电话
	 * @return 新增是否成功信息
	 */
	@RequestMapping("/addBranch")
	@ResponseBody
	public String addBranch(String bName, String province, String city, String addrDetl, String signTime,
			String isBargin, String branchBossName, String branchTel) {
		// 新建SimpleDateFormat类对象
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 定义空Date对象
		Date dt = null;
		try {
			// 签订时间 字符串类型转为日期类型
			dt = simple.parse(signTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 签订时间 日期类型转为日期时间类型
		Timestamp newSignTime = new Timestamp(dt.getTime());
		// 分店全地址
		String branchAddr = province + city + addrDetl;
		// 新建一个map类对象
		Map<String, Object> map = new HashMap<>();
		/// 把要新增的分店信息加入map集合
		map.put("bName", bName);
		map.put("branchAddr", branchAddr);
		map.put("signTime", newSignTime);
		map.put("isBargin", isBargin);
		map.put("branchBossName", branchBossName);
		map.put("branchTel", branchTel);
		// 新增分店
		int row = branchinfrservice.addBranch(map);
		if (row > 0) {
			System.out.println("新增分店成功");
			return "ok";
		} else {
			System.out.println("新增分店失败");
			return "no";
		}
	}

	/**
	 * 删除分店
	 * 
	 * @param branchId 分店id
	 */
	@RequestMapping("/delBranch")
	@ResponseBody
	public void delBranch(int branchId) {
		// 根据分店id删除分店信息
		int row = branchinfrservice.delBranch(branchId);
		if (row > 0) {
			System.out.println("删除分店成功");
		} else {
			System.out.println("删除分店失败");
		}
	}

	/**
	 * 修改分店信息
	 * 
	 * @param branchinfrDO 修改所在行的分店信息DO
	 * @return 修改是否成功信息
	 */
	@RequestMapping("/updBranch")
	@ResponseBody
	public String updBranch(String bid, String bName, String bAddr, String signTime, String isBargin,
			String branchBossName, String branchTel) {
		// 新建一个map类对象
		Map<String, Object> map = new HashMap<>();
		// 新建SimpleDateFormat类对象
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 定义空Date对象
		Date dt = null;
		try {
			// 签订时间 字符串类型转为日期类型
			dt = simple.parse(signTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 签订时间 日期类型转为日期时间类型
		Timestamp newSignTime = new Timestamp(dt.getTime());
		// 把要修改的分店信息加入map集合
		map.put("bid", bid);
		map.put("bName", bName);
		map.put("bAddr", bAddr);
		map.put("signTime", newSignTime);
		map.put("isBargin", isBargin);
		map.put("branchBossName", branchBossName);
		map.put("branchTel", branchTel);
		// 修改分店信息
		int row = branchinfrservice.updBranch(map);
		if (row > 0) {
			System.out.println("修改分店成功");
			return "ok";
		} else {
			System.out.println("修改分店失败");
			return "no";
		}
	}
}
