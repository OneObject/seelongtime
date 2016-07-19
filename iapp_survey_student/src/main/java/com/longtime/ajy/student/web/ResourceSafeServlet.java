package com.longtime.ajy.student.web;

import org.apache.commons.lang3.StringUtils;

import com.google.common.base.Joiner;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ResourceSafeServlet extends HttpServlet{
	private static final long serialVersionUID = 3354744618671949747L;
	
	 private static Logger logger = LoggerFactory.getLogger(ResourceSafeServlet.class);


	private static final String X_ACCEL_REDIRECT = "x-accel-redirect";
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		String queryString = request.getQueryString();
		
		String path = request.getContextPath();
		if(StringUtils.isNotBlank(path) && url.startsWith(path)){
			url =StringUtils.substring(url, path.length());
		}
		
		url = Joiner.on("?").skipNulls().join(url, queryString);
		
		//  /protected/resource/download.html
		String x_accel = String.format("/protected%s", url);
		logger.debug("x-accel-redirect=[{}]", x_accel);
		response.addHeader(X_ACCEL_REDIRECT, x_accel);
	}
	
	public static void main(String[] args) {
		
		System.out.println(Joiner.on("?").skipNulls().join("/test.jsp",""));
	}
	

}
