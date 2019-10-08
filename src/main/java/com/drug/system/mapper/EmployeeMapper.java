package com.drug.system.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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
	@Select("SELECT * FROM employee WHERE emp_user_id = #{empUserId} and is_deleted=0")
	EmployeeDO getEmployeByUserId(String empUserId);

	
	/**
	 * 查询所有员工/单个员工详细信息及员工部门信息（一对一）
	 * @param empId 员工id
	 * @return List<EmployeeDTO> 员工及相关信息DTO
	 */
	List<EmployeeDTO> getAllEmploye(Map<String,Object> map);
	

	/**
	 * 逻辑删除用户（修改）
	 * @param empId 员工id
	 * @return 受影响行数
	 */
	@Update("update employee set is_deleted = 1 where emp_id = #{empId}")
	Integer updateByDeleteEmployee(Integer empId);
	
	
	/**
	 * 新增员工
	 * @param employeeDo 新增员工对象
	 * @return 受影响行数
	 */
	Integer insertByEmployee(EmployeeDO employeeDo);
	
	
	/**
	 * 查询总员工数量
	 * @return 总数
	 */
	int getSumEmployee(Map<String,Object> map);
	
	/**
	 * 查询所有员工
	 * @return 员工对象
	 */
	@Select("SELECT * FROM employee WHERE is_deleted=0")
	List<EmployeeDO> getEmploye(String empUserId);

}
