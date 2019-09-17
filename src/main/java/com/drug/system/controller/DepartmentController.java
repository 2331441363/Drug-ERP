package com.drug.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.DepartmentDO;
import com.drug.entity.LayuiTablePageDO;
import com.drug.system.service.DepartmentService;
import com.drug.util.ReturnDataUtils;

/**
* @author 李杰
* @version 创建时间：2019年9月8日 下午5:01:33
* 类说明 部门有关controller
*/
@Controller
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	
	/**
	 *下拉框 查询所有部门
	 * @return 部门集合
	 */
	@RequestMapping("/queryDepartment")
	@ResponseBody
	public List<DepartmentDO> queryDepartment() {
		Map<String,Integer> map = new  HashMap<String,Integer>();
		map.put("ispage", 0);
		List<DepartmentDO> list = departmentService.getAllDepartment(map);
		return list;
	}
	
	/**
	 * 查询所有部门
	 * @return 部门集合
	 */
	@RequestMapping("/queryDepartmentPage")
	@ResponseBody
	public Map<String,Object> queryDepartment2(LayuiTablePageDO layuiTable) {
		Map<String,Integer> map = new  HashMap<String,Integer>();
		map.put("beginRow", layuiTable.getBeginRow());
		map.put("endRow", layuiTable.getEndRow());
		List<DepartmentDO> list = departmentService.getAllDepartment(map);
		Map<String,Object> utilMap = ReturnDataUtils.responseByData();
		utilMap.put("data", list);
		utilMap.put("count",departmentService.getSumDepartment());
		return utilMap;
	}
	
	/**
	 * 新增部门
	 * @param departmentDO 部门do
	 * @return 结果
	 */
	@RequestMapping("/insertDepartment")
	@ResponseBody
	public String insertDepartment(DepartmentDO departmentDO) {
		int row = departmentService.insertByDepartment(departmentDO);
		if(row > 0) {
			return "true";
		}
		return "false";
	}
	
	/**
	 * 删除部门
	 * @param departmentId 部门id
	 * @return 结果
	 */
	@RequestMapping("/deleteDepartment")
	@ResponseBody
	public String deleteDepartment(int departmentId) {
		int row = departmentService.updateByDeleteDepartment(departmentId);
		if(row > 0) {
			return "true";
		}
		return "false";
	}
	
	/**
	 * 编辑部门信息
	 * @param departmentDO 部门DO
	 * @return 结果
	 */
	@RequestMapping("/updateDepartment")
	@ResponseBody
	public String updateDepartment(DepartmentDO departmentDO) {
		int row = departmentService.updateByDepartment(departmentDO);
		if(row > 0) {
			return "true";
		}
		return "false";
	}

	
}
