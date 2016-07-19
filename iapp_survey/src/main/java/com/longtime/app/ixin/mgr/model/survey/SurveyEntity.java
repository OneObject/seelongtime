package com.longtime.app.ixin.mgr.model.survey;

import com.longtime.app.ixin.mgr.utils.Constants;

/**
 * 调查实体类
 * 
 * @author 对应表 ixin_survey 调查表 与用户信息表 一起再一个 ixin_user_survey表：用户--调查表
 * 
 */
public class SurveyEntity {

	private String id;// 主键
	private String filePath; // 封面Id  对应FileInfo 主键
	private String title; // 标题
	private String domain; // 域
	private String createUid;
	private String createUname;
	private String modifyUid;
	private String modifyUname;
	private long createTime;
	private long modifyTime;
	private long startTime;
	private long endTime;
	private int release = Constants.MESSAGE_NO_DRAFT;// 是否发布
	private String desc;// 简介
	private String keywords;
	
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	private int voteNum = 0;

	public int getVoteNum() {
		return voteNum;
	}

	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getCreateUid() {
		return createUid;
	}

	public void setCreateUid(String createUid) {
		this.createUid = createUid;
	}

	public String getCreateUname() {
		return createUname;
	}

	public void setCreateUname(String createUname) {
		this.createUname = createUname;
	}

	public String getModifyUid() {
		return modifyUid;
	}

	public void setModifyUid(String modifyUid) {
		this.modifyUid = modifyUid;
	}

	public String getModifyUname() {
		return modifyUname;
	}

	public void setModifyUname(String modifyUname) {
		this.modifyUname = modifyUname;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public long getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(long modifyTime) {
		this.modifyTime = modifyTime;
	}

	public int getRelease() {
		return release;
	}

	public void setRelease(int release) {
		this.release = release;
	}

	public long getStartTime() {
		return startTime;
	}

	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}

	public long getEndTime() {
		return endTime;
	}

	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}

}
