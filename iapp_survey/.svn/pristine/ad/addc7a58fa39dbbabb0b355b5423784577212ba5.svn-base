/**
 * project : repository-engine
 * user created : songsp
 * date created : 2012-3-2 - 下午1:32:34
 */
package com.longtime.common.utils;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.apache.commons.collections.ListUtils;
import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.ISearch;
import com.googlecode.genericdao.search.SearchResult;

/**
 * @since 2012-3-2
 * @author songsp
 */
public class ResultSet<T> implements Serializable, Cloneable {

	private static final long serialVersionUID = 4478869156154927333L;


	/**
	 * 数据记录
	 */
	private List<T> items;
	
	
	private Page page;
	
	
	public ResultSet(){
		
	}
	
	public ResultSet(List<T> items,int page_size,int current_page, int total_size){
		this.items = items;
		this.page = new Page();
		this.page.setCurrent_page(current_page);
		this.page.setPage_size(page_size);
		this.page.setTotal_size(total_size);
	}
	
	public ResultSet(SearchResult<T> sr,ISearch search){
		if(null==sr) return;
		this.items = sr.getResult();
		this.page = new Page();
		this.page.setCurrent_page(search.getPage()+1);
		this.page.setPage_size(search.getMaxResults());
		this.page.setTotal_size(sr.getTotalCount());
	}
	
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<T> getItems() {
		if (null == this.items) {
			this.items = Collections.emptyList();
		}
		return this.items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}

	@SuppressWarnings("unchecked")
	public static final <T > ResultSet<T> emptyResultSet() {
		return (ResultSet<T>) EMPTY_RESULTSET;
	}

	@Override
	public String toString() {
		return String.format("ResultSet [items=%s, page=%s]", Arrays.toString(items.toArray()), page);
	}

	private static final EmptyResultSet EMPTY_RESULTSET = new EmptyResultSet();

	private static class EmptyResultSet extends ResultSet<Object> {
		private static final long serialVersionUID = 3791930334095887707L;
		private static final List<Object> items = Collections.emptyList();
		
		private static final Page page = new Page();
		@Override
		public List<Object> getItems() {
			return EmptyResultSet.items;
		}
		@Override
		public Page getPage() {
			return page;
		}
		@Override
		protected Object clone() throws CloneNotSupportedException {
			return super.clone();
		}
		@Override
		public void setItems(List<Object> items) {
			throw new UnsupportedOperationException("EmptyResultSet not allowed to change.");
		}
	}

}
