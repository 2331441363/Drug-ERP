package com.drug.dto;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月5日 下午2:56:48
* 类说明：员工数据DTO
*/
@Data
public class EmployeeDTO {
	/**
	 * 员工id
	 */
	private Integer empId;
	
	/**
	 * 员工账号
	 */
	private String empUserId;
	
	/**
	 * 员工密码
	 */
	private String empPassword;
	
	/**
	 * 员工姓名
	 */
	private String empName;
	
	/**
	 * 员工年龄
	 */
	private String empAge;
	
	/**
	 * 员工性别
	 */
	private String empSex;
	
	/**
	 * 员工身份证
	 */
	private String empCard;
	
	/**
	 * 员工手机号码
	 */
	private String empPhone;
	
	/**
	 * 员工地址
	 */
	private String empAddress;
	
	/**
	 * 工资
	 */
	private Integer empSalary;
	
	/**
	 * 员工照片
	 */
	private String empPhoto;
	
	/**
	 * 部门id
	 */
	private Integer departmentId;
	
	/**
	 * 部门名称
	 */
	private String departmentName;
	
	/**
	 * 部门描述
	 */
	private String departmentDes;
}
