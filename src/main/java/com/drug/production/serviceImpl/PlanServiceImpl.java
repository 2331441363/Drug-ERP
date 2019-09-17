package com.drug.production.serviceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drug.dto.PlanDTO;
import com.drug.entity.PlanDO;
import com.drug.entity.PlanDetailDO;
import com.drug.production.mapper.PlanDetailMapper;
import com.drug.production.mapper.PlanMapper;
import com.drug.production.service.PlanService;
import com.drug.util.RandomNumberUtils;

/**
* @author 李杰
* @version 创建时间：2019年9月12日 下午3:02:14
* 类说明：月计划接口实现类
*/
@Service
@Transactional
public class PlanServiceImpl implements PlanService {
	@Autowired
	private PlanMapper planMapper;
	@Autowired
	private PlanDetailMapper planDetailMapper;
		
	@Override
	public int deletePlan(int planId) {
		return 0;
	}

	/**
	 * 新增月采购计划
	 */
	@Override
	public int insertPlan(Map<String,List<PlanDTO>> data) {
		SimpleDateFormat  format = new SimpleDateFormat("yyyy-MM-dd");//定义日期格式
		String planId = RandomNumberUtils.getTenIntNumber();	//月计划id
		int empId = data.get("form").get(0).getEmpId();	//制定人id
		Date planTime = data.get("form").get(0).getPlanTime();	//制定时间
		String planComment = data.get("form").get(0).getPlanComment();	//计划描述
		String startTimeString = data.get("form").get(0).getTime().substring(0, 10);	//开始时间
		String endTimeString = data.get("form").get(0).getTime().substring(13, 23);	//结束时间
		Date startTime = null;	//接收转换的时间类型开始时间
		Date endTime =null;	//接收转换的时间类型结束时间：
		try {
			//将字符串转换为日期
			startTime = format.parse(startTimeString);
			endTime = format.parse(endTimeString);	//将字符串转换为日期
		} catch (ParseException e) {
			e.printStackTrace();
		}	
		
		//计划详情list
		List<PlanDTO> detailList = data.get("data");
		//月计划预计生产总数
		int sumNumber = 0;
		//月计划详情list
		List<PlanDetailDO> list = new ArrayList<PlanDetailDO>();
		for(PlanDTO p : detailList) {
			if(p != null && p.getPlanDetailQuantity() != 0) {
				//药品id
				int drugId = p.getDrugId();	
				//预计完成数量
				int planDetailQuantity = p.getPlanDetailQuantity();	
				System.out.println("药品id：" + drugId + "===生产数量："+planDetailQuantity);
				//预计总完成数
				sumNumber+=planDetailQuantity;	
				//封装月计划详情
				PlanDetailDO planDetail = new PlanDetailDO(planId, drugId,planDetailQuantity);
				//添加到月计划集合
				list.add(planDetail);
			}
			
		}
		//封装月计划DO
		PlanDO plan = new PlanDO(planId, empId, planTime, planComment, startTime, endTime, sumNumber);
		//新增月计划
		int row = planMapper.insertPlan(plan);
		//新增月计划详情
		int row2 = planDetailMapper.insertPlanDetail(list);
		if(row <= 0 || row2 <= 0) {
			throw new RuntimeException("制定计划失败");
			
		}
		return 1;
	}

	@Override
	public List<PlanDTO> getAllPlan(Map<String, Object> map) {
		return planMapper.getAllPlan(map);
	}

	@Override
	public int updateAuditState(PlanDO plan) {
		return planMapper.updateAuditState(plan);
	}

	@Override
	public int getSumLinePlan(Map<String, Object> map) {
		return planMapper.getSumLinePlan(map);
	}

	@Override
	public PlanDO getPlanById(String planId) {
		return planMapper.getPlanById(planId);
	}

}
