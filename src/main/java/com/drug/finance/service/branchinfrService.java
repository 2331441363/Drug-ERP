package com.drug.finance.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.drug.entity.BranchinfrDO;

/**
 * @author 肖影
 * @version 创建时间：2019年9月15日 上午8:39:52 
 * 类说明 分店信息Service
 */
@Repository
public interface branchinfrService {

	/**
	 * 查询分店名称
	 * 
	 * @return 分店名称list
	 */
	public List<String> getAllBranchName();

	/**
	 * 查询所有分店
	 * 
	 * @return 分店list
	 */
	public List<BranchinfrDO> getAllBranch(Map<String, Object> map);

	/**
	 * 查询所有分店总数
	 * 
	 * @param map 查询条件
	 * @return int 所有分店总数
	 */
	public int getAllBranchCount(Map<String, Object> map);

	/**
	 * 新增分店
	 * 
	 * @param map 分店信息
	 * @return int 受影响行数
	 */
	public int addBranch(Map<String, Object> map);

	/**
	 * 删除分店
	 * 
	 * @param bid 分店id
	 * @return int 受影响行数
	 */
	public int delBranch(int bid);

	/**
	 * 修改分店信息
	 * 
	 * @param bid 分店id
	 * @return int 受影响行数
	 */
	public int updBranch(Map<String, Object> map);
}
