package com.drug.system.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.DepartmentDO;
import com.drug.system.mapper.DepartmentMapper;
import com.drug.system.service.DepartmentService;

/**
* @author 李杰
* @version 创建时间：2019年9月8日 下午5:04:28
* 类说明
*/
@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public List<DepartmentDO> getAllDepartment(Map<String,Integer> map) {
		return departmentMapper.getAllDepartment(map);
	}

	@Override
	public int getSumDepartment() {
		return departmentMapper.getSumDepartment();
	}

	@Override
	public Integer updateByDeleteDepartment(Integer departmentId) {
		return departmentMapper.updateByDeleteDepartment(departmentId);
	}

	@Override
	public Integer insertByDepartment(DepartmentDO departmentDo) {
		departmentDo.setDepartmentId(selectMaxId()+1);
		return departmentMapper.insertByDepartment(departmentDo);
	}

	@Override
	public int selectMaxId() {
		return departmentMapper.selectMaxId();
	}

	@Override
	public Integer updateByDepartment(DepartmentDO departmentDo) {
		return departmentMapper.updateByDepartment(departmentDo);
	}
	
	

}
