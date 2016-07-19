package com.longtime.app.ixin.mgr.vote.service;

import java.util.List;

import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;
import com.longtime.common.service.BaseService;

public interface VoteQuestionService extends BaseService<VoteQuestionEntity, String>{

	/**
	 * 查询排在指定问题之后的问题列表
	 * @author yangwenkui
	 * @param voteId 
	 * @time 2016年6月18日 下午5:40:12
	 * @param weight
	 * @return
	 */
	List<VoteQuestionEntity> findByWeight(String id,String voteId, long weight);

	/**
	 * 设置逻辑调整信息
	 * @author yangwenkui
	 * @time 2016年6月18日 下午10:54:30
	 * @param questionId 问题id
	 * @param relations optionId:jumpto;optionId:jumpto
	 * @return
	 */
	boolean doSetRelations(String questionId, String relations);
	
	/**
	 * 查询问卷下的问题
	 * @author yangwenkui
	 * @time 2016年6月23日 上午12:54:06
	 * @param voteId
	 * @return
	 */
	List<VoteQuestionEntity> listByVoteId(String voteId);

}
