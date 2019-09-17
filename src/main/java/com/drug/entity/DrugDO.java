package com.drug.entity;

import java.math.BigDecimal;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月10日 上午10:06:58
* 类说明:药品DO
*/
@Data
public class DrugDO {
	/**
	 * 药品编号
	 */
	private int drugId;
	
	/**
	 * 药品名称
	 */
	private String drugName;
	
	/**
	 * 名称汉语拼音
	 */
	private String spell;
	
	/**
	 * 药品外观
	 */
	private String drugImage;
	
	/**
	 * 药品价格
	 */
	private BigDecimal drugPrice;
	
	/**
	 * 说明书id
	 */
	private int drugBookId;
	
	/**
	 * 配方id
	 */
	private int recipeId;
	
	/**
	 * 厂家名称
	 */
	private String facturerName;
	
	/**
	 * 逻辑删除
	 */
	private int isDeleted;
	
	/**
	 * 是否显示
	 */
	private int isShow;
	
}
