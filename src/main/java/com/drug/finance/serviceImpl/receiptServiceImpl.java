package com.drug.finance.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.drug.entity.ReceiptDO;
import com.drug.finance.mapper.receiptMapper;
import com.drug.finance.service.receiptService;

/**
* @author 肖影
* @version 创建时间：2019年9月5日 下午7:00:10
* 类说明
*/
@Service
public class receiptServiceImpl implements receiptService{
	@Autowired
	private receiptMapper receiptmapper;
	
	@Override
	public List<ReceiptDO> getReceipt() {
		return receiptmapper.getReceipt();
	}

	@Override
	public void addReceipt(ReceiptDO receipt) {
		receiptmapper.addReceipt(receipt);
	}

}
