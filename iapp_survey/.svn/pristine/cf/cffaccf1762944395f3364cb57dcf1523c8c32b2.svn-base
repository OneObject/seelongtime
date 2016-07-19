package com.longtime.app.admin.iask.service;

import com.longtime.app.iask.model.QuestionEntity;
import com.longtime.app.iask.model.QuestionVO;
import com.longtime.common.utils.Page;

import java.util.List;

public interface QuestionService {

	long count(String searchContent, String domain);

	List<QuestionEntity> list(Page page, String searchContent, String domain);
	
	List<QuestionVO> listQuestions(Page page, String searchContent, String domain);

	void delById(String id);
	
	void delInviteById(String id);
	
	void delAnswerById(String id);
   
	void delTagById(String id);
	
	QuestionEntity getEntity(String id);

	boolean updateQuestionStatus(QuestionEntity entity);

	void updateQuestionAnswerNum(QuestionEntity questionentity, String uid);

	boolean updateQuestionRecommend(QuestionEntity entity, String uid);

	void  doCleanWeekpv();

	Boolean updateQuestionTaggroup(QuestionEntity question, String qid);
	
}
