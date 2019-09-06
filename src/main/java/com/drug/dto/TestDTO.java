package com.drug.dto;
/**
* @author 李杰
* @version 创建时间：2019年9月5日 上午8:44:54
* 类说明：DTO及使用
*/
public class TestDTO {
	/**
	 * DTO:用于服务与服务之间传递数据，例如Mapper-service-controller
	 * 本次项目中使用在：一对一关系中
	 * 按之前写法，查询一对一数据是在XML中配置<resultMap>一个一个字段与属性进行关联，很麻烦
	 * 而这时使用DTO 你只需要把两个对象中所有可能会用到的属性copy到DTO中
	 * 执行SQL返回就可以直接使用resultType="XXXDTO" 而不需要再配resultMap关系
	 * 注意：相同属性只需要copy一次，例如第一张表的主键和第二张表的外键是同一个字段（同一属性）
	 * 
	 * DTO命名：主对象+DTO 
	 * 例如 查询员工时你又需要查询部门，刚好员工和部门是一对一关系，
	 * 就将员工和部门两个实体需要用到的属性放到一个DTO中
	 * 而命令就以主实体＋DTO  
	 * EmployeeDTO（"员工名DTO"）      而不是"部门名DTO"
	 * DTO是以业务命令，为了辨识所以本次以主实体名+DTO
	 * 
	 * 注意：只用于一对一关系，一对多关系还是得配置resultMap关系，不然就没有意义了
	 * 例子可看（已测试）：员工实体：com.drug.entity.EmployeeDO
	 *        部门实体：com.drug.entity.DepartmentDO
	 *        传输员工及相关数据DTO：com.drug.dto.EmployeeDTO
	 *        DAO层：com.drug.system.mapper.EmployeeMapper.getAllEmploye()
	 *        xml:com.drug.system.mapper.EmployeeMapper.xml(id=getAllEmploye)
	 *        
	 *        
	 * 
	 */
}
