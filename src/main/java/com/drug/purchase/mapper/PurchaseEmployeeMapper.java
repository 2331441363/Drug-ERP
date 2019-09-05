package com.drug.purchase.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.drug.entity.PurchaseEmployeeDO;

@Repository
public interface PurchaseEmployeeMapper {
	/**
	 * 查询采购申请中所有的数据
	 * @return List<PurchaseEmployee> 采购申请对象
	 */
	@Select("select * from purchase_employee")
	public List<PurchaseEmployeeDO> showPurchaseEmployee();
	
	/**
	 * 查询采购申请中数据总条数
	 * @return int 返回一个int类型接收数据总条数
	 */
	@Select("select count(*) from purchase_employee")
	public int countPage();
}
