package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;


public class VoteEntity implements Entity<String> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id; //投票的ID
	private String title;//主题
	private String coverPath;//投票封面
	private long createTime = System.currentTimeMillis();//创建时间
	private String fileId;//封面的Id
	private long startTime;//开始时间
	private long endTime;//结束时间
	private String author;//发起人
	private String summary;//简介
	private String keywords;//关键字
	private int del = 0;//默认是未删除
	private String domain;//所属商户
	private int voteNum = 0;//投票数量
	private int surveyOrvote=0;//0 投票 1 调研
	private long weight=System.currentTimeMillis();//排序值
	private String resultconfig;//结果显示设置 json格式，statistics记录是否显示统计、personoption记录是否显示个人选择，1都为显示、0都为不显示
	public static final int ISDEL_NO = 0;

	public static final int ISDEL_YES = 1;
	
	public static final int VOTE=0;
	
	public static final int SURVEY=1;
	
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
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
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}
	
	public int getSurveyOrvote() {
		return surveyOrvote;
	}
	public void setSurveyOrvote(int surveyOrvote) {
		this.surveyOrvote = surveyOrvote;
	}
	public long getWeight() {
		return weight;
	}
	public void setWeight(long weight) {
		this.weight = weight;
	}
	public String getResultconfig() {
		return resultconfig;
	}
	public void setResultconfig(String resultconfig) {
		this.resultconfig = resultconfig;
	}
	@Override
	public String toString() {
		return String
				.format("VoteEntity [id=%s, title=%s, coverPath=%s, fileId=%s, startTime=%s, endTime=%s, author=%s, summary=%s, keywords=%s, del=%s, domain=%s, voteNum=%s]",
						id, title, coverPath, fileId, startTime, endTime,
						author, summary, keywords, del, domain, voteNum);
	}
	
}
