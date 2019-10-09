package com.drug.finance.service;
/**
* @author 肖影
* @version 创建时间：2019年9月17日 下午8:35:27
* 类说明 付款单Service
*/

import java.util.List;
import java.util.Map;

import com.drug.dto.PayDTO;
public interface payService {
	/**
	 * 查询所有付款单 
	 * @param map 查询条件 
	 * @return 付款单list
	 */
	public List<PayDTO> getPay(Map<String,Object> map);
	
	
	/**
	 * 查询付款总行数
	 * @param map 查询条件
	 * @return Integer 付款总行数
	 */
	public Integer getPayCount(Map<String,Object> map);
	
	
	/**
	 * 删除付款单
	 * @param pid 付款单id
	 * @return int 受影响行数
	 */
	public int delPay(int pid);
	
	
	/**
	 * 修改付款单
	 * 
	 * @param map 查询条件
	 * @return int 受影响行数
	 */
	public int updPay(Map<String,Object> map);
	
	/**
	 * 修改分店退货单付款状态
	 * 
	 * @param map 修改后的付款信息
	 * @return int 受影响行数
	 */
	public int updBrachBackPay(Map<String, Object> map);
	
	/**
	 * 查询付款日期、合计
	 * @return 合计list
	 */
	public List<PayDTO> getDateMoney();
}
