package com.longtime.app.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.myctu.platform.repository.engine.domain.query.Page;

public class PageInfoParseUtil {
	private static PageInfoParseUtil pageInfoParseUtil = new PageInfoParseUtil();

	private PageInfoParseUtil(){}	
	
	
	public static PageInfoParseUtil newInstence(){
		return pageInfoParseUtil;
	}
	
	public Page getPage(HttpServletRequest req){
		Page page = new Page();
		String pageNum = req.getParameter("pageNum");
		String numPerPage = req.getParameter("numPerPage");
		
		if(StringUtils.isNotBlank(pageNum)){
			page.setCurrent_page(Long.parseLong(pageNum));
		}
		if(StringUtils.isNotBlank(numPerPage)){
			page.setPage_size(Long.parseLong(numPerPage));
		}
		
		return page;
	}
	
}
