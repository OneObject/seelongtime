package com.longtime.app.ixin.mgr.vote.vo;

import org.apache.commons.lang3.StringUtils;

import com.longtime.app.ixin.mgr.vote.model.VoteOptionEntity;
import com.longtime.app.util.IdGenerator;

public class VoteOptionVO {
	
	private String id;
	private String fileId;
	private String coverPath;
	private String title;
	private int voteNum;
	private long timestamp;
	private String jumpto;//跳转至指定调研问题的id
	private int inputBoxSize=0; //填空题默认字符数
	
	private String content;
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
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
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
	@Override
	public String toString() {
		return String.format(
				"VoteOptionVO [id=%s, fileId=%s, coverPath=%s, title=%s, voteNum=%s, timestamp=%s, jumpto=%s, inputBoxSize=%s, content=%s]",
				id, fileId, coverPath, title, voteNum, timestamp, jumpto, inputBoxSize, content);
	}
	/**
	 * 根据voteOptionVO 获取VoteOptionEntity
	 * @param voteOptionVO
	 * @param questionId
	 * @return
	 */
	public static VoteOptionEntity castToOptionEntity(VoteOptionEntity entity,
			VoteOptionVO voteOptionVO, String questionId) {
		entity.setCoverPath(voteOptionVO.getCoverPath());
		entity.setTitle(voteOptionVO.getTitle());
		entity.setFileId(voteOptionVO.getFileId());
		entity.setVoteQuestionId(questionId);
		entity.setContent(StringUtils.isBlank(voteOptionVO.getContent())?"":voteOptionVO.getContent());
		if(entity.getTimestamp() == 0){
			if(voteOptionVO.getTimestamp() != 0){
				entity.setTimestamp(voteOptionVO.getTimestamp());
			} else {
				entity.setTimestamp(System.currentTimeMillis());
			}
		}
		entity.setInputBoxSize(voteOptionVO.getInputBoxSize());
		entity.setJumpto(voteOptionVO.getJumpto());
		return entity;
	}
}
