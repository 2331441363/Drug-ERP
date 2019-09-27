package com.drug.finance.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.drug.dto.ReceiptDTO;
import com.drug.finance.mapper.receiptMapper;
import com.drug.finance.service.receiptService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月5日 下午7:00:10 
 * -类说明 收款单Service实现类
 */
@Service
public class receiptServiceImpl implements receiptService {
	@Autowired
	private receiptMapper receiptmapper;

	/**
	 * 查询所有收款单
	 */
	@Override
	public List<ReceiptDTO> getReceipt(Map<String, Object> map) {
		return receiptmapper.getReceipt(map);
	}

	

	/**
	 * 查询收款总行数
	 */
	@Override
	public Integer getReceptCount() {
		return receiptmapper.getReceptCount();
	}

	/**
	 * 删除收款
	 */
	@Override
	public int delReceipt(int rid) {
		return receiptmapper.delReceipt(rid);
	}

	/**
	 * 修改收款
	 */
	@Override
	public int updReceipt(Map<String, Object> map) {
		return receiptmapper.updReceipt(map);
	}
}
