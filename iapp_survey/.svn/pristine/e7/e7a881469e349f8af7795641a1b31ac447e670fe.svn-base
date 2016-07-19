package com.longtime.app.admin.iask.dao;

import java.util.List;

import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.common.utils.Page;

public interface AnswerDao {
	long count(String searchContent,String id);

	List<AnswerEntity> list(Page page, String searchContent,String id);

	void delById(String id);
	
	AnswerEntity getEntity(String id);
	
	void updateAnswerEntity(AnswerEntity answerEntity);

	List<AnswerEntity> listAnswerByQuestionId(String id);

	List<AnswerEntity> list(String id);

	boolean updateAnswerEntityStatus(AnswerEntity answerEntity, String uid);
	
	
}
