package com.drug.finance.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.subbranch.webservices.HelloService;
import com.subbranch.webservices.HelloServiceImplService;

/**
* @author 肖影
* @version 创建时间：2019年9月26日 上午11:16:42
* 类说明 分店退货单controlller
*/
@Controller
public class BranchBackController {

	/**
	 * 修改分店收款状态
	 * @param returnId 分店退货单id
	 * @return 修改是否成功信息
	 */
	@RequestMapping("/updBranchReceStatus")
	@ResponseBody
	public String updBranchReceStatus(int returnId) {
		//获取当前时间
		Date date =new Date();
		Timestamp newDate=new Timestamp(date.getTime());
		HelloServiceImplService impl = new HelloServiceImplService();
		HelloService service = impl.getHelloServiceImplPort();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("returnId", returnId);
		map.put("date", newDate);
		int row =service.updBrachReceStatus(map);
		if (row>0) {
			System.out.println("修改分店收款状态成功");
			return "ok";
		} else {
			System.out.println("修改分店收款状态失败");
			return "no";
		}
	}
}
