package com.drug.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.drug.finance.mapper.branchinfrMapper;

/**
* @author 肖影
* @version 创建时间：2019年9月15日 上午8:39:52
* 类说明
*/
@Repository
public interface branchinfrService {
	
	/**
	 * 查询分店名称
	 * @return 分店名称集合
	 */
	public List<String> getAllBranchName();
}
