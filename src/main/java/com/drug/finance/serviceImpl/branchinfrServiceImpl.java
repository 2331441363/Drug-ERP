package com.drug.finance.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.finance.mapper.branchinfrMapper;
import com.drug.finance.service.branchinfrService;

/**
* @author 肖影
* @version 创建时间：2019年9月15日 上午8:43:32
* 类说明
*/
@Service
public class branchinfrServiceImpl implements branchinfrService{
	@Autowired
	private branchinfrMapper branchinfrmapper;
	
	public List<String> getAllBranchName(){
		return branchinfrmapper.getAllBranchName();
	}
}
