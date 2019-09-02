package com.drug.system.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.MenuDO;
import com.drug.system.service.MenuService;
import com.drug.util.ToolClass;

@Controller
public class MenuController {
	@Autowired
	private MenuService menuBiz;
	
	/**
	 * 查询所有菜单
	 */
	@RequestMapping("/queryMenu")
	@ResponseBody
	public Map<String,Object> queryByMenu(){
		List<MenuDO> menuList = menuBiz.queryByMenu();
		menuList.forEach(System.out::println);
		Map<String,Object> map = ToolClass.responseByData();
		map.put("data", menuList);
		return map;
	}
	
	@RequestMapping("/updateMenu")
	@ResponseBody
	public Integer updateByMenu(MenuDO menu){
		Integer row = menuBiz.updateByMenu(menu);
		return row;
	}
}
