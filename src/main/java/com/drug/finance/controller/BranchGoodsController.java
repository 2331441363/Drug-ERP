package com.drug.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.finance.service.BranchGoodsService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月18日 上午8:45:44 
 * 类说明 分店商品Controller
 */
@Controller
public class BranchGoodsController {
	@Autowired
	private BranchGoodsService branchGoodsService;

	/**
	 * 查询分店所有商品名称
	 * 
	 * @return 分店商品名称集合
	 */
	@RequestMapping("/getAllGoodsname")
	@ResponseBody
	public List<String> getAllGoodsname() {
		// 查询分店所有商品名称
		List<String> bGoodsList = branchGoodsService.getAllGoodsname();
		// 返回 所有商品名称集合
		return bGoodsList;
	}
}
