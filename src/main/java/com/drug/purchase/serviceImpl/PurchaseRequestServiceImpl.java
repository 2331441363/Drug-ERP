package com.drug.purchase.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.PurchaseRequestDO;
import com.drug.purchase.mapper.PurchaseRequestMapper;
import com.drug.purchase.service.PurchaseRequestService;

@Service
public class PurchaseRequestServiceImpl implements PurchaseRequestService{
	@Autowired
	private PurchaseRequestMapper purchaseRequestMapper;

	@Override
	public int add(PurchaseRequestDO p) {
		return purchaseRequestMapper.add(p);
	}
	
}
