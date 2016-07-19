/**
 * project : repository-engine
 * user created : songsp
 * date created : 2012-3-2 - 下午1:25:52
 */
package com.longtime.common.utils;

import java.io.Serializable;

/**
 * 分页信息
 * 
 * @since 2012-3-2
 * @author songsp
 */
public class Page implements Serializable {

	private static final long serialVersionUID = -7910926835313601761L;
	
	

	public final static int PAGESIZE_DEFAULT = 10;

	public final static int CURRENTPAGE_DEFAULT = 1; //从1开始

	private int page_size = PAGESIZE_DEFAULT; // 每页条数  <=0 表示不分页

	private int current_page = CURRENTPAGE_DEFAULT;

	private int total_size; //总条数

	public static final Page _DEFAULT = new Page(0, PAGESIZE_DEFAULT);

	public Page() {

	}
	
	

	public Page(int current_page, int page_size) {
		this.setPage_size(page_size);
		this.setCurrent_page(current_page);
	}

	public int getPage_size() {
		return this.page_size;
	}

	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}

	public int getCurrent_page() {
		return this.current_page;
	}

	public void setCurrent_page(int current_page) {
		if (current_page < 1) {
			current_page = CURRENTPAGE_DEFAULT;
		}
		this.current_page = current_page;
	}

	public int getTotal_size() {
		return this.total_size;
	}

	public void setTotal_size(int total_size) {
		this.total_size = total_size;
	}

	public static int getPagesizeDefault() {
		return PAGESIZE_DEFAULT;
	}

	public int getStart() {
		return (this.current_page - 1) * this.page_size;
	}

	public int getLimit() {
		return this.page_size;
	}

	public Page nextPage() {
		this.current_page += 1;
		return this;
	}

	public Page perviousPage() {
		if (this.current_page > CURRENTPAGE_DEFAULT) {
			this.current_page -= 1;
		}
		return this;
	}

	//总共多少页
	public int getTotal_page() {
		if (page_size <= 0)
			return 1;
		return (this.total_size + this.page_size - 1) / this.page_size;
	}

	@Override
	public String toString() {
		return String.format("Page [page_size=%s, current_page=%s, total_size=%s, getTotal_page()=%s]",
			page_size,
			current_page,
			total_size,
			getTotal_page());
	}

	
}
