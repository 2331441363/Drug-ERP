package com.drug.production.service;

import java.util.List;

import com.drug.entity.PlanDetailDO;

/**
* @author 李杰
* @version 创建时间：2019年9月12日 下午3:00:49
* 类说明:订单详情server接口
*/
public interface PlanDetailService {
	/**
	 * 新增月计划详情
	 * @param list 详情list
	 * @return 受影响行数
	 */
	int insertPlanDetail(List<PlanDetailDO> list);
	
	/**
	 * 删除月计划详情
	 * @param 月计划id
	 * @return 受影响行数
	 */
	int deletePlanDetail(int planId);
	
	
	/**
	 * 查询月计划实际完成总数
	 * @param 月计划id
	 * @return 实际完成总数
	 */
	int getSumPlanDetailNumber(int planId);
}
