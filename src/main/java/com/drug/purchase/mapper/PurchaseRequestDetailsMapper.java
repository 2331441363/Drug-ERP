package com.drug.purchase.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.drug.entity.PurchaseRequestDetailsDO;

@Repository
public interface PurchaseRequestDetailsMapper {
	/**
	 * 根据采购申请id查询采购申请详情
	 * @param id 采购申请id
	 * @return List<PurchaseRequestDetailsDO> 返回采购申请详情信息集合
	 */
	@Select("select * from purchase_request_details "
			+ " where purchase_Request_Id=#{id} LIMIT  #{page} , #{limit}")
	public List<PurchaseRequestDetailsDO> selectById(Map<String,Object> map);
	/**
	 * 根据采购申请id查询采购申请详情数据条数
	 * @param id 采购申请id
	 * @return int 采购申请详情条数
	 */
	@Select("select count(*) from purchase_request_details "
			+ "where purchase_Request_Id=#{id}")
	public int countPage(int id);
	/**
	 * 添加采购申请详情数据
	 * @param p 采购申请详情信息
	 * @return int 接收受影响的行数
	 */
	@Insert("insert into purchase_request_details (purchase_request_id,"
			+ "material_id,number,subtotal) values(#{purchaseRequestId},"
			+ "#{materialId},#{number},#{subtotal})")
	public int add(PurchaseRequestDetailsDO p) ;
}
