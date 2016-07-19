package com.longtime.ajy.student.filter;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.model.User;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.filter.handler.ExpirationCheckHandler;
import com.longtime.ajy.student.filter.handler.FilterOperationHandler;
import com.longtime.ajy.student.filter.handler.LoginCheckHandler;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.common.web.filter.BaseFilter;

public class LocalLoginFilter extends BaseFilter {
	
	private static final Logger logger = LoggerFactory.getLogger(LocalLoginFilter.class);

	public static final String UNAUTH_REDIRECT = "/login.xhtml";

	private static FilterOperationHandler[] handlers = new FilterOperationHandler[] { new LoginCheckHandler() };

	private static FilterOperationHandler expirationCheckHandler = new ExpirationCheckHandler();

	public static final String USER_EXPIRED_INFO_PAGE = "/WEB-INF/views/error/expired.jsp";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		super.init(filterConfig);
	}

	private static final String[] RESPONSE_401_URLS = new String[] { "/player/trace" }; // 如果没有登录，不跳转到登录页的，返回http
																						// status=401的url地址

	@Override
	public void doFilterHandle(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		boolean isEffictive = expirationCheckHandler.handle(request, response);
		if (!isEffictive) {
			User user = SessionHelper.getCurrentUser(request);
			request.setAttribute("user", user);

			SessionHelper.flushCurrentUser(request, null);
			request.getRequestDispatcher(USER_EXPIRED_INFO_PAGE).forward(request, response);
			return;
		}

		for (FilterOperationHandler handler : handlers) {
			if (handler.handle(request, response)) {
				chain.doFilter(request, response);
				return;
			}
		}

		String url = request.getServletPath();
		for (String pattern : RESPONSE_401_URLS) {
			Pattern p = Pattern.compile("^" + pattern);
			Matcher m = p.matcher(url);
			if (m.find()) {
				// 写401
				response.setStatus(401);
				response.getWriter().print("no login");
				return;
			}
		}

		redirectLoginView(request, response);
		return;

		/*
		 * try { String sid = HttpServletHelper.getCookie(request,
		 * LoginSession.KEY); logger.debug("get sessionid from cookie. sid=[{}]"
		 * , sid); if (StringUtils.isBlank(sid)) { redirectLoginView(request,
		 * response); return; } LoginSession loginSession =
		 * loginSessionManager.getAndFlush(sid); if(null==loginSession){
		 * redirectLoginView(request, response); return; }
		 * ReceiptHelper.setThread(loginSession); chain.doFilter(request,
		 * response); } finally { ReceiptHelper.clearThread(); }
		 */
	}

	private static void redirectLoginView(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpServletHelper.setCallBackUrl(request);

		response.sendRedirect(String.format("%s%s", request.getContextPath(), UNAUTH_REDIRECT));
	}
	
	public static final int USER_EXPIRED = -1;//账号过期
	public static final int USER_UNLOGIN = 0;//账号未登录
	public static final int USER_LOGIN = 1;//账号已登录
	
	/**
	 * 校验用户是否登录
	 * @author yangwenkui
	 * @time 2016年7月10日 上午11:55:24
	 * @param request
	 * @param response
	 * @throws ServletException 
	 * @throws IOException 
	 */
	public static int checkLogin(HttpServletRequest request, HttpServletResponse response){
		try {
			boolean isEffictive = expirationCheckHandler.handle(request, response);
			if (!isEffictive) {
				User user = SessionHelper.getCurrentUser(request);
				request.setAttribute("user", user);
				SessionHelper.flushCurrentUser(request, null);
				return USER_EXPIRED;
			}

			boolean isPass = true;
			for (FilterOperationHandler handler : handlers) {
				if (!handler.handle(request, response)) {
					isPass = false;;
				}
			}
			if(isPass){
				return USER_LOGIN;
			}
		} catch (Exception e) {
			logger.error("check login due to error",e);
		}
		return USER_UNLOGIN;
	}

	@Override
	public void destroy() {
		super.destroy();
	}

}
