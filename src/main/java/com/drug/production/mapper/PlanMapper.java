package com.drug.production.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.drug.dto.PlanDTO;
import com.drug.entity.PlanDO;

/**
* @author 李杰
* @version 创建时间：2019年9月10日 上午10:18:50
* 类说明 月计划mapper
*/
@Repository
public interface PlanMapper {
	/**
	 * 逻辑删除月计划
	 * @param planId
	 * @return 受影响行数
	 */
	@Update("UPDATE plan SET is_deleted = 1 WHERE emp_id = #{empId}")
	int deletePlan(int planId);
	
	/**
	 * 新增月计划
	 * @return 受影响行数
	 */
	@Insert("INSERT INTO plan "
			+ "VALUES(#{planId},#{empId},#{planTime},NULL,NULL,0,NULL,#{planComment},"
			+ "#{startTime},#{endTime},#{plannedQuantity},0,0)")
	int insertPlan(PlanDO plan);
	
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
	@Update("UPDATE plan SET audit_id=#{auditId},"
			+ "audit_time=#{auditTime},audit_state=#{auditState},"
			+ "audit_comment=#{auditComment} WHERE plan_id = #{planId}")
	int updateAuditState(PlanDO plan);
	
	
	/**
	 * 查询总行数
	 * @param map 条件
	 * @return 行数
	 */
	int getSumLinePlan(Map<String,Object> map);
	
	/**
	 * 根据id查询月计划及详情
	 * @param planId 月计划id
	 * @return PlanDO 月计划DOO
	 */
	PlanDO getPlanById(String planId);
}
