package com.longtime.app.ixin.mgr.survey.service;

import java.util.List;

import com.longtime.app.ixin.mgr.survey.model.Survey;
import com.longtime.app.ixin.mgr.survey.model.SurveyQuestion;

public interface SurveyQuestionService {
	
	boolean add(SurveyQuestion survey);

	long count(String query);

	long distinctCount(String string, String query);
	/**
	 * 根据ID 查询
	 */
	SurveyQuestion findById(String id,String domain);
	/**
	 * 修改
	 */
	boolean update(SurveyQuestion survey);
	
	boolean delete(String id,String domain);
	/**
	 *上下交换排序
	 */
	boolean exchangeWeight(String id1,String id2,String domain);
	
	List<SurveyQuestion> findBySurveyId(String s_id,String domain);
	/**
	 * 大于某页
	 */
	List<SurveyQuestion> findByGtPage(String surveyID,int page,String domain);
	/**
	 * 批量修改页码、权重、标题号(各个问题以及调研本身)
	 */
	boolean batchupdate(String[] ids, String domain,int page_numinc,int weight_inc,int titile_num_inc);
	
	/**
	 * 根据weight获取Question
	 * 大于小的 、小于大的、大小之间
	 */
	List<SurveyQuestion> findByWeight(String surveyID,String domain,long minWeight,long maxWeight);
}
