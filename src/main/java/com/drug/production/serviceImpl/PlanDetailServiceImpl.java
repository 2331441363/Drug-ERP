package com.drug.production.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.drug.entity.PlanDetailDO;
import com.drug.production.service.PlanDetailService;

/**
* @author 李杰
* @version 创建时间：2019年9月12日 下午3:03:25
* 类说明：月计划详情server实现类
*/
@Service
public class PlanDetailServiceImpl implements PlanDetailService {

	@Override
	public int insertPlanDetail(List<PlanDetailDO> list) {
		return 0;
	}

	@Override
	public int deletePlanDetail(int planId) {
		return 0;
	}

	@Override
	public int getSumPlanDetailNumber(int planId) {
		return 0;
	}

}
