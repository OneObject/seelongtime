package com.longtime.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.app.ixin.protal.WXOauthFilter;
import com.longtime.app.track.model.UserTrackEntity;
import com.longtime.app.track.model.UserTrackModel;
import com.longtime.app.track.task.UserTrackTask;
import com.longtime.app.util.WebUtil;
import com.longtime.common.utils.LoginSessionHelper;

public class UserTrackFilter implements Filter{
	
	private static Logger logger = LoggerFactory.getLogger(UserTrackFilter.class);
	
	private static String DEFAULT_UID = "-1";
	
	private static boolean ISTRACK = false;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.debug("user track filter init~~~~~~~~~~~~");
		String isTrack = filterConfig.getInitParameter("isTrack");
		if(StringUtils.isNotBlank(isTrack)){
			ISTRACK = BooleanUtils.toBoolean(isTrack);
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String sessionid = req.getSession().getId();
		chain.doFilter(request, response);
		
		if(ISTRACK){
			String url = HttpServletHelper.getCurrentUrl(req);
			String uid = LoginSessionHelper.getCurrentUserId(req);
			String domain = LoginSessionHelper.getCurrentDomain(req);
			String openId = WXOauthFilter.Util.getCurrentUserOpenIdFromCookie(req, domain);;
			String request_method = StringUtils.lowerCase(req.getMethod());
			long time = System.currentTimeMillis();
			
			if(StringUtils.isBlank(uid)){
				uid = DEFAULT_UID;
			}
			String userAgent = ((HttpServletRequest) request).getHeader("User-Agent");
			
			UserTrackModel track = new UserTrackModel(uid,openId,domain,url,time,userAgent,request_method,sessionid);
			
			track.setDevice(WebUtil.isMoblie(userAgent)?UserTrackEntity.CODE_MOBILE:UserTrackEntity.CODE_PC);
			
			UserTrackTask.save(track);
		}
	}

	@Override
	public void destroy() {
		logger.debug("user track filter destroy~~~~~~~~~~~~");
	}

}
