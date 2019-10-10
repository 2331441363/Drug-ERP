package com.drug.finance.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	public List<ReceiptDTO> getReceipt(Map<String, Object> map) {
		return receiptmapper.getReceipt(map);
	}

	

	/**
	 * 查询收款总行数
	 */
	public Integer getReceptCount(Map<String, Object> map) {
		return receiptmapper.getReceptCount(map);
	}

	/**
	 * 删除收款
	 */
	public int delReceipt(int rid) {
		return receiptmapper.delReceipt(rid);
	}

	/**
	 * 修改收款
	 */
	public int updReceipt(Map<String, Object> map) {
		return receiptmapper.updReceipt(map);
	}
	
	/**
	 * 查询收款日期、合计
	 */
	public List<ReceiptDTO> getReceiptDateMoney() {
		return receiptmapper.getReceiptDateMoney();
	}
}
