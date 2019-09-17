package com.drug.production.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.drug.entity.PlanDetailDO;

/**
* @author 李杰
* @version 创建时间：2019年9月10日 上午10:59:06
* 类说明：月生产计划详情mapper
*/
@Repository
public interface PlanDetailMapper {
	
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
	@Delete("DELETE FROM plan_detail WHERE plan_id = #{planId}")
	int deletePlanDetail(int planId);
	
	
	/**
	 * 查询月计划详情实际完成总数
	 * @param 月计划id
	 * @return 实际完成总数
	 */
	@Select("SELECT SUM(plan_detail_number) FROM plan_detail WHERE plan_id = #{planId}")
	int getSumPlanDetailNumber(int planId);
	
	
	
}
