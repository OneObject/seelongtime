package com.longtime.ajy.api.vo;

import java.util.List;

import com.longtime.ajy.mweb.model.VoteOptionEntity;

/**
 * @since 2014-5-12
 * @author fangxinyuan
 * 
 */
public class QuestionVO {
	
	private String id;//投票问题的ID
	private String title;//问题
	private List<VoteOptionEntity> options; //选项

	
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
	public List<VoteOptionEntity> getOptions() {
		return options;
	}
	public void setOptions(List<VoteOptionEntity> options) {
		this.options = options;
	}
	
}
