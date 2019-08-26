package com.drug.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class Menu implements Serializable{
	/**
	 * 菜单ID
	 */
	private Integer menuId;
	
	/**
	 * 菜单名称
	 */
	private String menuName;
	
	/**
	 * 父级菜单ID
	 */
	private Integer menuParent;
	
	/**
	 * 菜单Icon
	 */
	private String menuIcon;
	
	/**
	 * 菜单类型
	 */
	private Integer menuType;
	
	/**
	 * 菜单URL
	 */
	private String menuURL;
}
