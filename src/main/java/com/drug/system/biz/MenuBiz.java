package com.drug.system.biz;

import java.util.List;
import java.util.Map;

import com.drug.entity.Menu;

public interface MenuBiz {
	/**
	 * 查询所有菜单
	 * @return Menu集
	 */
	List<Menu> queryByMenu();
	
	/**
	 * 修改菜单
	 * @param menu 修改的菜单对象
	 * @return 受影响行数
	 */
	Integer updateByMenu(Menu menu);
}
