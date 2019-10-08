package com.drug.finance.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.finance.service.BranchGoodsService;
import com.drug.finance.service.BranchSaleDetailService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月17日 下午8:38:52 
 * 类说明 分店销售详情Controller
 */
@Controller
public class BranchSaleDetailController {
	@Autowired
	private BranchSaleDetailService branchSaleDetailService;

	@Autowired
	private BranchGoodsService branchGoodsService;

	/**
	 * 查询分店销售的商品名称、数量
	 * 
	 * @return 分店销售的商品名称集合、数量总数集合
	 */
	@RequestMapping("/getGnameQuantity")
	@ResponseBody
	public Map<String, List<Object>> getGnameQuantity() {
		// 查询分店仓库所有商品名称
		List<String> bGoodsList = branchGoodsService.getAllGoodsname();
		// 新建一个map类对象，用来装 分店销售的商品名称集合、数量总数集合
		Map<String, List<Object>> map = new HashMap<String, List<Object>>();
		// 商品名称集合
		List<Object> gnameList = new ArrayList<Object>();
		// 商品数量总数集合
		List<Object> quaList = new ArrayList<Object>();
		for (int i = 0; i < bGoodsList.size(); i++) {
			// 新建 商品数量总数变量
			int quai = 0;
			// 查询不同商品的销售订单的商品数量
			List<Integer> quanList = branchSaleDetailService.getQuantityByGname(bGoodsList.get(i));
			// 计算商品总数
			for (Integer q : quanList) {
				quai += q;
			}
			/// 把 分店仓库所有商品名称 加入 商品名称集合
			gnameList.add(bGoodsList.get(i));
			// 把 不同商品的商品总数 加入 商品数量总数集合
			quaList.add(quai);

		}
		// 把 商品名称集合 加入 map集合
		map.put("gnameList", gnameList);
		// 把 商品数量总数集合 加入 map集合
		map.put("quaList", quaList);
		// 返回map集合
		return map;
	}
}
