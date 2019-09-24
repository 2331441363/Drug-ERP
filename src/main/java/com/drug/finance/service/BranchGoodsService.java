package com.drug.finance.service;

import java.util.List;

import org.springframework.stereotype.Repository;

/**
* @author 肖影
* @version 创建时间：2019年9月18日 上午8:43:23
* 类说明 分店商品Service
*/
@Repository
public interface BranchGoodsService {
	/**
	 * 查询所有商品名称
	 * 
	 * @return 商品名称list
	 */
	public List<String> getAllGoodsname();
}
