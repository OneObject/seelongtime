package com.longtime.ajy.mweb.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.longtime.ajy.model.User;
import com.longtime.ajy.model.vo.TenantInfo;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.filter.bean.LoginFowarder;
import com.longtime.ajy.session.ReceiptHelper;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.config.Constant;
import com.longtime.ajy.student.filter.handler.ExpirationCheckHandler;
import com.longtime.ajy.student.filter.handler.FilterOperationHandler;
import com.longtime.ajy.student.filter.handler.SiteOpenConfigHandler;
import com.longtime.ajy.student.service.TenantConfigService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.common.web.filter.BaseFilter;

public class MwebLoginFilter3 extends BaseFilter {

	private static Logger logger = LoggerFactory.getLogger(MwebLoginFilter3.class);

	public static final String M_FAIL_PAGE = Constant.M_FAIL_PAGE;

	public static final String WX_OAUTH_REDIRECT_URL = "/m/wx_oauth_redirect.xhtml";

	public static final String USER_EXPIRED_INFO_PAGE = "/WEB-INF/views/error/expired.jsp";

	private static TenantConfigService tenantConfigService = null;
	private static UserService userService = null;

	public static String ajy_app_id;
	public static String ajy_app_secret;

	private LoginFowarder loginFowarder = new LoginFowarder();
	private static FilterOperationHandler siteOpenConfigHandler = new SiteOpenConfigHandler();

