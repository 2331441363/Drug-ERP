package com.drug.finance.serviceImpl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.drug.dto.PayDTO;
import com.drug.entity.EmployeeDO;
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
	public List<PayDTO> getPay(Map<String,Object> map) {
		return paymapper.getPay(map);
	}


	@Override
	public List<PayDTO> getDateMoney() {
		return paymapper.getDateMoney();
	}

	@Override
	public Integer getPayCount(Map<String,Object> map) {
		return paymapper.getPayCount(map);
	}


	@Override
	public int delPay(int pid) {
		return paymapper.delPay(pid);
	}


	@Override
	public int updPay(PayDTO payDTO) {
		return paymapper.updPay(payDTO);
	}



}
