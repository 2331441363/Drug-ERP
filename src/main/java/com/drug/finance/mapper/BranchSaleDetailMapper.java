package com.drug.finance.mapper;
/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午8:33:03
* 类说明 分店销售详情mapper
*/

import java.util.List;

public interface BranchSaleDetailMapper {
	/**
	 * 根据销售的商品名称查询销售数量
	 * 
	 * @param pname 商品名称
	 * @return 销售数量list
	 */
	public List<Integer> getQuantityByGname(String pname);
}
