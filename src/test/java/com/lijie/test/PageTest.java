package com.lijie.test;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.drug.entity.DayPlanDO;
import com.drug.production.service.DayPlanService;
import com.drug.system.service.EmployeeService;

/**
* @author 李杰
* @version 创建时间：2019年9月5日 下午3:32:48
* 类说明
*/
@WebAppConfiguration
@ContextConfiguration({ "classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class PageTest {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private DayPlanService dayPlanService;
	
	@Test
	public void insertByDayPlan() {
		DayPlanDO dayPlanDO = new DayPlanDO();
		dayPlanDO.setPlanId("157052596");
		dayPlanService.insertByDayPlan(dayPlanDO);
	}

}
