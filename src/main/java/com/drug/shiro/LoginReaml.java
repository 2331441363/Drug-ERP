package com.drug.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drug.entity.EmployeeDO;
import com.drug.system.service.EmployeeService;

/**
* @author 李杰
* @version 创建时间：2019年9月3日 上午8:56:20
* 类说明
*/
@Component
public class LoginReaml extends AuthorizingRealm{
	@Autowired
	private EmployeeService employeeService;
	
	/**
	 * 授权认证和登录验证过滤器相结合
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//获取登录对象
		EmployeeDO employee = (EmployeeDO)principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		//判断对象不为空
		if(employee != null) {
			//根据员工部门id获取权限
			info.addRole(employee.getDepartmentId()+"");
		}
		
		/*方法二： 从subject管理器里获取user
		Subject subject = SecurityUtils.getSubject();
		User _user = (User) subject.getPrincipal();
		System.out.println("subject"+_user.getUsername());*/

		return info;
	}

	/**
	 * 登录验证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//验证账号密码
		UsernamePasswordToken tokens = (UsernamePasswordToken)token;
		//调用service获取用户对象
		EmployeeDO emp = employeeService.getEmployeByUserId(tokens.getUsername());
		//判断员工对象是否为空（不存在账号）
		if(emp == null) {
			return null;
		}
        //三个参数进行初步的简单认证信息对象的包装 最后的验证对比交给安全管理器
		AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(emp,emp.getEmpPassword(),this.getClass().getSimpleName());
		return authenticationInfo;
	}

}
