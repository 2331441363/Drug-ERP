package com.drug.finance.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.drug.dto.BranchSaleDetailDTO;

/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午8:35:27
* 类说明 分店销售详情Service
*/
@Repository
public interface BranchSaleDetailService {
	/**
	 * 根据分店销售的商品名查询销售数量
	 * 
	 * @param pname 商品名称
	 * @return 销售数量list
	 */
	public List<Integer> getQuantityByGname(String pname);
}
