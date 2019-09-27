package com.drug.finance.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.finance.mapper.returnOrderMapper;
import com.drug.finance.service.returnOrderService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月25日 上午8:54:30 
 * 类说明 分店退货单Service实现类
 */
@Service
public class returnOrderServiceImpl implements returnOrderService {

	@Autowired
	private returnOrderMapper returnOrderMapper;

	@Override
	public int updBranchReturnStatus(Map<String, Object> map) {
		return returnOrderMapper.updBranchReturnStatus(map);
	}

}
