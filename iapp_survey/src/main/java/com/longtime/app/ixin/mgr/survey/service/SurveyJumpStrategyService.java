package com.longtime.app.ixin.mgr.survey.service;

import java.util.List;

import com.longtime.app.ixin.mgr.survey.model.SurveyJumpStrategy;


public interface SurveyJumpStrategyService {
	
	boolean add(SurveyJumpStrategy surveyJumpStrategy);

	long count(String query,Object... parameters);

	long distinctCount(String key, String query);
	/**
	 * 根据ID 查询
	 */
	SurveyJumpStrategy findById(String id);
	/**
	 * 修改
	 */
	boolean update(SurveyJumpStrategy surveyJumpStrategy);
	
	boolean delete(String id,String domain);
	boolean delete(String surveyid,String questionid,String domain);
	/**
	 * 某个调研下的某个题目中的逻辑
	 */
	List<SurveyJumpStrategy> findList(String surveyid,String questionid,String domain);
	/**
	 * 某个调研下所有的逻辑设置
	 */
	List<SurveyJumpStrategy> findBySurveyId(String surveyid,String domain);
}
