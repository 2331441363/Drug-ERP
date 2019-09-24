package com.drug.finance.mapper;
/**
* @author 肖影
* @version 创建时间：2019年9月5日 下午6:57:34
* 类说明 收款单mapper
*/

import java.util.List;
import java.util.Map;

import com.drug.dto.ReceiptDTO;

public interface receiptMapper {

	/**
	 * 查询所有收款单
	 * 
	 * @param map 查询条件
	 * @return 收款单list
	 */
	public List<ReceiptDTO> getReceipt(Map<String, Object> map);

	/**
	 * 查询收款日期、合计
	 * 
	 * @return 合计list
	 */
	public List<ReceiptDTO> getReceiptDateMoney();

	/**
	 * 查询收款总行数
	 * 
	 * @return Integer 收款总行数
	 */
	public Integer getReceptCount();

	/**
	 * 删除收款
	 * 
	 * @param rid 收款id
	 * @return int 受影响行数
	 */
	public int delReceipt(int rid);

	/**
	 * 修改收款
	 * 
	 * @param map 收款单信息
	 * @return int 受影响行数
	 */
	public int updReceipt(Map<String, Object> map);
}
