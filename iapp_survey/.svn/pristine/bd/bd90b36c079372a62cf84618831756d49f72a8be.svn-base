package com.longtime.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
  
/** 
 * <code>{@link CharLimitFilter}</code> 
 * 
 * 拦截防止sql注入 
 * 
 * @author Administrator 
 */  
public class XssFilter implements Filter {  
	private static Logger logger = LoggerFactory.getLogger(XssFilter.class);
	
	
	public static boolean ISOPEN = true;
  
    /* (non-Javadoc) 
     * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain) 
     */  
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException,  
            ServletException {  
          	if(ISOPEN){
          		logger.debug("xss filter is open");
          		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper( (HttpServletRequest) request);
          		filterChain.doFilter(xssRequest, response);
          	}else{
          		filterChain.doFilter(request, response);
          	}
    }

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}  
  
}  
