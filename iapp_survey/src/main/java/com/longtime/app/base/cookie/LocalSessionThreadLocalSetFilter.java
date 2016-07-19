package com.longtime.app.base.cookie;

import com.google.common.base.Joiner;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.app.base.model.Tenant;
import com.longtime.app.base.model.User;
import com.longtime.common.utils.LoginSessionHelper;
import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LocalSessionThreadLocalSetFilter extends BaseFilter {

    private static Logger logger = LoggerFactory.getLogger(LocalSessionThreadLocalSetFilter.class);
    
    private static final String REDIRECT_URL = "/mgr/login.xhtml";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        super.init(filterConfig);
    }
    
    @Override
    public void doFilterHandle(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
                                                                                                           throws IOException,
                                                                                                           ServletException {

        if (logger.isDebugEnabled()) {
            logger.debug("request url=[{}]",HttpServletHelper.getCurrentUrl(request));
            Cookie[] cookies = request.getCookies();
            if (null != cookies) {
                for (Cookie cookie : cookies) {
                    logger.debug("cookie:{}={}", cookie.getName(), cookie.getValue());
                }
            }
        }
        try{
        	//得到session信息
        	String uid=LoginSessionHelper.getCurrentUserId(request);
        	User user = LoginSessionHelper.getCurrentUser(request);
        	if(StringUtils.isBlank(uid) || user==null){ //从cookie中获取
        		CookieReceipt cookieReceipt=new CookieReceipt(request, response);
        		
        		if(!cookieReceipt.validate()){
        			cookieReceipt.destory();
    				String callback = Joiner.on("?").skipNulls().join(request.getServletPath(),request.getQueryString());
    				callback = URLEncoder.encode(callback, "utf-8");
    				String redirect = String.format("%s%s?f=%s", request.getContextPath() ,REDIRECT_URL,callback);
    				logger.debug("redirect=[{}]",redirect);
    				response.sendRedirect(redirect);
    				return;
        		}
        		
        		user=cookieReceipt.getUser();
        		Tenant tenant=cookieReceipt.getTenant();
        		if(user!=null && tenant!=null){
        			uid = cookieReceipt.getUser().getId();
        			LoginSessionHelper.putCurrentUser(request, user);
        			LoginSessionHelper.putCurrentDomain(request, tenant);
        		}
        			
        	}
        	LoginSessionHelper.setThreadLocalUserInfo(user);
        	chain.doFilter(request, response);
        }finally{
        	LoginSessionHelper.clearThreadLocalUserInfo();
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
    
    

}
