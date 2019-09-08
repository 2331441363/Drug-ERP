package com.drug.finance.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.drug.entity.Pay;
public interface payService {
	/**
	 * 查询付款单 
	 * @return 付款单集合
	 */
	public List<Pay> getPay();
	
	/**
	 * 新增付款单
	 * @param pay 付款单
	 */
	public void addPay(Pay pay);
}
