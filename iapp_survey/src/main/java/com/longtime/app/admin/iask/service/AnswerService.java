package com.longtime.app.admin.iask.service;

import java.util.List;

import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.common.utils.Page;

public interface AnswerService {
	long count(String searchContent,String id);

	List<AnswerEntity> list(Page page, String searchContent,String id);

	void delById(String id);
	
	AnswerEntity getEntity(String id);
	
	void updateAnswerEntity(AnswerEntity answerEntity);

	List<AnswerEntity> list(String id);

	boolean updateAnswerEntityStatus(AnswerEntity answerEntity, String uid);
	
}
