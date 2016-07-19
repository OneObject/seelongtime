package com.longtime.ajy.mweb.filter.adapter;

import com.longtime.ajy.mweb.filter.LoginFilterContext;
import com.longtime.ajy.mweb.filter.bean.LoginFowarder;
import com.longtime.ajy.session.LoginSession;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.support.AppException;
import com.longtime.common.dao.IdGenerator;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AutoLoginAdapter {
	
	static LoginFowarder loginFowarder = new LoginFowarder();
	/**
	 * 返回用户uid，如果没有获取到，需要自己redirect 或者 forward 或者 chain.dochar,并且返回null
	 * @param context
	 * @param request
	 * @param response
	 * @param chain
	 * @return
	 * @throws AppException
	 */
	String proccess(LoginFilterContext context,HttpServletRequest request, HttpServletResponse response, FilterChain chain);


	boolean  isSupport(HttpServletRequest request);


	static class Helper{
		public static void storeSession(HttpServletRequest request, HttpServletResponse response,
								  String currrentDomain, String uid) {
			LoginSession loginSession = new LoginSession();
			loginSession.setSid(IdGenerator.uuid32());
			loginSession.setUid(uid);
			loginSession.setDomain(currrentDomain);
			SessionHelper.storeSession(request, response, loginSession);
		}

		public static void storeSession(HttpServletRequest request, HttpServletResponse response,
								  String currrentDomain, String uid, String openId) {
			LoginSession loginSession = new LoginSession();
			loginSession.setSid(IdGenerator.uuid32());
			loginSession.setUid(uid);
			loginSession.setDomain(currrentDomain);
			SessionHelper.storeSession(request, response, loginSession, openId);
		}

	}
}
