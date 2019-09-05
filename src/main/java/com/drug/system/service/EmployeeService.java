package com.drug.system.service;


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
}
