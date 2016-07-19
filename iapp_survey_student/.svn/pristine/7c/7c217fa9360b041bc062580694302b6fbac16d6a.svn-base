package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;

/**
 * 调研统计信息
 * @author fangxinyuan
 *
 */
public class VoteStatisticsQuestionEntity implements Entity<String>{
	
	private static final long serialVersionUID = -1761970377278303562L;
	
	private String id;// 主键
	private String voteactivityid;//调研活动id
	private String voteid;//调研问卷id
	private String questionid; // 问题答案
	private int voteNum = 0;// 选择该选项的次数
    private String domain;
    private int isDel = 0;
    
    
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVoteactivityid() {
		return voteactivityid;
	}
	public void setVoteactivityid(String voteactivityid) {
		this.voteactivityid = voteactivityid;
	}
	public String getVoteid() {
		return voteid;
	}
	public void setVoteid(String voteid) {
		this.voteid = voteid;
	}
	public String getQuestionid() {
		return questionid;
	}
	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	
	@Override
	public String toString() {
		return String.format(
				"VoteStatisticsQuestionEntity [id=%s, voteactivityid=%s, voteid=%s, questionid=%s, voteNum=%s, domain=%s, isDel=%s]",
				id, voteactivityid, voteid, questionid, voteNum, domain, isDel);
	}
	
}
