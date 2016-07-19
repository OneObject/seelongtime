package com.longtime.app.ixin.mgr.vote.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;

import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "ixin_vote_option")
public class VoteOptionEntity extends BaseModel<String>{

	private static final long serialVersionUID = -8496394035200719990L;
	
	@Id
	@Column(length = 36)
	private String id;
	private String title;
	private String coverPath;//七牛路径
	private String fileId; //本地存储路径
	private String voteQuestionId; //问题id
	private String jumpto;//跳转至指定调研问题的id
	private long timestamp= System.currentTimeMillis();
	private String domain;
	private int inputBoxSize=0; //填空题默认字符数
	
	//unuse
	private int voteNum;
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
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
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
				"VoteOptionEntity [id=%s, title=%s, coverPath=%s, fileId=%s, voteQuestionId=%s, jumpto=%s, timestamp=%s, domain=%s, inputBoxSize=%s, voteNum=%s, content=%s]",
				id, title, coverPath, fileId, voteQuestionId, jumpto, timestamp, domain, inputBoxSize, voteNum,
				content);
	}
	
	//强制类型转换
	public static VoteOptionVO castToVoteOptionVO(VoteOptionEntity voteOptionEntity) {
		VoteOptionVO vo = new VoteOptionVO();
		vo.setCoverPath(voteOptionEntity.getCoverPath());
		vo.setFileId(voteOptionEntity.getFileId());
		vo.setId(voteOptionEntity.getId());
		vo.setTitle(voteOptionEntity.getTitle());
		vo.setVoteNum(voteOptionEntity.getVoteNum());
		vo.setContent(StringUtils.isBlank(voteOptionEntity.getContent())?"":voteOptionEntity.getContent());
		vo.setTimestamp(voteOptionEntity.getTimestamp());
		vo.setInputBoxSize(voteOptionEntity.getInputBoxSize());
		vo.setJumpto(voteOptionEntity.getJumpto());
		return vo;
	}
}
