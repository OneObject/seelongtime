package com.longtime.ajy.model;

public class RewardExplain {
	private String title;
	private String content;
	private String picUrl;
 
	public RewardExplain() {
	}

	public RewardExplain(String title, String content, String picUrl) {
		this.title = title;
		this.content = content;
		this.picUrl = picUrl;
	}

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

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

}