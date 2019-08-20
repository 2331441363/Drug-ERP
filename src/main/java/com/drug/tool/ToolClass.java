package com.drug.tool;

import java.util.HashMap;
import java.util.Map;

/**
 * 工具类
 * @author lijie
 *
 */
public class ToolClass {
	/**
	 * Controller返回数据格式工具
	 * @return
	 */
	public static Map<String,Object> responseByData() {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("code", 0);
		map.put("msg","");
		map.put("count", 1000);	//总行数，用于分页
		return map;
	}
	
	
}
