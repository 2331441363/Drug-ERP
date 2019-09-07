package com.drug.finance.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.drug.entity.ReceiptDO;

/**
* @author 肖影
* @version 创建时间：2019年9月5日 下午6:59:34
* 类说明
*/
public interface receiptService {
	/**
	 * 查询收款单
	 * @return 收款单
	 */
	public List<ReceiptDO> getReceipt();
	
	/**
	 * 新增收款单
	 * @param receipt 收款单
	 */
	public void addReceipt(ReceiptDO receipt);
}
