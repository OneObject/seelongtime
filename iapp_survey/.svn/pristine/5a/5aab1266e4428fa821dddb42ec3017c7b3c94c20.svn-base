package com.longtime.app.admin.iask.dao;

import com.longtime.app.iask.model.QuestionEntity;
import com.longtime.app.iask.model.QuestionVO;
import com.longtime.common.utils.Page;

import java.util.List;

public interface QuestionDao {

	long count(String searchContent, String domain);

	List<QuestionEntity> list(Page page, String searchContent, String domain);

	void delById(String id);
	
	void delInviteById(String id);
	
	void delAnswerById(String id);
	
	void delTagById(String id);
	
	QuestionEntity getEntity(String id);

	List<QuestionVO> listQuestions(Page page, String searchContent, String domain);

	List<QuestionEntity> listAllQuestionForReport(String domain);

	boolean updateQuestionStatus(QuestionEntity entity);

	void updateQuestionAnswerNum(QuestionEntity questionentity, String uid);

	boolean updateQuestionRecommend(QuestionEntity entity, String uid);


	void  doCleanWeekpv();

	List<QuestionEntity> listQuestionBetweenTime(String domain, Long start,Long end);

	Boolean updateQuestionTaggroup(QuestionEntity question, String qid);

}
