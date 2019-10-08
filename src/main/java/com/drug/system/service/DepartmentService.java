package com.drug.system.service;

import java.util.List;
import java.util.Map;

import com.drug.entity.DepartmentDO;

/**
* @author 李杰
* @version 创建时间：2019年9月8日 下午5:03:39
* 类说明 部门
*/
public interface DepartmentService {
	/**
	 * 查询所有部门信息
	 * @return 部门集合
	 */
	List<DepartmentDO> getAllDepartment(Map<String,Integer> map);
	
	/**
	 * 查询部门总数
	 * @return 部门总数
	 */
	int getSumDepartment();
	
	/**
	 * 逻辑删除用户（修改）
	 * @param departmentId 部门id
	 * @return 受影响行数
	 */
	Integer updateByDeleteDepartment(Integer departmentId);
	
	/**
	 * 新增部门
	 * @param departmentDo 部门DO
	 * @return 受影响行数
	 */
	Integer insertByDepartment(DepartmentDO departmentDo);
	
	/**
	 * 查询部门id最大值
	 * @return 部门id最大值
	 */
	int selectMaxId();
	
	/**
	 * 修改部门信息
	 * @param departmentDo 部门DO
	 * @return 受影响行数
	 */
	Integer updateByDepartment(DepartmentDO departmentDo);
}
