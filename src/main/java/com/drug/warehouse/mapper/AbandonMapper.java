package com.drug.warehouse.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.drug.entity.WarehouseDO;

/**
* @author 喻锦文
* @version 创建时间：2019年9月7日 上午9:47:45
* 类说明
*/
@Repository
public interface AbandonMapper {
	/**
	 * 查询出原材料仓库所有数据
	 */
	public List<WarehouseDO> selectAbandonedWarehouseUBW(Map<String, Object> map);

	/**
	 * 查询出原材料仓库总行数
	 */
	public int getAbaCount();
	
	/**
	 * 查询出所有原材料仓库
	 */
	public List<WarehouseDO> selectAbandonedWarehouse();
}

