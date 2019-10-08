package com.drug.entity;

import java.util.List;

import org.springframework.stereotype.Service;

/**
 * @author 喻锦文
 * @version 创建时间:2019-9-2 类说明:仓库信息管理
 */
@Service
public class WarehouseDO {
	/**
	 * 仓库信息管理ID
	 */
	private int warehouseId;

	/**
	 * 仓库编号
	 */
	private String warehouseSerial;

	/**
	 * 仓库名称
	 */
	private String warehouseName;

	/**
	 * 仓库类型
	 */
	private String warehouseType;

	/**
	 * 仓库生成时间
	 */
	private String warehouseTime;

	/**
	 * 员工表id
	 */
	private int empId;

	/**
	 * 成品仓库集合
	 */
	private List<FinishedGoodsSheetDO> finishedGoodsSheetDOList;

	/**
	 * 原材料仓库集合
	 */
	public List<MaterialsWarehouseDO> materialsWarehouseDOList;
	
	/**
	 * 废弃仓库集合
	 */
	public List<AbandonedWarehouseDO> abandonedWarehouseDOLits;
	
	

	public List<AbandonedWarehouseDO> getAbandonedWarehouseDOLits() {
		return abandonedWarehouseDOLits;
	}

	public void setAbandonedWarehouseDOLits(List<AbandonedWarehouseDO> abandonedWarehouseDOLits) {
		this.abandonedWarehouseDOLits = abandonedWarehouseDOLits;
	}

	public List<MaterialsWarehouseDO> getMaterialsWarehouseDOList() {
		return materialsWarehouseDOList;
	}

	public void setMaterialsWarehouseDOList(List<MaterialsWarehouseDO> materialsWarehouseDOList) {
		this.materialsWarehouseDOList = materialsWarehouseDOList;
	}

	public List<FinishedGoodsSheetDO> getFinishedGoodsSheetDOList() {
		return finishedGoodsSheetDOList;
	}

	public void setFinishedGoodsSheetDOList(List<FinishedGoodsSheetDO> finishedGoodsSheetDOList) {
		this.finishedGoodsSheetDOList = finishedGoodsSheetDOList;
	}

	public int getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(int warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getWarehouseSerial() {
		return warehouseSerial;
	}

	public void setWarehouseSerial(String warehouseSerial) {
		this.warehouseSerial = warehouseSerial;
	}

	public String getWarehouseName() {
		return warehouseName;
	}

	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}

	public String getWarehouseType() {
		return warehouseType;
	}

	public void setWarehouseType(String warehouseType) {
		this.warehouseType = warehouseType;
	}

	public String getWarehouseTime() {
		return warehouseTime;
	}

	public void setWarehouseTime(String warehouseTime) {
		this.warehouseTime = warehouseTime;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

}
