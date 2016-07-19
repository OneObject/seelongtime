package com.longtime.app.ixin.mgr.topic.model;

import javax.servlet.http.HttpServletRequest;

import com.longtime.app.ixin.mgr.utils.Constants;
import com.longtime.common.utils.LoginSessionHelper;

/**
 * 话题实体 对应表：ixin_topic
 */
public class TopicEntity {

	private String id;// 主键
	private String title;// 标题
	private String summary;// 简介
	private String keywords;// 关键字
	private long createTime=System.currentTimeMillis();// 创建时间
	private String coverPath;// 封面
	private String fileId;// 封面文件Id
	private String domain;// 租户
	private int del = Constants.NO_DEL;
	private int isaudit = 0;// 是否开启审核，0代表关闭审核，1代表开启审核;
	private int supportimage=1;//是否支持图片 0:不支持  1，支持
	private String creator;
	private String updater;
	private Long updatetime;
	private String creatorName;
	private String updaterName;
	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public String getUpdaterName() {
		return updaterName;
	}

	public void setUpdaterName(String updaterName) {
		this.updaterName = updaterName;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public Long getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public String getCoverPath() {
		return coverPath;
	}

	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}
	
	public int getIsaudit() {
		return isaudit;
	}

	public void setIsaudit(int isaudit) {
		this.isaudit = isaudit;
	}

	
	public int getSupportimage() {
		return supportimage;
	}

	public void setSupportimage(int supportimage) {
		this.supportimage = supportimage;
	}
	

	public static TopicEntity getTopicEntity(TopicEntity entity, HttpServletRequest request) {
		entity.setDomain(LoginSessionHelper.getCurrentDomain(request));
		entity.setCreateTime(System.currentTimeMillis());
		return entity;
	}

}
