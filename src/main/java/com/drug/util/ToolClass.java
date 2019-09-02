package com.drug.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 前端返回数据工具类
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
		map.put("code", 0);		//返回状态码
		map.put("msg","");		
		map.put("count", 0);	//总行数，用于分页
		return map;
	}
}
