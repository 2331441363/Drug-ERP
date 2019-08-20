package com.drug.system.bizImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drug.entity.Menu;
import com.drug.system.biz.MenuBiz;
import com.drug.system.mapper.MenuMapper;
@Service
public class MenuBizImpl implements MenuBiz{
	@Autowired
	private MenuMapper menuMapper;
	/**
	 * 查询所有菜单
	 * @return Menu集
	 */
	public List<Menu> queryByMenu() {
		return menuMapper.queryByMenu();
	}

	/**
	 * 修改菜单
	 * @param menu 修改的菜单对象
	 * @return 受影响行数
	 */
	public Integer updateByMenu(Menu menu) {
		return menuMapper.updateByMenu(menu);
	}



}
