package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;


public class VoteQuestionEntity implements Entity<String>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String title;
	private int type;//类型，1单选，2多选，3 问答  4打分题  5段落  6填空
	private String voteId;
	private int voteNum;
	
	private int maxChooseNum;
	
	private int minChooseNum;
	
    private int must = 1;// 是否必答 1:是 0：否
    
    private long weight=System.currentTimeMillis();//排序值
    
    private int hasjump = 0;// 是否包含跳转 0否 1是
							//拥有逻辑跳转的试题视为分页标记，从第一题到第一个拥有逻辑
							//跳转的题目为第一页，从该提到下一个逻辑调整的试题为第二页
    
    
    private long timestamp=System.currentTimeMillis(); 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
    
    public long getTimestamp() {
        return timestamp;
    }
    
    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }
	public int getHasjump() {
		return hasjump;
	}
	public void setHasjump(int hasjump) {
		this.hasjump = hasjump;
	}
	@Override
	public String toString() {
		return String.format(
				"VoteQuestionEntity [id=%s, title=%s, type=%s, voteId=%s, voteNum=%s, maxChooseNum=%s, minChooseNum=%s, must=%s, weight=%s, hasjump=%s, timestamp=%s]",
				id, title, type, voteId, voteNum, maxChooseNum, minChooseNum, must, weight, hasjump, timestamp);
	}
	
}
