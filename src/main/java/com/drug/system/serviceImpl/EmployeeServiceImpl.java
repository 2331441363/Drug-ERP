package com.drug.system.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.dto.EmployeeDTO;
import com.drug.entity.EmployeeDO;
import com.drug.system.mapper.EmployeeMapper;
import com.drug.system.service.EmployeeService;

/**
* @author 李杰
* @version 创建时间：2019年9月3日 上午9:55:49
* 类说明
*/
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeMapper EmployeeMapper;
	
	@Override
	public EmployeeDO getEmployeByUserId(String empUserId) {
		
		return EmployeeMapper.getEmployeByUserId(empUserId);
	}

	@Override
	public List<EmployeeDTO> getAllEmploye(int empId) {
		return EmployeeMapper.getAllEmploye(empId);
	}

}
