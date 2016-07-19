package com.longtime.app.news.vo;

import java.io.Serializable;
import java.util.List;

/**
 * NewsFile.xml 对应的一条数据
 * @author chenkf
 *
 */
public class CategoryNewsVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -730399324795966809L;
	
	private String name;
	
	private List<NewsVO> news;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<NewsVO> getNews() {
		return news;
	}

	public void setNews(List<NewsVO> news) {
		this.news = news;
	}

}
