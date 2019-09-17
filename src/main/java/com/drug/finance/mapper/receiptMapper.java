package com.drug.finance.mapper;
/**
* @author 肖影
* @version 创建时间：2019年9月5日 下午6:57:34
* 类说明
*/

import java.util.List;
import java.util.Map;

import com.drug.dto.ReceiptDTO;


public interface receiptMapper {
	
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
