package com.drug.finance.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.finance.mapper.BranchGoodsMapper;
import com.drug.finance.service.BranchGoodsService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月18日 上午8:43:57 
 * 类说明 分店商品Service实现类
 */
@Service
public class BranchGoodsServiceImpl implements BranchGoodsService {
	@Autowired
	private BranchGoodsMapper branchGoodsMapper;

	/**
	 * 查询所有商品名称
	 */
	public List<String> getAllGoodsname() {
		return branchGoodsMapper.getAllGoodsname();
	}

}
