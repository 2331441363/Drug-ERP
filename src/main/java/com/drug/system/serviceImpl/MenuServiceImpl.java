package com.drug.system.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.MenuDO;
import com.drug.system.mapper.MenuMapper;
import com.drug.system.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuMapper menuMapper;
	/**
	 * 查询所有菜单
	 * @return Menu集
	 */
	public List<MenuDO> queryByMenu() {
		return menuMapper.queryByMenu();
	}

	/**
	 * 修改菜单
	 * @param menu 修改的菜单对象
	 * @return 受影响行数
	 */
	public Integer updateByMenu(MenuDO menu) {
		return menuMapper.updateByMenu(menu);
	}



}
