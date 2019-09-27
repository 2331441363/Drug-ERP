package com.drug.finance.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.drug.dto.PayDTO;
import com.drug.dto.ReceiptDTO;

/**
 * @author 冯真真
 * @version 创建时间：2019年9月26日 下午4:19:51 
 * 类说明 总店财务报表service
 */
@Repository
public interface payReportService {
	/**
	 * 查询付款日期、合计
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
