package com.drug.production.service;

import java.util.List;
import java.util.Map;

import com.drug.dto.OrderPlanDTO;
import com.drug.entity.OrderDetailsPlanDO;
import com.drug.entity.OrderPlanDO;

/**
* @author 李杰
* @version 创建时间：2019年9月16日 下午3:07:31
* 类说明 生产订单service接口
*/
public interface OrderPlanService {
	/**
	 * 新增生产订单
	 * @param orderPlanDO 生产订单DO
	 * @return int 受影响行数
	 */
	String insertByOrderPlan(OrderPlanDO orderPlanDO);
	
	/**
	 * 新增生产订单详情
	 * @param list 生产订单详情list
	 * @return int 受影响行数
	 */
	int insertByOrderPlanDetail(List<OrderDetailsPlanDO> list);
	
	
	/**
	 * 查询所有生产订单
	 * @param map 查询条件
	 * @return 日计划list
	 */
	List<OrderPlanDTO> getOrderPlan(Map<String,Object> map);
	
	/**
	 * 查询总行数
	 * @param map 条件
	 * @return 行数
	 */
	int getSumLineOrderPlan(Map<String,Object> map);
	
	/**
	 * 修改审核状态
	 * @param orderplan 修改订单DO
	 * @return 受影响行数
	 */
	int updateAuditState(OrderPlanDO orderPlan);
}
