package com.longtime.ajy.student.utils;

import javax.servlet.http.HttpServletRequest;
/**
 *在服务器端得到访问者ip
 * @author fangxinyuan
 *
 */
public class IpUtil {
	
	/**
	 * 得到访问者ip
	 * @param request
	 * @return
	 */
	public static String getRemortIP(HttpServletRequest request) {  
	    if (request.getHeader("x-forwarded-for") == null) {  
	        return request.getRemoteAddr();  
	    }  
	    return request.getHeader("x-forwarded-for");  
	}  
}
