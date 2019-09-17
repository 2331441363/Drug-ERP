package com.drug.entity;

import lombok.Data;

/**
* @author 李杰
* @version 创建时间：2019年9月9日 上午8:22:09
* 类说明：layui分页DO
*/
@Data
public class LayuiTablePageDO {
	/**
	 * 当前查询页数
	 */
	private int page;
	
	/**
	 * 每页显示数
	 */
	private int limit;
	
	/**
	 *     得到分页开始行数
	 * @return (当前页数-1) * 每页显示数
	 */
	public int getBeginRow() {
		return (page - 1) * limit; 	//当前页数-1 * 每页显示数
	}
	
	/**
	 *      得到分页结束行数
	 * @return 当前页数 * 每页显示数
	 */
	public int getEndRow() {
		return page * limit; 	//当前页数 * 每页显示数
	}
}
