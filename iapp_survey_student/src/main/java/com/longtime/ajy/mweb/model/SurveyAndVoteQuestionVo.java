package com.longtime.ajy.mweb.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.lang3.math.NumberUtils;
/**
 * 调研和投票的问题vo
 * @author fangxinyuan
 *
 */
public class SurveyAndVoteQuestionVo extends VoteQuestionEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<VoteOptionEntity> voteOptionEntities;

	public List<VoteOptionEntity> getVoteOptionEntities() {
		
		if(null!=voteOptionEntities && !voteOptionEntities.isEmpty() && this.getType()==4){ //打分题目，按照分数重新排序
			
			Collections.sort(voteOptionEntities, new Comparator<VoteOptionEntity>(){
				@Override
				public int compare(VoteOptionEntity o1, VoteOptionEntity o2) {
					
					
					long i1 = NumberUtils.toLong(o1.getTitle(),o1.getTimestamp());
					long i2 = NumberUtils.toLong(o2.getTitle(), o2.getTimestamp());
					//return new CompareToBuilder().append(i1, i2).toComparison();
					return (i1==i2)? 0: (i1>i2) ? 1:-1;
				}
				
			});
		}
		
		return voteOptionEntities;
	}

	public void setVoteOptionEntities(List<VoteOptionEntity> voteOptionEntities) {
		this.voteOptionEntities = voteOptionEntities;
	}

}
