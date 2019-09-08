package com.drug.purchase.service;

import java.util.List;
import java.util.Map;

import com.drug.entity.PurchaseRequestDetailsDO;

public interface PurchaseRequestDetailsService {
	/**
	 * 根据采购申请id查询采购申请详情
	 * @param id 采购申请id
	 * @return List<PurchaseRequestDetailsDO> 返回采购申请详情信息集合
	 */
	public List<PurchaseRequestDetailsDO> selectById(Map<String,Object> map);
	/**
	 * 根据采购申请id查询采购申请详情数据条数
	 * @param id 采购申请id
	 * @return int 采购申请详情条数
	 */
	public int countPage(int id);
	/**
	 * 添加采购申请详情数据
	 * @param p 采购申请详情信息
	 * @return int 接收受影响的行数
	 */
	public int add(PurchaseRequestDetailsDO p) ;
}
