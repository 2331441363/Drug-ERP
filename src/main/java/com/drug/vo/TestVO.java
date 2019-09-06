package com.drug.vo;
/**
* @author 李杰
* @version 创建时间：2019年9月5日 上午9:30:46
* 类说明：VO及使用
*/
public class TestVO {
	/**
	 * VO简单来说就是用于前端展示数据的
	 * 也就是Web中的controller层返回的object，当然返回出去时依然会被转成json数据
	 * 像DTO、V0我认为其实都是特殊的DO，而DTO、VO、DO都是POJO
	 * DTO是用于在后端之间传输数据，我们SSM项目中，就用到了在一对一关系时，将所有需要的属性放在DTO中，组成一个特殊的DO
	 * 而VO中的属性都是前端页面需要展示的数据，就是通过一次DO/DTO的筛选，当然把一个对象中的数据放到另一个对象肯定不是
	 * 一个一个gett/sett 
	 * spring中有BeanUtils.copyProperties
	 * 还有Orika等都是可以很简单传输两个对象之间的数据
	 * 这次项目就不用到VO。直接向前端传入DO或者DTO
	 */
}
