package com.longtime.app.base.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.app.base.cookie.CookieReceipt;
import com.longtime.app.base.model.Account;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.LoginService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.TenantService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.util.MD5;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.web.utils.AclHelper;
import com.myctu.platform.utils.NumberUtils;

@Controller()
@RequestMapping("/mgr/")
public class IXinAdminLoginController {
	
	private static Logger logger = LoggerFactory.getLogger(IXinAdminLoginController.class);
	
	@Resource(name = "accountService")
	private AccountService accountService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name="baseLoginService")
	//@Resource(name="vmBaseLoginService")
	private LoginService  loginService;
	
	@Resource(name = "tenantService")
	private TenantService tenantService;
	
	@Resource
	private TenantConfigService tenantConfigService;
	
	@Resource
	private OrganizationService organizationService;
	
	@RequestMapping("index")
	public String index(){
		return "redirect:/mgr/voteactivity/index.xhtml";
		
	}
	
	
	@RequestMapping(value="logout")
	public String iXinAdminLogout(HttpServletRequest request, HttpServletResponse response){
		LoginSessionHelper.removeSession(request, response);
		CookieReceipt cookieReceipt=new CookieReceipt(request, response);
		cookieReceipt.destory();
		return "redirect:/mgr/login.xhtml";
	}
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String iXinAdminLogin(HttpServletRequest req,HttpServletResponse response, ModelMap model){
		
		String loginName = req.getParameter("username");
		
		String password = req.getParameter("password");
		
		String timestampStr = req.getParameter("timestamp");
		
		//model.put("timestamp", System.currentTimeMillis());
		//登录名或密码为空
		if(StringUtils.isBlank(loginName) || StringUtils.isBlank(password)){
			logger.debug("login fail. input info is empty. username=[{}]  pwd=[{}]", loginName,password);
			model.put("error_code", "-3");
			model.put("username", loginName);
			return "/mgr/login";
		}
		long timestamp = NumberUtils.toLong(timestampStr);
		if(timestamp+300000<System.currentTimeMillis()){
			logger.debug("login fail. timestamp is expire. username=[{}] timestamp=[{}]", loginName,timestampStr);
			model.put("error_code", "-5");
			model.put("username", loginName);
			return "/mgr/login";
		}
		//得到这个账户的信息
		Account account = this.accountService.getAccount(loginName);
		
		if(account == null ){
			logger.debug("login fail. account is null or password is fail. username=[{}] pwd=[{}]", loginName,password);
			model.put("error_code", "-1");
			model.put("username", loginName);
			return "/mgr/login";
		}
		String dbPwd = PasswordEncoder.decode(account.getPwd(), account.getDomainid());
		logger.debug("com.longtime.app.base.controller IXinAdminLoginAction password [{}]" ,dbPwd);
		if(!password.equals(MD5.encodeMd5(String.format("%s%d", dbPwd,timestamp)))){
			logger.debug("login fail. account is null or password is fail. username=[{}] pwd=[{}]", loginName,password);
			model.put("error_code", "-1");
			model.put("username", loginName);
			return "/mgr/login";
		}
		if(account.getStatus() == Account.Status.disable.getCode()){
			logger.debug("login fail. account'status is disable. username=[{}] pwd=[{}]", loginName,password);
			model.put("error_code", "-4");
			model.put("username", loginName);
			return "/mgr/login";
    		}
		User user = this.userService.get(account.getUid());
		
		if(user == null || !user.isMgr() ){
			model.put("error_code", "-2");
			model.put("username", loginName);
			return "/mgr/login";
		}
		
		if(user.getOrganization() == null){
			String rootId = String.format("domain_%s",user.getDomain());
			Organization organization = organizationService.getRoot(rootId);
			if (null == organization) {
				logger.info(String.format("init tenant[domianid=%s]'s root node!",
						LoginSessionHelper.getCurrentDomain(req)));
				this.organizationService.initTree(rootId, req);
				organization = organizationService.getRoot(rootId);
			}
			user.setOrganization(organization);
			userService.update(user);
		}
		
		Tenant tenant = this.tenantService.get(account.getDomainid());
		
		putSession(req, account,user,tenant);
        
		//初始化用户资源列表
		AclHelper.initUserAclList(req);
		
		
		CookieReceipt cookieReceipt=new CookieReceipt(req, response);
		cookieReceipt.store();
		
		//获取tenant配置
		TenantConfig  config = tenantConfigService.getByDomain(account.getDomainid());
		
		
		
		if(null==config || null==config.getSettingObj() || config.getSettingObj().isMustBind()){
				//return String.format("redirect:%s", auto_bind_url);
		}
		
		
		String redirect = HttpServletHelper.getCallBackUrlAndClean(req);
		
		redirect = StringUtils.isBlank(redirect)?index_url:redirect;
	
		return String.format("redirect:%s", redirect);
		
	}
	
	public static final String index_url = "/mgr/voteactivity/index.xhtml";
	
//	private static final String auto_bind_url = "/mgr/guide/autobind.xhtml";
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String toAdminLogin(HttpServletRequest req, ModelMap model){
		return "/mgr/login";
	}
	
	private void putSession(HttpServletRequest req,Account account,User user, Tenant tenant){
		LoginSessionHelper.putCurrentUser(req, user);
		
		LoginSessionHelper.putCurrentDomain(req, tenant);
	}
	
	
	/**
	 * 密码修改页
	 */
	@RequestMapping(value="/tomodify")
	public String tomodify(HttpServletRequest request,ModelMap modelMap){
		return "mgr/modifypassword";
	}
	
	/**
	 * 个人中心 验证密码
	 */
	@RequestMapping(value="/verifypassword")
	@ResponseBody
	public boolean verifyPassword(HttpServletRequest request,ModelMap modelMap) {
		String uid = LoginSessionHelper.getCurrentUserId(request);
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String oldpassword = request.getParameter("oldpassword");
		if (StringUtils.isBlank(uid)) {
			return false;
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		params.put("domainid", domain);
		List<Account> list = this.accountService.list(params);
		if (CollectionUtils.isEmpty(list)) {
			return false;
		}
		if (PasswordEncoder.encode(oldpassword, domain).equals(list.get(0).getPwd())) {
			return true;
		}
		return false;
	}
	
	/**
	 * 个人中心   保存密码
	 */
	@RequestMapping(value="/updatepassword")
	@ResponseBody
	public boolean updatePassword(HttpServletRequest request,ModelMap modelMap){
		String uid = LoginSessionHelper.getCurrentUserId(request);
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String password = request.getParameter("password");
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(password)) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("uid", uid);
			params.put("domainid", domain);
			List<Account> list = this.accountService.list(params);
			if (CollectionUtils.isEmpty(list)) {
				return false;
			}
			for (Account account : list) {
				account.setPwd(PasswordEncoder.encode(password, domain));
				this.accountService.update(account);
			}
			
			return true;
		
		}
		return false;
	}

}
