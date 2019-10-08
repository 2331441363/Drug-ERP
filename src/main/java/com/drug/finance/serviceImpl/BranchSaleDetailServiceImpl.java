package com.drug.finance.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.finance.mapper.BranchSaleDetailMapper;
import com.drug.finance.service.BranchSaleDetailService;

/**
 * @author 肖影
 * @version 创建时间：2019年9月17日 下午8:36:45 
 * 类说明 分店销售详情Service实现类
 */
@Service
public class BranchSaleDetailServiceImpl implements BranchSaleDetailService {
	@Autowired
	private BranchSaleDetailMapper branchSaleDetailMapper;

	/**
	 * 根据分店销售的商品名查询销售数量
	 */
	public List<Integer> getQuantityByGname(String pname) {
		return branchSaleDetailMapper.getQuantityByGname(pname);
	}
}
