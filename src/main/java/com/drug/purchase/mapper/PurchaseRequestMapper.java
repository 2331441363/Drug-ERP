package com.drug.purchase.mapper;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.drug.entity.PurchaseRequestDO;

@Repository
public interface PurchaseRequestMapper {
	/**
	 * 新增采购申请信息
	 * @param p 采购申请对象
	 * @return int 返回一个int类型接收受影响的行数
	 */
	@Insert("insert into purchase_request "
			+ "(emp_id,departmentId,audit,Time_of_application,"
			+ "Purchase_amount,cause) values (#{empId},#{departmentId},"
			+ "#{audit},#{timeOfApplication},#{purchaseAmount},#{cause})")
	public int add(PurchaseRequestDO p);
}
