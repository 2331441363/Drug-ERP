package com.drug.production.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drug.dto.OrderPlanDTO;
import com.drug.entity.DayPlanDO;
import com.drug.entity.DayPlanDetailDO;
import com.drug.entity.OrderDetailsPlanDO;
import com.drug.entity.OrderPlanDO;
import com.drug.production.mapper.DayPlanMapper;
import com.drug.production.mapper.OrderPlanMapper;
import com.drug.production.service.OrderPlanService;
import com.drug.util.RandomNumberUtils;

/**
* @author 李杰
* @version 创建时间：2019年9月16日 下午3:08:07
* 类说明 生产订单service实现类
*/
@Service
@Transactional
public class OrderPlanServiceImpl implements OrderPlanService {
	@Autowired
	private OrderPlanMapper orderPlanMapper;
	@Autowired
	private DayPlanMapper dayPlanMapper;
	
	/**
	 * 新增生产订单
	 */
	@Override
	public String insertByOrderPlan(OrderPlanDO orderPlanDO) {
		//根据日计划id查询出日计划
		DayPlanDO dayPlanDO = dayPlanMapper.getDayPlanById(orderPlanDO.getDayPlanId());
		//获取生产计划id
		String orderPlanId = RandomNumberUtils.getTenIntNumber();
		//sett到生产订单DO中
		orderPlanDO.setOrderPlanId(orderPlanId);
		//获取日计划计划完成数
		int orderPlanNumber = dayPlanDO.getDayPlannedQuantity();
		//sett到生产订单DO中
		orderPlanDO.setOrderPlanNumber(orderPlanNumber);
		//获取日计划详情list
		List<DayPlanDetailDO> listDayDetail = dayPlanDO.getListDayPlanDetail();
		//生产订单详情list
		List<OrderDetailsPlanDO> listOrderDetail = new ArrayList<OrderDetailsPlanDO>();
		//循环日计划详情list
		for(DayPlanDetailDO d : listDayDetail) {
			//封装订单详情DO
			OrderDetailsPlanDO orderDetailsPlanDO = new OrderDetailsPlanDO(orderPlanId, 
					d.getDrugId(), d.getDayPlanNumber());
			//添加到订单详情list
			listOrderDetail.add(orderDetailsPlanDO);
		}
		
		//调用新增生产订单方法
		int rowOne = orderPlanMapper.insertByOrderPlan(orderPlanDO);
		//调用新增生产订单详情方法
		int rowTwo = insertByOrderPlanDetail(listOrderDetail);
		
		if(rowOne <= 0 || rowTwo <= 0 || dayPlanDO == null) {
			throw new RuntimeException("制定生产订单失败");
		}
		return "ture";
	}

	
	@Override
	public int insertByOrderPlanDetail(List<OrderDetailsPlanDO> list) {
		return orderPlanMapper.insertByOrderPlanDetail(list);
	}

	@Override
	public List<OrderPlanDTO> getOrderPlan(Map<String, Object> map) {
		return orderPlanMapper.getOrderPlan(map);
	}

	@Override
	public int getSumLineOrderPlan(Map<String, Object> map) {
		return orderPlanMapper.getSumLineOrderPlan(map);
	}

	@Override
	public int updateAuditState(OrderPlanDO orderPlan) {
		return orderPlanMapper.updateAuditOrderState(orderPlan);
	}

}