	private static FilterOperationHandler expirationCheckHandler = new ExpirationCheckHandler();

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		super.init(filterConfig);
		ajy_app_id = Constant.WX_AJY_APPID;
		ajy_app_secret = Constant.WX_AJY_APPSECRET;
		tenantConfigService = (TenantConfigService) WebApplicationContextUtils
				.getWebApplicationContext(filterConfig.getServletContext()).getBean("tenantConfigService");
		userService = (UserService) WebApplicationContextUtils
				.getWebApplicationContext(filterConfig.getServletContext()).getBean("userService");
	}

	@Override
	public void doFilterHandle(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (tenantConfigService == null) {
			tenantConfigService = (TenantConfigService) WebApplicationContextUtils
					.getWebApplicationContext(request.getSession().getServletContext()).getBean("tenantConfigService");
		}
		if (userService == null) {
			userService = (UserService) WebApplicationContextUtils
					.getWebApplicationContext(request.getSession().getServletContext()).getBean("userService");
		}
		
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			request.getSession().setAttribute("activityId", id);
		}

		// 获取会话信息
		ReceiptHelper receiptHelper = new ReceiptHelper(request, response);

		boolean isReceiptLogin = receiptHelper.isReceiptLoginAcceptable();

		String currrentDomain = MwebHelper.getCurrentDomain();

		TenantInfo tenantInfo = MwebHelper.getTenantInfo();
		request.setAttribute("tenantConfig", tenantInfo);
		// url 开放配置
		boolean isUrlOpen = siteOpenConfigHandler.handle(request, response);
		LoginFilterContext context = new LoginFilterContext();
		context.domain = currrentDomain;
		context.isUrlOpen = isUrlOpen;
		context.tenantInfo = tenantInfo;

		if (!isUrlOpen) {
			boolean isEffictive = expirationCheckHandler.handle(request, response);
			if (!isEffictive) {
				logger.debug("user is expired.");
				User user = SessionHelper.getCurrentUser(request);
				request.setAttribute("user", user);

				SessionHelper.flushCurrentUser(request, null);
				request.getRequestDispatcher(USER_EXPIRED_INFO_PAGE).forward(request, response);
				return;
			}
		}

		String uid = null;
		if (isReceiptLogin) { // 有会话信息
			if (logger.isTraceEnabled()) {
				logger.trace(
						"LOGIN FILTER_RECEIPT attribute was present and acceptable - passing  request through filter..");
			}
			uid = MwebHelper.getCurrentUid();
			context.uid = uid;
		}

		if (uid == null) {
			// 无会话信息
			if (StringUtils.isBlank(currrentDomain)) {
				request.setAttribute("msg", "无法获取domain信息");
				logger.debug("not find domain. goto login page");
				// request.getRequestDispatcher(M_FAIL_PAGE).forward(request,
				// response);
				loginFowarder.fowardToLogin(request, response);
				return;
			}

			context.uid = uid;
		}

		// 判断用户 是否存在 是否临时用户 && 未被禁用

		User user = MwebHelper.getCurrentUser(request);

		if (null == user || !user.getId().equals(uid)) {
			user = userService.getUserById(uid, null);
		}

		if (null == user || user.getEnable() == User.ENABLE_NO) {
			fowardToBindOrLogin(request, response, currrentDomain);
			return;
		}

		chain.doFilter(request, response);
		return;
	}

	private void fowardToBindOrLogin(HttpServletRequest request, HttpServletResponse response, String domain)
			throws ServletException, IOException {

//		boolean isFromWeixin = MwebHelper.isFromWeiXinBrowser(request);
//		if (isFromWeixin) {
//			loginFowarder.fowardToUserBind(request, response, domain);
//		} else {
			loginFowarder.fowardToLogin(request, response);
//		}

	}
	
	public static final int USER_EXPIRED = -1;//账号过期
	public static final int USER_UNLOGIN = 0;//账号未登录
	public static final int USER_LOGIN = 1;//账号已登录
	
	public static int checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException{
		if (tenantConfigService == null) {
			tenantConfigService = (TenantConfigService) WebApplicationContextUtils
					.getWebApplicationContext(request.getSession().getServletContext()).getBean("tenantConfigService");
		}
		if (userService == null) {
			userService = (UserService) WebApplicationContextUtils
					.getWebApplicationContext(request.getSession().getServletContext()).getBean("userService");
		}
		
		// 获取会话信息
		ReceiptHelper receiptHelper = new ReceiptHelper(request, response);

		boolean isReceiptLogin = receiptHelper.isReceiptLoginAcceptable();

		String currrentDomain = MwebHelper.getCurrentDomain();

		TenantInfo tenantInfo = MwebHelper.getTenantInfo();
		request.setAttribute("tenantConfig", tenantInfo);
		// url 开放配置
		boolean isUrlOpen = siteOpenConfigHandler.handle(request, response);
		LoginFilterContext context = new LoginFilterContext();
		context.domain = currrentDomain;
		context.isUrlOpen = isUrlOpen;
		context.tenantInfo = tenantInfo;

		if (!isUrlOpen) {
			boolean isEffictive = expirationCheckHandler.handle(request, response);
			if (!isEffictive) {
				logger.debug("user is expired.");
				User user = SessionHelper.getCurrentUser(request);
				request.setAttribute("user", user);
				SessionHelper.flushCurrentUser(request, null);
				return USER_EXPIRED;
			}
		}

		String uid = null;
		if (isReceiptLogin) { // 有会话信息
			if (logger.isTraceEnabled()) {
				logger.trace(
						"LOGIN FILTER_RECEIPT attribute was present and acceptable - passing  request through filter..");
			}
			uid = MwebHelper.getCurrentUid();
			context.uid = uid;
		}

		if (uid == null) {
			// 无会话信息
			if (StringUtils.isBlank(currrentDomain)) {
				request.setAttribute("msg", "无法获取domain信息");
				logger.debug("not find domain. goto login page");
				return USER_UNLOGIN;
			}

			context.uid = uid;
		}

		// 判断用户 是否存在 是否临时用户 && 未被禁用

		User user = MwebHelper.getCurrentUser(request);
		if (null == user || !user.getId().equals(uid)) {
			user = userService.getUserById(uid, null);
		}

		if (null == user || user.getEnable() == User.ENABLE_NO) {
			return USER_UNLOGIN;
		}

		return USER_LOGIN;
	}

	public String generateState() {
		return "oauth";
	}

	@Override
	public void destroy() {

	}

}