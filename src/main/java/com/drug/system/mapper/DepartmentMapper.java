package com.drug.system.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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
	@Select("<script>"
			+ "SELECT * FROM department WHERE is_deleted = 0 "
			+ "<if test='ispage != 0'>LIMIT #{beginRow},#{endRow}</if></script>")
	List<DepartmentDO> getAllDepartment(Map<String,Integer> map);
	
	
	/**
	 * 查询部门总数
	 * @return 部门总数
	 */
	@Select("SELECT COUNT(*) FROM department WHERE is_deleted = 0")
	int getSumDepartment();
	
	/**
	 * 逻辑删除用户（修改）
	 * @param departmentId 部门id
	 * @return 受影响行数
	 */
	@Update("update department set is_deleted = 1 where departmentId = #{departmentId}")
	Integer updateByDeleteDepartment(Integer departmentId);
	
	/**
	 * 新增部门
	 * @param departmentDo 部门DO
	 * @return 受影响行数
	 */
	@Insert("INSERT INTO department VALUES(#{departmentId},#{departmentName},#{departmentDes},0)")
	Integer insertByDepartment(DepartmentDO departmentDo);
	
	/**
	 * 修改部门信息
	 * @param departmentDo 部门DO
	 * @return 受影响行数
	 */
	@Update("UPDATE department SET departmentName = #{departmentName},departmentDes = #{departmentDes} WHERE departmentId = #{departmentId}")
	Integer updateByDepartment(DepartmentDO departmentDo);
	
	/**
	 * 查询部门id最大值
	 * @return 部门id最大值
	 */
	@Select("SELECT MAX(departmentId) FROM department")
	int selectMaxId();
	
}
