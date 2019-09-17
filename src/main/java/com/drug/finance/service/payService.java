package com.drug.finance.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.drug.dto.PayDTO;
import com.drug.entity.EmployeeDO;
public interface payService {
	/**
	 * 查询付款单 
	 * @return 付款单集合
	 */
	public List<PayDTO> getPay(Map<String,Object> map);
	
	
	/**
	 * 查询付款日期、合计
	 * @return
	 */
	public List<PayDTO> getDateMoney();
	
	/**
	 * 查询付款总行数
	 * @return
	 */
	public Integer getPayCount(Map<String,Object> map);
	
	
	/**
	 * 删除付款单
	 * @return
	 */
	public int delPay(int pid);
	
	
	/**
	 * 修改付款单
	 * @param payDTO 
	 * @return 受影响行数
	 */
	public int updPay(PayDTO payDTO);
	
	
	
}
