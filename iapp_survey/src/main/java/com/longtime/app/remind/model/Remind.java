package com.longtime.app.remind.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * 消息entity
 * @author chenkf
 *
 */
public class Remind extends BaseEntity<String>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1638692215925595914L;
	
	public final static int IS_RELEASE = 1;
	public final static int NO_RELEASE = 0;
	
	private String title;//标题
	private String content;//内容
	private String imgUrl;//图片地址
	private String domain;//域 
	private int type;//类型
	private String resourceUrl;//原文地址
	private long dateline;//时间
	private int release;//发布
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getResourceUrl() {
		return resourceUrl;
	}
	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}
	public long getDateline() {
		return dateline;
	}
	public void setDateline(long dateline) {
		this.dateline = dateline;
	}
	
	public String getDatelineFormat(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return df.format(new Date(this.getDateline()));
	}
	public int getRelease() {
		return release;
	}
	public void setRelease(int release) {
		this.release = release;
	}
	@Override
	public String toString() {
		return String
				.format("Remind [title=%s, content=%s, imgUrl=%s, domain=%s, type=%s, resourceUrl=%s, dateline=%s, release=%s]",
						title, content, imgUrl, domain, type, resourceUrl,
						dateline, release);
	}
}
