package com.longtime.ajy.filter;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.ajy.support.I18nHelper;



public class LanguageSettingFilter implements Filter{
	
	private static Logger logger = LoggerFactory.getLogger(LanguageSettingFilter.class);
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.debug("Language filter init~~~~~~~~~~~~");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		Locale locale = req.getLocale();
		I18nHelper.setCurrentLanguageType(locale);
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		logger.debug("user track filter destroy~~~~~~~~~~~~");
	}

}
