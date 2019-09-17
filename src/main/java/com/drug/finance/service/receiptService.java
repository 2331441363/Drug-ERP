package com.drug.finance.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.drug.dto.ReceiptDTO;

/**
* @author 肖影
* @version 创建时间：2019年9月5日 下午6:59:34
* 类说明
*/
@Repository
public interface receiptService {
	/**
	 * 查询收款单
	 * @return 收款单
	 */
	public List<ReceiptDTO> getReceipt(Map<String,	Object> map);
	/**
	 * 查询收款日期、合计
	 * @return
	 */
	public List<ReceiptDTO> getReceiptDateMoney();
	
	
	/**
	 * 查询收款总行数
	 * @return
	 */
	public Integer getReceptCount();
	
}
