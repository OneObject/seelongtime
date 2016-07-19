package com.longtime.app.ixin.mgr.model.matter;

import com.longtime.app.ixin.mgr.utils.Constants;

/*
 * 素材详细信息表
 * ixin_matterinfo
 */
public class MatterInfo {
	private String id;
	private String title;
	private String author;
	private String fileId;//文件ID
	private String baseId;//基础素材ID
	private int coverShowInText = Constants.COVER_SHOW_TEXT;//封面是否显示在正文
	private String desc;//摘要
	private String content;//内容
	private String originalLink;//原文链接
	private String gotoUrl;//跳转地址
	private int gotoType = Constants.GOTO_TYPE_DETAIL; //跳转类型，默认详情页面
	private String sourceBaseId;
	
	public String getSourceBaseId() {
		return sourceBaseId;
	}
	public void setSourceBaseId(String sourceBaseId) {
		this.sourceBaseId = sourceBaseId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getBaseId() {
		return baseId;
	}
	public void setBaseId(String baseId) {
		this.baseId = baseId;
	}
	public int getCoverShowInText() {
		return coverShowInText;
	}
	public void setCoverShowInText(int coverShowInText) {
		this.coverShowInText = coverShowInText;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOriginalLink() {
		return originalLink;
	}
	public void setOriginalLink(String originalLink) {
		this.originalLink = originalLink;
	}
	public String getGotoUrl() {
		return gotoUrl;
	}
	public void setGotoUrl(String gotoUrl) {
		this.gotoUrl = gotoUrl;
	}
	public int getGotoType() {
		return gotoType;
	}
	public void setGotoType(int gotoType) {
		this.gotoType = gotoType;
	}
	
}
