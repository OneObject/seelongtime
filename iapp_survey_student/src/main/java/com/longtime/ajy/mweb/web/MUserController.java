package com.longtime.ajy.mweb.web;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.longtime.ajy.model.Account;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.PasswordEncoder;

@Controller("mUserController")
@RequestMapping(value = { "/m/ixin/user/" })
public class MUserController extends MBaseController {

	@Resource
	private UserService userService;

	@Resource(name = "accountService")
	private AccountService accountService;

	/**
	 * 我的积分
	 */
	@RequestMapping("creditscore")
	public String list(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		String uid = MwebHelper.getCurrentUid();
		User user = this.userService.findOne(uid);

		modelMap.put("uid", uid);
		modelMap.put("user", user);
		return "/m/user/creditscore";
	}

	/**
	 * 编辑页面
	 */
	@RequestMapping("edit")
	public String edit(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		String uid = MwebHelper.getCurrentUid(); 
		User user = this.userService.findOne(uid);
		modelMap.put("user", user);
		return "/m/user/edit";
	}

	/**
	 * 更新用户信息
	 */
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String updateUser(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		String code = "fail";
		String uid = StringUtils.trimToNull(request.getParameter("uid"));
		String username = StringUtils.trimToNull(request
				.getParameter("username"));
		String name = StringUtils.trimToNull(request.getParameter("name"));
		String mobile = StringUtils.trimToNull(request.getParameter("mobile"));
		User user = this.userService.findOne(uid);
		String usernamebefor = user.getUsername();//未修改前的用户名
		String mobliebefor = user.getMobile();//未修改前的手机号
		if (StringUtils.isBlank(name) || StringUtils.isBlank(mobile)
				|| StringUtils.isBlank(username)) {// 参数为空
			code = "empty";
		} else {
			int n = 0;
			user.setName(name);
			if (valid(username, mobile, user)) {// 验证手机号与用户名可以修改
				user.setUsername(username);
				user.setMobile(mobile);
				n = userService.update(user);// 更新user
				if (n == 1) {// 更新user成功
					
					Account account = accountService.getAccount(usernamebefor, user.getDomain());
					if (account.getType() == Account.Type.username
							.getCode()
							&& !account.getAccount().equalsIgnoreCase(//用户名类型，且用户名改变,修改
									user.getUsername())) {
						account.setAccount(user.getUsername());
						account.setUpdater(user.getId());
						account.setUpdatetime(System.currentTimeMillis());
						this.accountService.update(account);
					}
					
					
					account = accountService.getAccount(mobliebefor, user.getDomain());
					if(account  == null){//手机号不存在,添加
						account = new Account();
						account.setAccount(user.getMobile().toLowerCase());
						account.setType(Account.Type.phone.code);
						account.setUid(user.getId());
						account.setDomainid(user.getDomain());
						account.setPwd(PasswordEncoder.encode("888888",	user.getDomain()));
						account.setCreatetime(System.currentTimeMillis());
						accountService.insert(account);
					}
					else if (account.getType() == Account.Type.phone.getCode()
							&& !account.getAccount().equalsIgnoreCase(//手机号类型，且手机号改变,修改
									user.getMobile())) {
						account.setAccount(user.getMobile());
						account.setUpdater(user.getId());
						account.setUpdatetime(System.currentTimeMillis());
						this.accountService.update(account);
					}
					code = "success";
				}
			} else {
				code = "exist";
			}
		}
		modelMap.put("code", code);
		modelMap.put("user", user);
		return "/m/user/edit";
	}

	/**
	 * 检查用户名和手机是否可以修改
	 * 
	 * @param username
	 * @param mobile
	 * @return true 可以修改，false不可用修改
	 */
	private boolean valid(String username, String mobile, User user) {
		if (!username.equals(user.getUsername())) {// 用户名改变
			return !userService.checkUsernameIsExistByUsername(username,
					user.getDomain());
		}
		if (!mobile.equals(user.getMobile())) {// 手机改变
			return !userService.checkUsernameIsExistByMobile(mobile,
					user.getDomain());
		}
		return true;
	}
}
