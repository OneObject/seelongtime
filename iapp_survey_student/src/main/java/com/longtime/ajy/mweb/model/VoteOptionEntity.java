package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;



public class VoteOptionEntity implements Entity<String> {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String fileId;
	private String coverPath;
	private String title;
	private int voteNum;
	private String voteQuestionId;
	private String content;
	private long timestamp= System.currentTimeMillis();
	private String jumpto;//跳转至指定调研问题的id
	private int inputBoxSize=0; //填空题默认字符数
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getCoverPath() {
		return coverPath;
	}
	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public String getVoteQuestionId() {
		return voteQuestionId;
	}
	public void setVoteQuestionId(String voteQuestionId) {
		this.voteQuestionId = voteQuestionId;
	}
	
	
	
	
    public long getTimestamp() {
        return timestamp;
    }
    
    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }
    public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getJumpto() {
		return jumpto;
	}
	public void setJumpto(String jumpto) {
		this.jumpto = jumpto;
	}
	public int getInputBoxSize() {
		return inputBoxSize;
	}
	public void setInputBoxSize(int inputBoxSize) {
		this.inputBoxSize = inputBoxSize;
	}
	
}
