package com.drug.warehouse.mapper;
/**
* @author 喻锦文
* @version 创建时间：2019年9月6日 上午10:58:58
* 类说明
*/

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.drug.entity.WarehouseDO;
@Repository
public interface MaterialsWarehouseMapper {
	/**
	 * 查询出原材料仓库所有数据
	 */
	public List<WarehouseDO> selectMaterialsWarehouse(Map<String, Object> map);

	/**
	 * 查询出原材料仓库总行数
	 */
	public int getMatCount();
	
	/**
	 * 查询出所有原材料仓库
	 */
	public List<WarehouseDO> selectMaterialsWarehouseype();
}
