package com.longtime.common.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.math.NumberUtils;

import com.longtime.common.model.search.Pageable;

public class PageUtil {

	
	private static String PAGE = "page";
	private static String PAGE_SIZE = "size";

	public static Pageable getPage(HttpServletRequest request) {
	    
	    int page_size = NumberUtils.toInt(request.getParameter(PAGE_SIZE), Pageable.DEFAULT_PAGE_SIZE_TEN);
	    
		int current_page = NumberUtils.toInt(request.getParameter(PAGE), Pageable.FIRST_PAGE_NUMBER);

		Pageable page = new Pageable(current_page, page_size);

		return page;
	}
	
	public static Pageable updatePage(Pageable page, long count){
        page.setTotal(count);
        return page;
	}
	
	
}
