package com.drug.production.service;

import java.util.List;
import java.util.Map;

import com.drug.dto.PlanDTO;
import com.drug.entity.PlanDO;

/**
* @author 李杰
* @version 创建时间：2019年9月12日 下午3:00:49
* 类说明：订单Service接口
*/
public interface PlanService {
	/**
	 * 逻辑删除月计划
	 * @param planId
	 * @return 受影响行数
	 */
	int deletePlan(int planId);
	
	/**
	 * 新增月计划
	 * @return 受影响行数
	 */
	int insertPlan(Map<String,List<PlanDTO>> data);
	
	/**
	 * 查询所有月计划
	 * @return 月计划DTO集合
	 */
	List<PlanDTO> getAllPlan(Map<String,Object> map);
	
	
	/**
	 * 修改审核状态
	 * @param planId
	 * @return 受影响行数
	 */
	int updateAuditState(PlanDO plan);
	
	/**
	 * 查询总行数
	 * @param map 条件
	 * @return 行数
	 */
	int getSumLinePlan(Map<String,Object> map);
	
	/**
	 * 根据id查询月计划
	 * @param planId 月计划id
	 * @return PlanDO 月计划DOO
	 */
	PlanDO getPlanById(String planId);
}
