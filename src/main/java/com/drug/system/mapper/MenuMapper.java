package com.drug.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.drug.entity.MenuDO;

@Repository
public interface MenuMapper {
	/**
	 * 查询所有菜单
	 * @return Menu集
	 */
	@Select("SELECT * FROM menu")
	List<MenuDO> queryByMenu();
	
	/**
	 * 修改菜单
	 * @param menu 修改的菜单对象
	 * @return 受影响行数
	 */
	@Update("UPDATE menu SET menuName = #{menuName},menuType=#{menuType},menuIcon = #{menuIcon},menuURL= #{menuURL},menuParent=#{menuParent} WHERE menuId = #{menuId}")
	Integer updateByMenu(MenuDO menu);
	
}
