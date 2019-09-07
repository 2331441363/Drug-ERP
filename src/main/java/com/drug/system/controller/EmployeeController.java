package com.drug.system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.dto.EmployeeDTO;
import com.drug.entity.EmployeeDO;
import com.drug.system.service.EmployeeService;

/**
* @author 李杰
* @version 创建时间：2019年9月3日 上午9:57:19
* 员工web控制层
*/
@Controller
public class EmployeeController {
	@Autowired
	private EmployeeService employeeService;
	
	/**
	 * 员工登录
	 * @param employee 登录员工对象
	 * @param session 会话
	 * @return string 登录结果
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String empLogin(EmployeeDO employee,HttpSession session) {
		//主体,当前状态为没有认证的状态“未认证”
		Subject subject = SecurityUtils.getSubject();
		// 登录后存放进shiro token
        UsernamePasswordToken token=new UsernamePasswordToken(employee.getEmpUserId(),employee.getEmpPassword());
        //登录方法（认证是否通过）
        //使用subject调用securityManager,安全管理器调用Realm
        EmployeeDO employeeDo;
        try {
        	System.out.println("1、进入认证方法");
            //利用异常操作
            //需要开始调用到Realm中
        	subject.login(token);
        	employeeDo = (EmployeeDO)subject.getPrincipal();
            System.out.println("登录完成");
        } catch (UnknownAccountException e) {
            return "false";
        }
        return "true";
	}
	
	
	/**
	 * 查询员工/员工详细信息
	 */
	@RequestMapping("/queryEmploye")
	@ResponseBody
	public List<EmployeeDTO> getAllEmploye(@RequestParam(required=false)Integer empId) {
		List<EmployeeDTO> listEmployee = new ArrayList<>();
		if(empId != null) {
			listEmployee = employeeService.getAllEmploye(100);
		}else {
			listEmployee = employeeService.getAllEmploye(0);
		}
		return listEmployee;
	}
	
}
