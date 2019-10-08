package com.drug.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.drug.dto.EmployeeDTO;
import com.drug.entity.EmployeeDO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.system.service.EmployeeService;
import com.drug.util.ReturnDataUtils;

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
	 *下拉框 查询所有部门
	 * @return 部门集合
	 */
	@RequestMapping("/queryEmployee")
	@ResponseBody
	public List<EmployeeDO> queryDepartment() {
		Map<String,Integer> map = new  HashMap<String,Integer>();
		map.put("ispage", 0);
		List<EmployeeDO> list = employeeService.getEmploye(null);
		return list;
	}
	
	
	/**
	 * 查询员工/员工详细信息
	 */
	@RequestMapping("/queryEmploye")
	@ResponseBody
	public Map<String, Object> getAllEmploye(EmployeeDO employee,LayuiTablePageDO layuiTablePageDO) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("employee", employee);	//要搜索的员工对象
		map.put("beginRow", layuiTablePageDO.getBeginRow());
		map.put("endRow", layuiTablePageDO.getEndRow());
		//查询分页后数据
		List<EmployeeDTO> listEmployee = employeeService.getAllEmploye(map);
		//查询总行数
		int sumRow = employeeService.getSumEmployee(map);
		//调用返回数据工具类
		Map<String, Object> util = ReturnDataUtils.responseByData();
		util.put("data", listEmployee);	//数据
		util.put("count", sumRow);	//总行数
		return util;
	}
	
	/**
	 * 逻辑删除员工
	 */
	@RequestMapping("/deleteEmployee")
	@ResponseBody
	public String deleteEmployee(Integer empId) {
		int row = employeeService.updateByDeleteEmployee(empId);
		if(row > 0) {
			return "true";
		}
		return "false";
	}
	
	
	/**
	 * 新增员工
	 * @param file 上传图片
	 * @param employeeDTO	员工dto
	 * @return 结果
	 */
	@RequestMapping("insertEmployee")
	public String insertEmployee(MultipartFile file,EmployeeDTO employeeDTO) {
		
		return null;
	}
	
	
}
