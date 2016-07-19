package com.longtime.app.ixin.mgr.vote.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.longtime.common.model.BaseModel;

/**
 * 投票或者调研的动作表
 * @author fangxinyuan
 *
 */
@Entity
@Table(name = "ixin_vote_action_detail")
public class VoteActionDetailEntity extends BaseModel<String>{
	private static final long serialVersionUID = -765817484736707260L;
	
	@Id
	@Column(length = 32)
	private String id;// 主键
	private String voteactivityid;//调研活动id
	private String voteid;//调研问卷id
	private String questionid; // 问题答案
	private String uid;// 用户id;
	private String optionid;// 单选或者是多选时填写id 问答题填写内容
	private long createtime = System.currentTimeMillis();
	private String domain;
	private String openid;
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
	public String getVoteactivityid() {
		return voteactivityid;
	}
	public void setVoteactivityid(String voteactivityid) {
		this.voteactivityid = voteactivityid;
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
				"VoteActionDetailEntity [id=%s, voteactivityid=%s, voteid=%s, questionid=%s, uid=%s, optionid=%s, createtime=%s, domain=%s, openid=%s, isDel=%s]",
				id, voteactivityid, voteid, questionid, uid, optionid, createtime, domain, openid, isDel);
	}
	
}
