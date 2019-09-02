package com.drug.system.service;

import java.util.List;
import java.util.Map;

import com.drug.entity.MenuDO;

public interface MenuService {
	/**
	 * 查询所有菜单
	 * @return Menu集
	 */
	List<MenuDO> queryByMenu();
	
	/**
	 * 修改菜单
	 * @param menu 修改的菜单对象
	 * @return 受影响行数
	 */
	Integer updateByMenu(MenuDO menu);
}
