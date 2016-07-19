package com.longtime.app.ixin.mgr.vote.vo;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;

public class VoteQuestionVO {
	
	private String id;
	private String title;
	private int type;
	private String voteId;
	private List<VoteOptionVO> options;
	private int voteNum;
	private int hasjump = 0;// 是否包含跳转 0否 1是
	private int must = 1;// 是否必答 1：是 0否
	
	private long weight = System.currentTimeMillis();//排序值
	
	private int minScore = 1;//打分题－－最低分
	
	private int maxScore = 5;//打分题－－最高分
	
	private int maxChooseNum = 0;
	
	private int minChooseNum = 0;
	
	private String content; //打分题备注信息
	
	private List<String> askAnswers;//存放问答题的答案
	private List<List<String>> fillInAnswers;//存放填空题的答案
	
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public int getMaxChooseNum() {
		return maxChooseNum;
	}
	public void setMaxChooseNum(int maxChooseNum) {
		this.maxChooseNum = maxChooseNum;
	}
	public int getMinChooseNum() {
		return minChooseNum;
	}
	public void setMinChooseNum(int minChooseNum) {
		this.minChooseNum = minChooseNum;
	}
	public String getVoteId() {
		return voteId;
	}
	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public int getHasjump() {
		return hasjump;
	}
	public void setHasjump(int hasjump) {
		this.hasjump = hasjump;
	}
	public List<VoteOptionVO> getOptions() {
		return options;
	}
	public void setOptions(List<VoteOptionVO> options) {
		this.options = options;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	
	
	public int getMust() {
		return must;
	}
	public void setMust(int must) {
		this.must = must;
	}
	public long getWeight() {
		return weight;
	}
	public void setWeight(long weight) {
		this.weight = weight;
	}
	
	public int getMinScore() {
		return minScore;
	}
	public void setMinScore(int minScore) {
		this.minScore = minScore;
	}
	public int getMaxScore() {
		return maxScore;
	}
	public void setMaxScore(int maxScore) {
		this.maxScore = maxScore;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public List<String> getAskAnswers() {
		return askAnswers;
	}
	public void setAskAnswers(List<String> askAnswers) {
		this.askAnswers = askAnswers;
	}
	public List<List<String>> getFillInAnswers() {
		return fillInAnswers;
	}
	public void setFillInAnswers(List<List<String>> fillInAnswers) {
		this.fillInAnswers = fillInAnswers;
	}
	@Override
	public String toString() {
		return String.format(
				"VoteQuestionVO [id=%s, title=%s, type=%s, voteId=%s, options=%s, voteNum=%s, hasjump=%s, must=%s, weight=%s, minScore=%s, maxScore=%s, maxChooseNum=%s, minChooseNum=%s, content=%s, askAnswers=%s, fillInAnswers=%s]",
				id, title, type, voteId, options, voteNum, hasjump, must, weight, minScore, maxScore, maxChooseNum,
				minChooseNum, content, askAnswers, fillInAnswers);
	}
	//把VoteQuestionVO强制转换位VoteQuestionEntity
	public static VoteQuestionEntity castToVoteQuestionEntity(VoteQuestionEntity entity,
			VoteQuestionVO questionVO) {
		entity.setTitle(questionVO.getTitle());
		entity.setType(questionVO.getType());
		entity.setVoteId(questionVO.getVoteId());
		entity.setMust(questionVO.getMust());
		if(StringUtils.isBlank(entity.getId())){
			entity.setWeight(questionVO.getWeight());
		} 
		entity.setTimestamp(System.currentTimeMillis());
		entity.setMaxChooseNum(questionVO.getMaxChooseNum());
		entity.setMinChooseNum(questionVO.getMinChooseNum());
		return entity;
	}
}
