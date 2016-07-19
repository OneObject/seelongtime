package com.longtime.ajy.mweb.service;

import java.util.List;
import java.util.Map;

import com.longtime.ajy.api.vo.QuestionVO;
import com.longtime.ajy.mweb.model.SurveyAndVoteQuestionVo;
import com.longtime.ajy.mweb.model.VoteActionDetailEntity;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.common.service.IService;


public interface VoteService extends IService<VoteEntity, String>{
	
	/**
	 *得到投票或调研列表 
	 * @param domain
	 * @param surveyOrvote 判断是投票列表还是调研列表
	 * @return
	 */
	List<VoteEntity> querylist( String domain,int surveyOrvote);
	List<QuestionVO>  queryListOption(String id);
	
	List<SurveyAndVoteQuestionVo> querylist(String id);
	
	/**
	 * 增加投票人数
	 * @param voteId
	 */
	void updateUserVoteNum(String voteId);

	/**
	 * 保存用户投票信息
	 * @param oId
	 * @param qId
	 * @param voteId
	 * @param openId
	 * @return
	 */
	boolean saveUserVote(String voteId, String uid,String openId);
	
	void updateQuestionCount(String qid);
	
	void saveVoteActionDetail(VoteActionDetailEntity voteActionDetailEntity);
	
	void updateOptionCount(String optionId);
	
	List<VoteActionDetailEntity> getVoteActionDetailEntities(String uid,String activityId,String domain);
	
	/**
	 * 保存调研结果
	 * @author yangwenkui
	 * @time 2016年6月25日 下午10:05:51
	 * @param activityId
	 * @param voteId
	 * @param uid
	 * @param domain
	 * @param allowAnonymous 
	 * @param answerMap
	 * @return
	 */
	boolean saveAnswer(String activityId, String voteId, String uid, String domain, String allowAnonymous, Map<String, String> answerMap);
}
