package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;

/**
 * 投票或者调研的动作表
 * @author fangxinyuan
 *
 */
public class VoteActionDetailEntity  implements Entity<String>{
	
	private static final long serialVersionUID = 1687531379404790070L;
	
	private String id;// 主键
	private String voteid;// 投票或者是调研id
	private String voteactivityid;// 调研活动id
	private String uid;// 用户id;
	private String openid;
	private String questionid; // 问题答案
	private String optionid;// 单选或者是多选时填写id 问答题填写内容
	private String domain;
	private long createtime = System.currentTimeMillis();
	private int isDel = 0;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVoteid() {
		return voteid;
	}
	public void setVoteid(String voteid) {
		this.voteid = voteid;
	}
	
	public String getVoteactivityid() {
		return voteactivityid;
	}
	public void setVoteactivityid(String voteactivityid) {
		this.voteactivityid = voteactivityid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getQuestionid() {
		return questionid;
	}
	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}
	public String getOptionid() {
		return optionid;
	}
	public void setOptionid(String optionid) {
		this.optionid = optionid;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public long getCreatetime() {
		return createtime;
	}
	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	@Override
	public String toString() {
		return String.format(
				"VoteActionDetailEntity [id=%s, voteid=%s, voteactivityid=%s, uid=%s, openid=%s, questionid=%s, optionid=%s, domain=%s, createtime=%s, isDel=%s]",
				id, voteid, voteactivityid, uid, openid, questionid, optionid, domain, createtime, isDel);
	}
    
}
