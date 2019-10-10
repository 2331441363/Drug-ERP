package com.drug.finance.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.BranchinfrDO;
import com.drug.finance.mapper.branchinfrMapper;
import com.drug.finance.service.branchinfrService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月15日 上午8:43:32 
 * 类说明 分店信息Service实现类
 */
@Service
public class branchinfrServiceImpl implements branchinfrService {
	@Autowired
	private branchinfrMapper branchinfrmapper;

	/**
	 * 查询所有分店名称
	 */
	public List<String> getAllBranchName() {
		return branchinfrmapper.getAllBranchName();
	}

	/**
	 * 新增分店
	 */
	public int addBranch(Map<String, Object> map) {
		return branchinfrmapper.addBranch(map);
	}

	/**
	 * 查询所有分店
	 */
	public List<BranchinfrDO> getAllBranch(Map<String, Object> map) {
		return branchinfrmapper.getAllBranch(map);
	}

	/**
	 * 查询所有分店总数
	 */
	public int getAllBranchCount(Map<String, Object> map) {
		return branchinfrmapper.getAllBranchCount(map);
	}

	/**
	 * 删除分店
	 */
	public int delBranch(int bid) {
		return branchinfrmapper.delBranch(bid);
	}

	/**
	 * 修改分店信息
	 */
	public int updBranch(Map<String, Object> map) {
		return branchinfrmapper.updBranch(map);
	}
}
