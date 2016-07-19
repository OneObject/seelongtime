package com.longtime.app.ixin.mgr.vote.model;

import org.apache.commons.lang3.StringUtils;

import com.longtime.app.ixin.mgr.vote.vo.QuestionVO;
import com.longtime.app.util.IdGenerator;

public class QuestionEntity {
	private String qid;//投票问题的ID
	private String voteId;//投票基础信息ID
	private String qtitle;//问题
	private int voteNum;//投票数量
	private int shortNum;//排序号
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getVoteId() {
		return voteId;
	}
	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public int getShortNum() {
		return shortNum;
	}
	public void setShortNum(int shortNum) {
		this.shortNum = shortNum;
	}
	public static QuestionEntity getQuestionEntityByQVO(QuestionVO qVO,String voteId) {
		QuestionEntity entity = new QuestionEntity();
		entity.setQid(StringUtils.isBlank(qVO.getQid())?(String)IdGenerator.nextId32():qVO.getQid());
		entity.setQtitle(qVO.getQtitle());
		entity.setVoteId(voteId);
		return entity;
	}
	public static QuestionVO castToQuestionVO(QuestionEntity entity) {
		QuestionVO vo = new QuestionVO();
		vo.setQid(entity.getQid());
		vo.setQtitle(entity.getQtitle());
		vo.setShortNum(entity.getShortNum());
		vo.setVoteNum(entity.getVoteNum());
		return vo;
	}
	
}
