package com.longtime.ajy.mweb.filter.bean;

import java.io.IOException;

import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.support.HttpServletHelper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginFowarder {

	private static Logger logger = LoggerFactory.getLogger(LoginFowarder.class);


	public void fowardToLogin(HttpServletRequest request, HttpServletResponse response)  {
		HttpServletHelper.setCallBackUrl(request);
		String callback = HttpServletHelper.getCurrentUrl(request);
		request.setAttribute("callback", callback);
		request.setAttribute("domain", MwebHelper.getCurrentDomain());
		
		
		//判断是否是ajax 或者 load 方式加载页面 .list .json 结束  返回一段刷新页面的js
		String uri = request.getRequestURL().toString();
		if(uri.lastIndexOf(".list")!=-1 || uri.lastIndexOf(".json")!=-1){
		    
		    try {
                response.getWriter().print("<script type=\"text/javascript\">window.location.reload();</script>");
                response.getWriter().flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
		    return;
		}
		
		try {
            request.getRequestDispatcher(MwebHelper.getLoginViewJSP(MwebHelper.getCurrentDomain())).forward(request,response);
        } catch (Exception e) {
            logger.error("foward to user login due to error", e);
        }
	}

	public void fowardToUserBind(HttpServletRequest request, HttpServletResponse response, String domain) {
		HttpServletHelper.setCallBackUrl(request);
		request.setAttribute("domain", domain);
		request.setAttribute("d_openid", request.getAttribute("d_openid"));
		request.setAttribute("openid", MwebHelper.getCurrentOpenId());
		// request.setAttribute("timestamp", System.currentTimeMillis());
		try {
            request.getRequestDispatcher(MwebHelper.getLoginBindViewJSP(domain)).forward(request, response);
        } catch (Exception e) {
            logger.error("foward to user bind due to error", e);

        }

	}

}
