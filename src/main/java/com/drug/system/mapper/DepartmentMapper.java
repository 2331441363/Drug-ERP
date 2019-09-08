package com.drug.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.drug.entity.DepartmentDO;
/**
* @author 李杰
* @version 创建时间：2019年9月3日 上午9:19:05
* 类说明：部门mapper
*/
@Repository
public interface DepartmentMapper {
	/**
	 * 查询所有部门信息
	 * @return 部门集合
	 */
	@Select("SELECT * FROM department")
	List<DepartmentDO> getAllDepartment();
	
	
}
