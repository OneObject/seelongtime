package com.longtime.ajy.mweb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

public class AskUtil {
		
	public static  String getIndex(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		String index = (String)session.getAttribute("q_index");
		
		if (StringUtils.isBlank(index)) {
			index = "tab1";
			session.setAttribute("q_index", index);
		}
		return index;
	}
	
	
	public static  void setIndex(HttpServletRequest request,String index){
		
		HttpSession session = request.getSession();
		
		session.setAttribute("q_index", index);
		
	}
	
	
}
