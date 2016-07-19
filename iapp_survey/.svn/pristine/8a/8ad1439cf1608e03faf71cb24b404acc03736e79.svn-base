package com.longtime.app.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.math.NumberUtils;

import com.longtime.common.utils.Page;

public class PageUtil {

	private static String PAGE = "page";
	private static String PAGE_SIZE = "max";

	public static Page getPage(HttpServletRequest request) {
	    
	    int page_size = NumberUtils.toInt(request.getParameter(PAGE_SIZE), Page.PAGESIZE_DEFAULT);
	    
		int current_page = NumberUtils.toInt(request.getParameter(PAGE), Page.CURRENTPAGE_DEFAULT);

		Page page = new Page(current_page, page_size);

		return page;
	}
	
	public static Page updatePage(Page page, long count){
        page.setTotal_size((int) count);
        return page;
	}
}
