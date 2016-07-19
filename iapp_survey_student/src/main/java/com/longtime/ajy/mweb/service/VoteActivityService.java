package com.longtime.ajy.mweb.service;

import java.util.List;

import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.model.SurveyAndVoteQuestionVo;
import com.longtime.ajy.mweb.model.VoteActivityEntity;
import com.longtime.ajy.student.utils.Return;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.longtime.common.service.IService;


public interface VoteActivityService extends IService<VoteActivityEntity, String>{

	/**
	 * 我参加过的调研
	 * @author yangwenkui
	 * @time 2016年6月21日 下午9:25:07
	 * @param domain
	 * @param uid
	 * @param page
	 * @return
	 */
	ResultSet<VoteActivityEntity> getMyAttendVote(String domain, String uid, Pageable page);

	/**
	 * 校验用户是否可以参加调研
	 * @author yangwenkui
	 * @time 2016年6月22日 下午10:56:16
	 * @param voteActivityEntity
	 * @param user
	 * @return
	 */
	Return checkAuth(VoteActivityEntity voteActivityEntity, User user);

	/**
	 * 获取调研问卷的试题
	 * @author yangwenkui
	 * @time 2016年6月22日 下午11:12:40
	 * @param voteActivityEntity
	 * @return
	 */
	List<SurveyAndVoteQuestionVo> getQuestions(VoteActivityEntity voteActivityEntity);

	/**
	 * 获取调研问卷的试题和统计信息
	 * @author yangwenkui
	 * @time 2016年6月26日 下午2:20:34
	 * @param voteActivityEntity
	 * @return
	 */
	List<SurveyAndVoteQuestionVo> getQuestionsWithStatistics(VoteActivityEntity voteActivityEntity);
	
}
