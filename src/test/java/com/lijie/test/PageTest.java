package com.lijie.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.drug.dto.EmployeeDTO;
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
	
	@Test
	public void getAllEmploye() {
		List<EmployeeDTO> listEmployee = employeeService.getAllEmploye(100);
		listEmployee.forEach(System.out::println);
	}
}
