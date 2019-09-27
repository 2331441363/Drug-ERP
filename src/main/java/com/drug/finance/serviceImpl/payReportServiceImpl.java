package com.drug.finance.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.dto.PayDTO;
import com.drug.dto.ReceiptDTO;
import com.drug.finance.mapper.payMapper;
import com.drug.finance.mapper.payReportMapper;
import com.drug.finance.service.payReportService;

/**
 * @author 冯真真
 * @version 创建时间：2019年9月26日 下午4:20:44 
 * 类说明 总店财务报表service实现类
 */
@Service
public class payReportServiceImpl implements payReportService {
	@Autowired
	private payReportMapper payReportMapper;

	/**
	 * 查询付款日期、合计
	 */
	@Override
	public List<PayDTO> getDateMoney() {
		return payReportMapper.getDateMoney();
	}

	/**
	 * 查询收款日期、合计
	 */
	@Override
	public List<ReceiptDTO> getReceiptDateMoney() {
		return payReportMapper.getReceiptDateMoney();
	}
}
