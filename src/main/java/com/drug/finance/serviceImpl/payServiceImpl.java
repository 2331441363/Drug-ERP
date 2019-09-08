package com.drug.finance.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.drug.entity.Pay;
import com.drug.finance.mapper.payMapper;
import com.drug.finance.service.payService;
@Service
public class payServiceImpl implements payService{
@Autowired
	private payMapper paymapper;
	
	/**
	 * 查询付款单
	 */
	@Override
	public List<Pay> getPay() {
		return paymapper.getPay();
	}

	/**
	 * 新增付款单
	 * @param pay 付款单
	 */
	@Override
	public void addPay(Pay pay) {
		paymapper.addPay(pay);
	}

}
