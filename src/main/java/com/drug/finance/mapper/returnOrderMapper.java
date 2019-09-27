package com.drug.finance.mapper;

import java.util.Map;

/**
 * @author 肖影
 * @version 创建时间：2019年9月25日 上午8:49:06 
 * 类说明 分店退货单mapper
 */
public interface returnOrderMapper {
	/**
	 * 修改分店退货单收款状态
	 * 
	 * @param map 条件
	 * @return 受影响行数
	 */
	public int updBranchReturnStatus(Map<String, Object> map);
}
