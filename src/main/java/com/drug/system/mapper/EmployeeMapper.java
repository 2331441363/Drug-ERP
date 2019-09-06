package com.drug.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.drug.dto.EmployeeDTO;
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
	@Select("SELECT * FROM employee WHERE emp_user_id = #{empUserId}")
	EmployeeDO getEmployeByUserId(String empUserId);

	
	/**
	 * 查询所有员工/单个员工详细信息及员工部门信息（一对一）
	 * @param empId 员工id
	 * @return List<EmployeeDTO> 员工及相关信息DTO
	 */
	List<EmployeeDTO> getAllEmploye(int empId);
	
	
}
