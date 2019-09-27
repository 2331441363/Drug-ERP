package com.drug.finance.serviceImpl;

import java.util.List;
/**
 * @author 肖影
 * @version 创建时间：2019年9月17日 下午8:36:45 
 * 类说明 付款单Service实现类
 */
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.drug.dto.PayDTO;
import com.drug.entity.EmployeeDO;
import com.drug.finance.mapper.payMapper;
import com.drug.finance.service.payService;

@Service
public class payServiceImpl implements payService {
	@Autowired
	private payMapper paymapper;

	/**
	 * 查询付款单
	 */
	@Override
	public List<PayDTO> getPay(Map<String, Object> map) {
		return paymapper.getPay(map);
	}


	/**
	 * 查询付款总行数
	 */
	@Override
	public Integer getPayCount(Map<String, Object> map) {
		return paymapper.getPayCount(map);
	}

	/**
	 * 删除付款单
	 */
	@Override
	public int delPay(int pid) {
		return paymapper.delPay(pid);
	}

	/**
	 * 修改付款单
	 */
	@Override
	public int updPay(Map<String, Object> map) {
		return paymapper.updPay(map);
	}
}
