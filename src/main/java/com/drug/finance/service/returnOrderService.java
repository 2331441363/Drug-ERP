package com.drug.finance.service;

import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * @author 肖影
 * @version 创建时间：2019年9月25日 上午8:53:44 
 * 类说明 分店退货单Service
 */
@Repository
public interface returnOrderService {
	/**
	 * 修改分店退货单收款状态
	 * @param map 条件
	 * @return 受影响行数
	 */
	public int updBranchReturnStatus(Map<String, Object> map);
}
