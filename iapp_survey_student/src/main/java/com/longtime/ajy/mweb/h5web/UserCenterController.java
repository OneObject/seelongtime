package com.longtime.ajy.mweb.h5web;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.ajy.model.Account;
import com.longtime.ajy.model.CommentStudentVo;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.web.MBaseController;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.ajy.support.QiniuHelper;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;



@Controller
@RequestMapping(value="/m/h5/usercenter")
public class UserCenterController extends MBaseController{
	
	@Resource(name="userService")
	private UserService userService;
	
	
	@Resource(name="accountService")
	private AccountService accountService;
	
	/**
	 * 个人中心  首页
	 */
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,ModelMap modelMap){
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(domain)) {
			User user = userService.getUserById(uid, domain);
			modelMap.put("user", user);
			if (null!=user) {
			    String oName=StringUtils.EMPTY;
			    if(!String.format("domain_%s",domain).equals(user.getOid())){
			       oName = userService.getOrganizationNamaByOid(user.getOid());
			    }
			    modelMap.put("oname", oName);
			}
		}

		return "/m/h5/usercenter/index";
	}

	/**
	 * 个人中心  详情
	 */
	@RequestMapping(value="/detail")
	public String Detail(HttpServletRequest request,ModelMap modelMap){
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(domain)) {
			User user = userService.getUserById(uid, domain);
			modelMap.put("user", user);
			if (null!=user) {
			    String oName=StringUtils.EMPTY;
                if(!String.format("domain_%s",domain).equals(user.getOid())){
                   oName = userService.getOrganizationNamaByOid(user.getOid());
                }
                modelMap.put("oname", oName);
			}
		}
		return "/m/h5/usercenter/detail";
	}

	/**
	 * 个人中心  编辑
	 */
	@RequestMapping(value="/edit")
	public String editUser(HttpServletRequest request,ModelMap modelMap)
	{
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(domain)) {
			User user = userService.getUserById(uid, domain);
			modelMap.put("user", user);
			if (null!=user) {
			    String oName=StringUtils.EMPTY;
                if(!String.format("domain_%s",domain).equals(user.getOid())){
                   oName = userService.getOrganizationNamaByOid(user.getOid());
                }
                modelMap.put("oname", oName);
                
			}
		}
		
		return "/m/h5/usercenter/edit";
	}
	
	 @RequestMapping("/comment")
	    public String commentlist(HttpServletRequest request,HttpServletResponse reponse,ModelMap  modelMap){
	    	
	    	return    "m/h5/usercenter/comment";
	  }
	 
	 @RequestMapping("commentlist")
		public String commentlist(HttpServletRequest request,ModelMap model){
			
	        String domain=MwebHelper.getCurrentDomain();
		
	        String uid = MwebHelper.getCurrentUid();
	        
			String restype=request.getParameter("restype");
			
			Pageable page = HttpServletHelper.assembyPage(request);
			
			
			
			ResultSet<CommentStudentVo> rs = new ResultSet<CommentStudentVo>(new ArrayList<CommentStudentVo>(), page, 0);

			model.put("rs",rs);
			model.put("restype", restype);
			return "m/h5/usercenter/commentlist";
		}

	/**
	 * 个人中心 保存编辑
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public boolean save(HttpServletRequest request,ModelMap modelMap)
	{
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String phone =request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String mobile=request.getParameter("mobile");
		//String nitinfo = request.getParameter("unitinfo");
		
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(domain)) {
			User user = userService.getUserById(uid, domain);
			//非临时用户才会创建更改邮箱手机号账号
			if(user.getUsertype()!=User.USER_TYPE_UNCOMMON)
			{
			
				//change account
				String account_mobile = user.getMobile();
				String account_email = user.getEmail();
				String username = user.getUsername();
				Account phone_mobile = accountService.getAccount(account_mobile, domain);
				Account email_account = accountService.getAccount(account_email, domain);
				Account username_accountAccount = accountService.getAccount(username, domain);
				if (null==username_accountAccount) {
					return false;
				}
				String pwd = username_accountAccount.getPwd();
				if (null!=phone_mobile&&StringUtils.isNotBlank(mobile)) {
					phone_mobile.setAccount(mobile);
					phone_mobile.setUpdatetime(System.currentTimeMillis());
					phone_mobile.setUpdater(uid);
					accountService.update(phone_mobile);
				}
				if (null!=email_account&&StringUtils.isNotBlank(email)) {
					email_account.setAccount(email);
					email_account.setUpdater(uid);
					email_account.setUpdatetime(System.currentTimeMillis());
					accountService.update(email_account);
				}
				if (null==phone_mobile&&StringUtils.isNotBlank(mobile)) {
					phone_mobile = new Account();
					phone_mobile.setDomainid(domain);
					phone_mobile.setPwd(pwd);
					phone_mobile.setAccount(mobile);
					phone_mobile.setCreatetime(System.currentTimeMillis());
					phone_mobile.setUid(uid);
					phone_mobile.setType(Short.valueOf("1"));
					accountService.insert(phone_mobile);
				}
				if (null==email_account&&StringUtils.isNotBlank(email)) {
					email_account = new Account();
					email_account.setDomainid(domain);
					email_account.setPwd(pwd);
					email_account.setAccount(phone);
					email_account.setCreatetime(System.currentTimeMillis());
					email_account.setUid(uid);
					email_account.setType(Short.valueOf("0"));
					accountService.insert(email_account);
				}
				//change base_user
				if (null!=user) {
					user.setName(name);
					user.setNickname(nickname);
					user.setPhone(phone);
					user.setEmail(email);
					user.setGender(Integer.parseInt(gender));
					user.setMobile(mobile);
					//user.setUnitinfo(nitinfo);
					int result = userService.update(user);
					if (result!=0) {
						return true;
					}
					return false;
				}
			}else {//临时用户仅仅保存信息
				
				
				user.setName(name);
				user.setNickname(nickname);
				user.setPhone(phone);
				user.setTemporary_email(email);
				user.setGender(Integer.parseInt(gender));
				user.setTemporary_mobile(mobile);//手机作为临时手机号
				//user.setUnitinfo(nitinfo);
				int result = userService.update(user);
				if (result!=0) {
					return true;
				}
				return false;
			}
			
			
			
		}
		return false;
	}
	/**
	 * 个人中心 修改密码
	 */
	@RequestMapping("/editpassword")
	public String editPassword(HttpServletRequest request,ModelMap modelMap)
	{
		String uid = getCurrentUid(request);
		modelMap.put("uid", uid);
		
		return "/m/h5/usercenter/editpassword";
	}
	
	/**
	 * 个人中心 验证密码
	 */
	@RequestMapping(value="/verifypassword")
	@ResponseBody
	public boolean verifyPassword(HttpServletRequest request,ModelMap modelMap)
	{
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		String oldpassword = request.getParameter("oldpassword");
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(oldpassword)) {
			String password = userService.getPasswordByUid(uid, domain);
			if (PasswordEncoder.encode(oldpassword, domain).equals(password)) {
				return true;
			}
			return false;
		}
		return false;
	}
	/**
	 * 个人中心   保存密码
	 */
	@RequestMapping(value="/updatepassword")
	@ResponseBody
	public boolean updatePassword(HttpServletRequest request,ModelMap modelMap){
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		String password = request.getParameter("password");
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(password)) {
			int result = userService.updatePassword(uid, domain, PasswordEncoder.encode(password, domain));
			if (result>0) {
				return true;
			}
		}
		return false;
	}
	/**
	 * 个人中心  验证手机
	 */
	@RequestMapping(value="/verifymobile")
	@ResponseBody
	public boolean verifyMobile(HttpServletRequest request,ModelMap modelMap)
	{
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		String mobile = request.getParameter("mobile");
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(mobile)) {
			Account account = accountService.getAccount(mobile, domain);
			if (null==account) {
				return true;
			}
			else {
				if (account.getUid().equals(uid)) {
					return true;
				}
				return false;
			}
		}
		return false;
	}
	/**
	 *个人中心   验证email
	 */
	@RequestMapping(value="/verifyemail")
	@ResponseBody
	public boolean verifyEmail(HttpServletRequest request,ModelMap modelMap)
	{
		String uid = getCurrentUid(request);
		String domain = getCurrentDomain(request);
		String email = request.getParameter("email");
		if (StringUtils.isNotEmpty(uid)&&StringUtils.isNotEmpty(email)) {
			Account account = accountService.getAccount(email, domain);
			if (null==account) {
				return true;
			}
			else {
				if (account.getUid().equals(uid)) {
					return true;
				}
				return false;
			}
		}
		return false;
	}
	
	//更改头像
		@RequestMapping(value="/uploadavatar")
		public String updateAvatar(HttpServletRequest request,ModelMap modelMap)
		{
			String token = QiniuHelper.getUpToken();
			String uid = getCurrentUid(request);
			User u =  userService.getUserById(uid, MwebHelper.getCurrentDomain());
			String avatar = "";
			if(null!=u)
			{
				avatar = u.getAvatar();
			}
			modelMap.put("uptoken", token);
			modelMap.put("uid", uid);
			modelMap.put("ava", avatar);
			
			return "/m/h5/usercenter/uploadavatar";
		}
		//更改头像 操作
		@RequestMapping(value="/updateavatar")
		@ResponseBody
		public boolean doUpdateAvatar(HttpServletRequest request,ModelMap modelMap)
		{
			String avatar = request.getParameter("avatar");
			String uid = getCurrentUid(request);
			String domain = getCurrentDomain(request);
			User u =  userService.getUserById(uid, domain);
			u.setAvatar(avatar);
			int result = userService.update(u);
			if (result!=0) {
				return true;
			}
			return false;
		}
		
	
	
	/**
	 *  我的活动列表
	 */
	@RequestMapping("/activity")
	public String myActivityPage(HttpServletRequest request,ModelMap modelMap)
	{
		String uid = getCurrentUid(request);
		modelMap.put("uid", uid);		
		return "/m/h5/activity/myactivity";
	}
	
	
}
