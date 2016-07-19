package com.longtime.app.ixin.mgr.vote.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "ixin_vote_question")
public class VoteQuestionEntity extends BaseModel<String>{
	
	private static final long serialVersionUID = -5840353242291010623L;
	
	@Id
	@Column(length = 36)
	private String id;
	private String title;
	private int type;//类型，1单选，2多选，3 问答  4打分题  5段落 6填空
	private String voteId; //调研问卷id
	private int maxChooseNum = 0; //该题最多选择几项
	private int minChooseNum = 0;//该题最少选择几项
	private int must = 1;// 是否必答 1:是 0：否
	private long weight=System.currentTimeMillis();//排序值
	private long timestamp=System.currentTimeMillis(); 
	private int hasjump = 0;// 是否包含跳转 0否 1是
							//拥有逻辑跳转的试题视为分页标记，从第一题到第一个拥有逻辑
							//跳转的题目为第一页，从该提到下一个逻辑调整的试题为第二页
	private String domain;
	
	//unuse
	private int voteNum;
	
	
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
	
	
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
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
	
	public int getHasjump() {
		return hasjump;
	}
	public void setHasjump(int hasjump) {
		this.hasjump = hasjump;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	
	public static VoteQuestionVO castToVoteQuestionVO(VoteQuestionEntity voteQuestionEntity) {
		VoteQuestionVO vo = new VoteQuestionVO();
		vo.setId(voteQuestionEntity.getId());
		vo.setTitle(voteQuestionEntity.getTitle());
		vo.setType(voteQuestionEntity.getType());
		vo.setVoteId(voteQuestionEntity.getVoteId());
		vo.setVoteNum(voteQuestionEntity.getVoteNum());
		vo.setMust(voteQuestionEntity.getMust());
		vo.setWeight(voteQuestionEntity.getWeight());
		vo.setMaxChooseNum(voteQuestionEntity.getMaxChooseNum());
		vo.setMinChooseNum(voteQuestionEntity.getMinChooseNum());
		vo.setHasjump(voteQuestionEntity.getHasjump());
		return vo;
	}
	@Override
	public String toString() {
		return String.format(
				"VoteQuestionEntity [id=%s, title=%s, type=%s, voteId=%s, maxChooseNum=%s, minChooseNum=%s, must=%s, weight=%s, timestamp=%s, hasjump=%s, domain=%s, voteNum=%s]",
				id, title, type, voteId, maxChooseNum, minChooseNum, must, weight, timestamp, hasjump, domain, voteNum);
	}
	
	
}
