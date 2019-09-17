package com.lijie.test;

import org.junit.Test;

/**
* @author 李杰
* @version 创建时间：2019年9月12日 下午3:27:09
* 类说明
*/
public class TestMain {
	@Test
	public void rest() {
		String str= "2019-09-20 - 2019-10-24";
		System.out.println(str.substring(0, 10));
		System.out.println(str.substring(13, 23));
	}
}
