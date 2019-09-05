package com.drug.purchase.serviceImpl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.PurchaseEmployeeDO;
import com.drug.purchase.mapper.PurchaseEmployeeMapper;
import com.drug.purchase.service.PurchaseEmployeeService;

@Service
public class PurchaseEmployeeServiceImpl implements PurchaseEmployeeService{
	@Autowired
	private PurchaseEmployeeMapper purchaseEmployeeMapper;
	/**
	 * 查询采购申请中所有的数据
	 * @return List<PurchaseEmployee> 采购申请对象
	 */
	public List<PurchaseEmployeeDO> showPurchaseEmployee() {
		return purchaseEmployeeMapper.showPurchaseEmployee();
	}
	/**
	 * 查询采购申请中数据总条数
	 * @return int 返回一个int类型接收数据总条数
	 */
	public int countPage() {
		return purchaseEmployeeMapper.countPage();
	}

}
