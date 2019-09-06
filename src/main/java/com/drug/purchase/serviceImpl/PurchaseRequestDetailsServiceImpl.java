package com.drug.purchase.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.PurchaseRequestDetailsDO;
import com.drug.purchase.mapper.PurchaseRequestDetailsMapper;
import com.drug.purchase.service.PurchaseRequestDetailsService;
@Service
public class PurchaseRequestDetailsServiceImpl  implements PurchaseRequestDetailsService{
	@Autowired
	private PurchaseRequestDetailsMapper purchaseRequestDetailsMapper;
	@Override
	public List<PurchaseRequestDetailsDO> selectById(Map<String,Object> map) {
		return purchaseRequestDetailsMapper.selectById(map);
	}
	@Override
	public int countPage(int id) {
		return purchaseRequestDetailsMapper.countPage(id);
	}
	@Override
	public int add(PurchaseRequestDetailsDO p) {
		return purchaseRequestDetailsMapper.add(p);
	}

}
