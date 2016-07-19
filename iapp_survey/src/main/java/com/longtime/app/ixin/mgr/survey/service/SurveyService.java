package com.longtime.app.ixin.mgr.survey.service;

import java.util.List;

import com.longtime.app.ixin.mgr.survey.model.Survey;
import com.longtime.common.utils.Page;

public interface SurveyService {
	
	boolean add(Survey survey);

	long count(String query);

	long distinctCount(String string, String query);
	/**
	 * 根据ID 查询
	 */
	Survey findById(String id,String domain);
	/**
	 * 修改
	 */
	boolean update(Survey survey,String domian);
	
	boolean delete(String id,String domain);
	
	List<Survey> findByPage(String domain,Page page);
	/**
	 * 验证调研标题唯一性
	 */
	boolean verifyUniqueness(String id,String title);
	
}
