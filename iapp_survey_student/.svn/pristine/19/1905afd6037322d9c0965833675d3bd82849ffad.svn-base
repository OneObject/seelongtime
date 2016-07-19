package com.longtime.ajy.model.vo;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.longtime.ajy.model.Comment;
import com.longtime.ajy.model.PraiseHistory;
import com.longtime.ajy.model.Topic;
import com.longtime.common.model.search.ResultSet;

public class NTopicVo {
	private Topic topic;

	private ResultSet<PraiseHistory> praiseSet;
    
    private ResultSet<Comment> commentSet;

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}
   

	public ResultSet<PraiseHistory> getPraiseSet() {
		return praiseSet;
	}

	public void setPraiseSet(ResultSet<PraiseHistory> praiseSet) {
		this.praiseSet = praiseSet;
	}

	public ResultSet<Comment> getCommentSet() {
		return commentSet;
	}

	public void setCommentSet(ResultSet<Comment> commentSet) {
		this.commentSet = commentSet;
	}

	public List<String> getTopicCovers(){
		if(null==topic || StringUtils.isBlank(topic.getCover())){
			return Collections.EMPTY_LIST;
		}
		String coversString =topic.getCover();
		return Arrays.asList(coversString.split(","));
		
	}
    
}
