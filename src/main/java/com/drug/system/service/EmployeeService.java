package com.drug.system.service;


import java.util.List;

import com.drug.dto.EmployeeDTO;
import com.drug.entity.EmployeeDO;

/**
* @author 李杰
* @version 创建时间：2019年9月3日 上午9:54:34
* 员工service
*/
public interface EmployeeService {
	/**
	 * 通过员工账号查询员工对象
	 * @param empUserId 员工账号
	 * @return
	 */
	EmployeeDO getEmployeByUserId(String empUserId);
	
	/**
	 * 查询所有员工/单个员工详细信息及员工部门信息（一对一）、
	 * @param empId 员工id
	 * @return List<EmployeeDTO> 员工及相关信息DTO
	 */
	List<EmployeeDTO> getAllEmploye(int empId);
}
