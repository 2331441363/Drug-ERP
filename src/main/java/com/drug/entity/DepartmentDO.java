package com.drug.entity;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月3日 下午4:39:04
* 类说明 部门实体
*/
@Data
public class DepartmentDO {
	/**
	 * 部门id
	 */
	private int departmentId;
	
	/**
	 * 部门名称
	 */
	private String departmentName;
	
	/**
	 * 部门描述
	 */
	private String departmentDes;
}
