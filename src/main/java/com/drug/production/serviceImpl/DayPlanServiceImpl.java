package com.drug.production.serviceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drug.dto.DayPlanDTO;
import com.drug.entity.DayPlanDO;
import com.drug.entity.DayPlanDetailDO;
import com.drug.entity.PlanDO;
import com.drug.entity.PlanDetailDO;
import com.drug.production.mapper.DayPlanMapper;
import com.drug.production.mapper.PlanMapper;
import com.drug.production.service.DayPlanService;
import com.drug.util.RandomNumberUtils;

/**
* @author 李杰
* @version 创建时间：2019年9月15日 下午7:15:20
* 类说明 日计划service实现类
*/
@Service
@Transactional
public class DayPlanServiceImpl implements DayPlanService {
	@Autowired
	private DayPlanMapper dayPlanMapper;
	@Autowired
	private PlanMapper PlanMapper;
	/**
	 * 新增日生产计划
	 */
	@Override
	public String insertByDayPlan(DayPlanDO dayPlanDO) {
		//获取月计划DO
		PlanDO planDO = PlanMapper.getPlanById(dayPlanDO.getPlanId());
		//得到月计划详情list
		List<PlanDetailDO> listDetail = planDO.getListDetailDO();
		//月计划结束时间
		Date endTime = planDO.getEndTime();
		//日期格式化
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		//获取日计划开始日期
		//Date dayBeginTime = dayPlanDO.getDayBeginTime();
		//日计划开始日期到结束月计划结束剩余天数
		int surplusDay = 0;
		try {
			surplusDay = daysBetween(sdf.parse(sdf.format(new Date())),endTime);
			System.out.println("剩余天数："+surplusDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//获取随机日计划id
		String dayPlanId = RandomNumberUtils.getTenIntNumber();
		//日计划详情list
		List<DayPlanDetailDO> listDayPlanDetail = new ArrayList<DayPlanDetailDO>();
		//日计划 计划完成总数
		int sumDayNumber = 0;
		//循环月计划详情list
		for(PlanDetailDO i : listDetail) {
			int drugId = i.getDrugId();	//药品id
			int number = i.getPlanDetailNumber();	//实际完成数
			int quantity = i.getPlanDetailQuantity();	//计划完成数
			//累加每日计划完成数
			sumDayNumber += quantity;
			//获取该详情还未完成数
			int noneNumber = quantity - number;
			//判断未完成数不为0
			if(noneNumber != 0) {
				System.out.println("未完成数："+ noneNumber);
				System.out.println("余数：" + noneNumber % surplusDay);
				//获取平均每日生产数
				int avgNumber = noneNumber/surplusDay;
				//日计划 计划生产数
				int dayPlanNumber = 0;
				System.out.println("除数："+avgNumber);
				//判断平均每日生产数是否为0：为0则未完成数已小于剩余天数
				if(avgNumber == 0) {
					//今日生产数为未完成数
					System.out.println("今日生产："+noneNumber);
					dayPlanNumber = noneNumber;
				}else {	//未完成数小于剩余天数
					//判断未完成数与剩余天数余数不为0：有多余数量  但不够平均一天生产数
					if(noneNumber % surplusDay != 0) {
						//生产数 ： 平均日生产数 + 余数
						dayPlanNumber= avgNumber + (noneNumber % surplusDay);
						System.out.println("今日生产："+ dayPlanNumber);
					}else {
						System.out.println("今日生产："+avgNumber);
						dayPlanNumber = avgNumber;
					}
				}
				
				//封装日计划详情
				DayPlanDetailDO dayPlanDetail = new DayPlanDetailDO(dayPlanId,drugId,dayPlanNumber);
				//添加到list集合中
				listDayPlanDetail.add(dayPlanDetail);
			}
			
		}
		dayPlanDO.setDayPlanId(dayPlanId);
		dayPlanDO.setDayPlannedQuantity(sumDayNumber);
		//调用新增日计划方法
		int rowOne = dayPlanMapper.insertByDayPlan(dayPlanDO);
		//调用新增日计划详情方法
		int rowTwo = insertByDayPlanDetail(listDayPlanDetail);
		if(rowOne <=0 || rowTwo <= 0 || planDO == null) {
			throw new RuntimeException("制定计划失败");
		}
		return "ture";
	}
	
	/**
	 * 新增日计划详情
	 */
	@Override
	public int insertByDayPlanDetail(List<DayPlanDetailDO> list) {
		return dayPlanMapper.insertByDayPlanDetail(list);
	}

	/**
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 相差天数 
     * @throws ParseException  
     * calendar 对日期进行时间操作
     * getTimeInMillis() 获取日期的毫秒显示形式
     */
    public int daysBetween(Date smdate,Date bdate) throws ParseException    
    {    
        Calendar cal = Calendar.getInstance();
        cal.setTime(smdate);
        long time1 = cal.getTimeInMillis();
        cal.setTime(bdate);
        long time2 = cal.getTimeInMillis();      
        long between_days=(time2-time1)/(1000*3600*24);  
        return Integer.parseInt(String.valueOf(between_days+1));           
    }

	@Override
	public List<DayPlanDTO> getDayPlan(Map<String, Object> map) {
		return dayPlanMapper.getDayPlan(map);
	}

	@Override
	public int getSumLineDayPlan(Map<String, Object> map) {
		return dayPlanMapper.getSumLineDayPlan(map);
	}

	@Override
	public int updateAuditState(DayPlanDO dayplan) {
		return dayPlanMapper.updateAuditState(dayplan);
	}
}
