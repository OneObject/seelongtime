package com.longtime.ajy.student.web;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.longtime.ajy.model.Tenant;
import com.longtime.ajy.model.User;
import com.longtime.ajy.session.LoginSession;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.service.LoginService;
import com.longtime.ajy.student.service.LoginService.Code;
import com.longtime.ajy.student.service.LoginService.LoginException;
import com.longtime.ajy.student.service.LoginService.LoginForm;
import com.longtime.ajy.student.service.TenantService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.ajy.support.SubDomainHelper;

@Controller
@RequestMapping("/")
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "tenantService")
	private TenantService tenantService;

	private static final String login_view = "/login";
	private static final String login_success = "/survey/index.xhtml";
	private static final String login_url = "/login.xhtml";
	private static final String default_login_view = "/login/default";

	private static final String RELATIVE_PATH = "WEB-INF/views/login/";

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String toLogin(HttpServletRequest request, HttpServletResponse response) {
		String loginView = getLoginView(request);
		// request.setAttribute("timestamp", System.currentTimeMillis());
		return loginView;

	}

	private String getLoginView(HttpServletRequest request) {
		String domain = SubDomainHelper.getSubDomain();
		String loginView = login_view;
		if (StringUtils.isNotBlank(domain)) {
			domain = domain.toLowerCase();
			boolean isExist = hasDomainLogin(domain, request);
			if (isExist) {
				loginView = String.format("/login/%s/login", domain);
			} else {
				loginView = default_login_view;
			}
			Tenant tenant = tenantService.findOne(domain);
			request.setAttribute("tenant", tenant);
		} 
		return loginView;
	}

	private boolean hasDomainLogin(String domain, HttpServletRequest request) {
		String path = String.format("%s/%s%s/%s", request.getSession().getServletContext().getRealPath("/"),
				RELATIVE_PATH, domain, "login.jsp");
		File file = new File(path);
		return file.exists();
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		LoginForm loginForm = new LoginForm(request);
		LoginSession loginSession;
		try {
			loginSession = loadLoginSession(request, loginForm);
		} catch (LoginException e) {
			loginForm.setCode(e.getCode());
			return loginFail(request, loginForm);
		}

		if (null == loginSession) {
			loginForm.setCode(Code.fail);
			return loginFail(request, loginForm);
		}
		User user = this.getUser(loginSession.getUid());
		if (user == null) {
			loginForm.setCode(Code.fail);
			return loginFail(request, loginForm);
		}
		if (user.isIneffective()) {
			loginForm.setCode(Code.ineffective);
			return loginFail(request, loginForm);
		}
		if (user.isExpired()) {
			loginForm.setCode(Code.expire);
			return loginFail(request, loginForm);
		}
		loginSession.setSid(String.format("p_%s", loginSession.getSid()));
		return doLoginSuccess(request, response, loginSession, user);
	}

	protected LoginSession loadLoginSession(HttpServletRequest request, LoginForm loginForm) throws LoginException {

		return loginService.doLogin(loginForm);

	}

	protected String doLoginSuccess(HttpServletRequest request, HttpServletResponse response, LoginSession loginSession,
			User user) {

		loginSession.setUname(user.getName());

		storeSession(request, response, loginSession);

		String callback = HttpServletHelper.getCallBackUrlAndClean(request);
		if (StringUtils.isBlank(callback)) {
			callback = request.getParameter("callback");
		}
		logger.debug("login success. username=[{}] uid=[{}] domain=[{}]", user.getUsername(), user.getId(),
				user.getDomain());
		return String.format("redirect:%s", StringUtils.isBlank(callback) ? getLoginSuccessUrl() : callback);

	}

	protected User getUser(String uid) {
		User user = this.loadCurrentUser(uid);
		return user;

	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		removeSession(request, response);
		return String.format("redirect:%s", getLoginUrl());
	}

	protected String loginFail(HttpServletRequest request, LoginForm loginForm) {
		request.setAttribute("loginForm", loginForm);
		request.setAttribute("timestamp", System.currentTimeMillis());
		return getLoginView(request);
	}

	protected User loadCurrentUser(String uid) {
		return this.userService.findOne(uid);
	}

	protected String getLoginUrl() {
		return login_url;
	}

	protected String getLoginView() {
		return login_view;
	}

	protected String getLoginSuccessUrl() {
		return login_success;
	}

	protected void storeSession(HttpServletRequest request, HttpServletResponse response, LoginSession loginSession) {
		SessionHelper.storeSession(request, response, loginSession);
	}

	protected void removeSession(HttpServletRequest request, HttpServletResponse response) {
		SessionHelper.removeSession(request, response);
	}

}
