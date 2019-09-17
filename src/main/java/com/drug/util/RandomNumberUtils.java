package com.drug.util;

/**
* @author 李杰
* @version 创建时间：2019年9月10日 上午8:26:16
* 类说明：随机生成可选主键：可用做订单号，详情号等主键
* 推荐对生成数字再进行主键判断是否存在，不存在再进行调用
* 注意：
* 		java和mysql的int类型相同：最大数：2147483647(10位)
* 		java的long和mysql的bigint类型相同：最大数：9223372036854775807（19位）
* 		
*/
public class RandomNumberUtils {
	
	/**
	 * 生成十位随机数
	 * @return
	 */
	public static String getTenIntNumber() {
		int number =10000000+(int)(Math.random()*99999999);	//生成随机数
		return 1+""+number;
	}
	
}
