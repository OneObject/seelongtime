package com.longtime.ajy.mweb.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.longtime.ajy.model.TenantConfig;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.service.CheckBindStatusService;
import com.longtime.ajy.session.LoginSession;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.service.LoginService;
import com.longtime.ajy.student.service.LoginService.Code;
import com.longtime.ajy.student.service.LoginService.LoginException;
import com.longtime.ajy.student.service.LoginService.LoginForm;
import com.longtime.ajy.student.service.RegisterService;
import com.longtime.ajy.student.service.RegisterService.RegisterException;
import com.longtime.ajy.student.service.RegisterService.RegisterForm;
import com.longtime.ajy.student.service.TenantConfigService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.student.web.LoginController;
import com.longtime.ajy.support.HttpServletHelper;

@Controller
@RequestMapping("/m")
public class MwebLoginController extends LoginController {

	private Logger logger = LoggerFactory.getLogger(MwebLoginController.class);

	@Resource(name = "loginService")
	private LoginService loginService;
	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "registerService")
	private RegisterService registerService;

	@Resource(name = "tenantConfigService")
	private TenantConfigService tenantConfigService;
	
	@Resource(name="checkBindStatusService")
	private CheckBindStatusService checkBindStatusService;
	
	private static final String m_login_success = "/m/h5/index.xhtml";
	private static final String m_login_url = "/m/login.xhtml";

	// private MwebHelper mwebHelper = new MwebHelper();

	@RequestMapping(value = {"h5/login", "login"}, method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		LoginForm loginForm = new LoginForm(request);
		LoginSession loginSession;
		String callback = request.getParameter("callback");
		request.setAttribute("callback", callback);
		
		try {
			loginSession = loadLoginSession(request, loginForm);
		} catch (LoginException e) {
			logger.info("login fail",e);
			loginForm.setCode(e.getCode());
			return loginFail(request, loginForm);
		}

		if (null == loginSession) {
			loginForm.setCode(Code.fail);
			return loginFail(request, loginForm);
		}

		User user = this.getUser(loginSession.getUid());
		
		if(user!=null && user.isIneffective()){
            loginForm.setCode(Code.ineffective);
            return loginFail(request, loginForm);
        }
		if(user != null && user.isExpired()){
	        loginForm.setCode(Code.expire);
	        return loginFail(request, loginForm);
	    }
		loginSession.setSid(String.format("m_%s", loginSession.getSid()));
		return doLoginSuccessMweb(request, response, loginSession, user);
	}
	
	private String doLoginSuccessMweb(HttpServletRequest request, HttpServletResponse response, LoginSession loginSession,
			User user) {

		loginSession.setUname(user.getName());
		storeSession(request, response, loginSession);

		String callback = request.getParameter("callback");
		if (StringUtils.isBlank(callback)) {
			callback = HttpServletHelper.getCallBackUrlAndClean(request);
		}
		if(StringUtils.isBlank(callback) || callback.contains("/m/h5/login")){
			String activityId = (String) request.getSession().getAttribute("activityId");
			if(StringUtils.isNotBlank(activityId)){
				callback = "/m/ixin/nsurvey/index.html?id="+activityId;
			}
		}
		logger.debug("login success. username=[{}] uid=[{}] domain=[{}]", user.getUsername(), user.getId(),
				user.getDomain());
		logger.info("callback="+callback);
		return String.format("redirect:%s", StringUtils.isBlank(callback) ? getLoginSuccessUrl() : callback);

	}

	@RequestMapping(value = {"/login","/h5/login"}, method = RequestMethod.GET)
	public String toLogin(HttpServletRequest request,
			HttpServletResponse response) {
		String currentDomain = MwebHelper.getCurrentDomain();
		if (StringUtils.isBlank(currentDomain)) {
			currentDomain = request.getParameter("domain");
			if (StringUtils.isBlank(currentDomain))
				currentDomain = request.getParameter("fdomain");
		}
		TenantConfig tenantConfig = tenantConfigService.findOne(currentDomain);
		String openid = MwebHelper.getCurrentOpenId();
		request.setAttribute("tenantConfig", tenantConfig);
		request.setAttribute("openid", openid);
		//request.setAttribute("timestamp", System.currentTimeMillis());
		return MwebHelper.getLoginView(currentDomain);
	}
	

	@RequestMapping("logout")
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		return super.logout(request, response);
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String shwoRegister(HttpServletRequest request,
			HttpServletResponse response) {

		String currentDomain = MwebHelper.getCurrentDomain();
		if (StringUtils.isBlank(currentDomain)) {
			currentDomain = request.getParameter("domain");
			if (StringUtils.isBlank(currentDomain))
				currentDomain = request.getParameter("fdomain");
		}
		String callback = request.getParameter("callback");
		String openid = request.getParameter("openid");
		request.setAttribute("callback", callback);
		request.setAttribute("openid", openid);
		request.setAttribute("domain", currentDomain);
		return "/m/pregister";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(HttpServletRequest request,
			HttpServletResponse response) {
		 String callback = request.getParameter("callback");
		RegisterForm registerForm = new RegisterForm(request);
		User user = null;
		try {
			
			user = registerService.doRegister(registerForm);
			if (null == user || StringUtils.isBlank(user.getId())) {
				registerForm.setCode(RegisterService.Code.fail);
			} else {
				registerForm.setCode(RegisterService.Code.success); 
			}
		} catch (RegisterException e) {
			registerForm.setCode(e.getCode());
		}

		if (registerForm.getCode() == RegisterService.Code.success) {// 注册成功
			try {
				LoginSession loginSession = loginService.doLogin(
						registerForm.getUsername(), registerForm.getDomain());
				user = this.getUser(loginSession.getUid());
				return doLoginSuccess(request, response, loginSession, user);
			} catch (LoginException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("registerForm", registerForm);
		request.setAttribute("domain", registerForm.getDomain());
		request.setAttribute("openid", registerForm.getOpenid());
		request.setAttribute("callback", callback);
		return "/m/pregister";
	}

	@RequestMapping("/wx_bind")
	public String bindWeiXin(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap) {
		String currentDomain = MwebHelper.getCurrentDomain();
		if (StringUtils.isBlank(currentDomain)) {
			currentDomain = request.getParameter("domain");
			if (StringUtils.isBlank(currentDomain))
				currentDomain = request.getParameter("fdomain");
		}
		String openId = MwebHelper.getCurrentOpenId();
		if (StringUtils.isBlank(openId)) {
			openId = request.getParameter("openid");
		}
		SessionHelper.removeSession(request, response);
		if (StringUtils.isBlank(openId) || StringUtils.isBlank(currentDomain)) {
			return "redirect:/m/h5/login.xhtml";
		}

		modelMap.put("openid", openId);
		modelMap.put("domain", currentDomain);

		TenantConfig tenantConfig = tenantConfigService.findOne(currentDomain);
		modelMap.put("tenantConfig", tenantConfig);
		//modelMap.put("timestamp", System.currentTimeMillis());
		return MwebHelper.getLoginBindView(currentDomain);
	}

	@Override
	protected void storeSession(HttpServletRequest request,
			HttpServletResponse response, LoginSession loginSession) {
		super.storeSession(request, response, loginSession);
		// mwebHelper.storeSession(request, response, loginSession);

	}

	@Override
	protected void removeSession(HttpServletRequest request,
			HttpServletResponse response) {
		super.removeSession(request, response);
		// mwebHelper.destorySession(request, response, loginSession);
	}

	@Override
	protected String loginFail(HttpServletRequest request, LoginForm loginForm) {
		String domain = MwebHelper.getCurrentDomain();
		if (StringUtils.isBlank(domain)) {
			domain = request.getParameter("domain");
			if (StringUtils.isBlank(domain))
				domain = request.getParameter("fdomain");
		}
		TenantConfig tenantConfig = tenantConfigService.findOne(domain); 
		String openid = MwebHelper.getCurrentOpenId();
		request.setAttribute("tenantConfig", tenantConfig);
		request.setAttribute("openid", openid); 
		//request.setAttribute("timestamp", System.currentTimeMillis());
		request.setAttribute("loginForm", loginForm);
		request.setAttribute("domain",domain );
		
		if ("bind".equals(request.getParameter("action"))) {
			request.setAttribute("openid", request.getParameter("openid"));
			return MwebHelper.getLoginBindView(domain);
		}
		return MwebHelper.getLoginView(domain);
	}


	@Override
	protected String getLoginSuccessUrl() {
		return m_login_success;
	}

	@Override
    protected String getLoginUrl() {
        return m_login_url;
    }
	
	@RequestMapping("/h5/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		String domain = MwebHelper.getCurrentDomain();
		SessionHelper.removeSession(request, response);
		String url = String.format("redirect:/m/h5/index.xhtml?fdomain=%s", domain);
		return url;
	}
}
