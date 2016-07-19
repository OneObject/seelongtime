package com.longtime.common.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.longtime.app.ixin.mgr.model.IXinUser;
import com.longtime.app.ixin.mgr.service.IXinUserService;
import com.longtime.app.util.Constant;
import com.myctu.platform.AppSettings;

public class UserBindFilter implements Filter {
    Logger logger = LoggerFactory.getLogger(UserBindFilter.class);
    
    private static String REDIRECT_URL;
    private static List<String> CHECK_URL = new ArrayList<String>();
    
    static{
    	AppSettings.init("/com.longtime.app.ixin.properties");
    	REDIRECT_URL = "/base/admin/home.xhtml";// AppSettings.getInstance().get("user_bind_redirect_url");
    	String checkUrl = "/ivideo/student/list.xhtml";//AppSettings.getInstance().get("check_url");
    	if(StringUtils.isNotBlank(checkUrl)){
    		String[] urls = checkUrl.split(",");
    		for(String url : urls){
    			CHECK_URL.add(url);
    		}
    	}
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logger.debug("user bind filter init~~~~~~~~~~~~");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        logger.debug("user bind filter do~~~~~~~~~~~~");

        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse)response;

        if(CHECK_URL.contains(req.getRequestURI())){
        	String openId = req.getParameter(Constant.OPENID);
        	if(StringUtils.isBlank(openId)){
        		resp.sendRedirect(req.getContextPath() + REDIRECT_URL);
        		return;
        	}
        	WebApplicationContext webApplicationContext = WebApplicationContextUtils.
             		getWebApplicationContext(req.getSession().getServletContext()); 
            IXinUserService iXinUserService = webApplicationContext.getBean(IXinUserService.class);
        	IXinUser user = iXinUserService.getIxinUserByOpenId(openId);
        	if(user != null){
        		logger.info("通过验证");
        		request.setAttribute("uid", user.getBase_id());
        		chain.doFilter(request,response);
        	} else {
        		resp.sendRedirect(req.getContextPath() + REDIRECT_URL);
        		logger.info("未验证用户");
                return ;
        	}
            
        }
        else{
        	//System.out.println("非验证用户");
        	chain.doFilter(request,response);
            return ;
        }
    }

    @Override
    public void destroy() {
        
    }
    
}
