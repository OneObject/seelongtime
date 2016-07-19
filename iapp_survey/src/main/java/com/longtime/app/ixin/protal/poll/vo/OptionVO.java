package com.longtime.app.ixin.protal.poll.vo;

public class OptionVO {

	private String oid;
	private String otitle;
	private String filePath;
	private int sortNum;
	private int userVoteNum;//用户投票数量
	
	public int getUserVoteNum() {
		return userVoteNum;
	}
	public void setUserVoteNum(int userVoteNum) {
		this.userVoteNum = userVoteNum;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getOtitle() {
		return otitle;
	}
	public void setOtitle(String otitle) {
		this.otitle = otitle;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public int getSortNum() {
		return sortNum;
	}
	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}
	
}
