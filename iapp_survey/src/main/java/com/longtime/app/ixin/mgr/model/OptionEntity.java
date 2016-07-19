package com.longtime.app.ixin.mgr.model;

/**
 * 选项
 */
public class OptionEntity {
	
	private String id;//主键
	private String qid;//试题ID
	private String filePath;//图片ID
	private String title;//选项内容
	private int sortNum;//排序号
	private int userVoteNum;
	
	public int getUserVoteNum() {
		return userVoteNum;
	}
	public void setUserVoteNum(int userVoteNum) {
		this.userVoteNum = userVoteNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
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
	public int getSortNum() {
		return sortNum;
	}
	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}

}
