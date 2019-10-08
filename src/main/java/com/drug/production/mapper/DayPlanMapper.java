package com.drug.production.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.drug.dto.DayPlanDTO;
import com.drug.entity.DayPlanDO;
import com.drug.entity.DayPlanDetailDO;

/**
* @author 李杰
* @version 创建时间：2019年9月15日 下午6:57:34
* 类说明 日计划Mapper
*/
@Repository
public interface DayPlanMapper {
	/**
	 * 新增日生产计划
	 * @param dayPlanDO 日计划DO
	 * @return int 受影响行数
	 */
	int insertByDayPlan(DayPlanDO dayPlanDO);
	
	/**
	 * 新增日生产计划详情
	 * @param list 日计划详情list
	 * @return int 受影响行数
	 */
	int insertByDayPlanDetail(List<DayPlanDetailDO> list);
	
	
	/**
	 * 查询所有日计划
	 * @param map 查询条件
	 * @return 日计划list
	 */
	List<DayPlanDTO> getDayPlan(Map<String,Object> map);
	
	/**
	 * 查询总行数
	 * @param map 条件
	 * @return 行数
	 */
	int getSumLineDayPlan(Map<String,Object> map);
	
	/**
	 * 修改审核状态
	 * @param dayPlanId
	 * @return 受影响行数
	 */
	int updateAuditState(DayPlanDO dayplan);
	
	/**
	 * 根据id查询日计划及详情
	 * @param dayPlanId 日计划id
	 * @return DayPlanDO 日计划DO
	 */
	DayPlanDO getDayPlanById(String dayPlanId);
}
