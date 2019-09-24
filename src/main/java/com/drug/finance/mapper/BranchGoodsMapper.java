package com.drug.finance.mapper;
/**
* @author 肖影
* @version 创建时间：2019年9月18日 上午8:41:58
* 类说明 分店商品mapper
*/

import java.util.List;

public interface BranchGoodsMapper {
	/**
	 * 查询所有商品名称
	 * 
	 * @return 商品名称list
	 */
	public List<String> getAllGoodsname();
}
