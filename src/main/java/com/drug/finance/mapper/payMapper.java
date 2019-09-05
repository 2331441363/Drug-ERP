package com.drug.finance.mapper;


import java.util.List;

import com.drug.entity.Pay;

public interface payMapper {
	
	/**
	 * 查询付款单 
	 * @return 付款单集合
	 */
	public List<Pay> getPay();
	
	/**
	 * 新增付款单
	 * @param pay
	 */
	public void addPay(Pay pay);
	
}
