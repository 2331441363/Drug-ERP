package com.drug.finance.mapper;

import java.util.List;

import com.drug.dto.PayDTO;
import com.drug.dto.ReceiptDTO;

/**
 * @author 冯真真
 * @version 创建时间：2019年9月26日 下午4:18:27 
 * 类说明 总店财务报表mapper
 */
public interface payReportMapper {
	/**
	 * 查询付款日期、合计
	 * 
	 * @return 合计list
	 */
	public List<PayDTO> getDateMoney();

	/**
	 * 查询收款日期、合计
	 * 
	 * @return 合计list
	 */
	public List<ReceiptDTO> getReceiptDateMoney();

}
