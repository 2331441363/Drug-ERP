package com.drug.system.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.drug.entity.EmployeeDO;

/**
* @author 李杰
* @version 创建时间：2019年9月3日 上午9:19:05
* 类说明：员工mapper
*/
@Repository
public interface EmployeeMapper {
	/**
	 * 通过员工账号查询员工对象
	 * @param empUserId 员工账号
	 * @return 员工对象
	 */
	@Select("SELECT emp_id,emp_user_id,emp_password,emp_name,emp_photo,departmentId FROM employee WHERE emp_user_id = #{empUserId}")
	EmployeeDO getEmployeByUserId(String empUserId);
}
