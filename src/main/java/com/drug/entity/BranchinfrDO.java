package com.drug.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
* @author 肖影
* @version 创建时间：2019年9月15日 上午8:13:42
* 类说明：分店信息DO
*/
@Data
public class BranchinfrDO {
	/**
	 * 分店编号
	 */
	private int branchId;
	/**
	 * 分店名称
	 */
	private String branchName;
	/**
	 * 店长名
	 */
	private String branchOwner;
	/**
	 * 分店地址
	 */
	private String branchAddress;
	/**
	 * 联系方式
	 */
	private String branchTel;
	/**
	 * 运营状态
	 */
	private int runStatus;
	/**
	 * 签订时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date signTime;
	/**
	 * 合同状态
	 */
	private String bargainStatus;
	/**
	 * 是否显示
	 */
	private int isShow;
	
}
