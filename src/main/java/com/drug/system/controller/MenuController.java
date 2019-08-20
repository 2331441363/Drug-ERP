package com.drug.system.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drug.entity.Menu;
import com.drug.system.biz.MenuBiz;
import com.drug.tool.ToolClass;

@Controller
public class MenuController {
	@Autowired
	private MenuBiz menuBiz;
	
	/**
	 * 查询所有菜单
	 */
	@RequestMapping("/queryMenu")
	@ResponseBody
	public Map<String,Object> queryByMenu(){
		List<Menu> menuList = menuBiz.queryByMenu();
		Map<String,Object> map = ToolClass.responseByData();
		map.put("data", menuList);
		return map;
	}
	
	@RequestMapping("/updateMenu")
	@ResponseBody
	public Integer updateByMenu(Menu menu){
		Integer row = menuBiz.updateByMenu(menu);
		return row;
	}
}
