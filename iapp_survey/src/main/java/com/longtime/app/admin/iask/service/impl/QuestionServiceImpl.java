package com.longtime.app.admin.iask.service.impl;

import com.longtime.app.admin.iask.dao.QuestionDao;
import com.longtime.app.admin.iask.service.QuestionService;
import com.longtime.app.iask.model.QuestionEntity;
import com.longtime.app.iask.model.QuestionVO;
import com.longtime.common.utils.Page;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

@Service("baseQuestionService")
public class QuestionServiceImpl implements QuestionService{

	@Resource(name = "questionDao")
	private QuestionDao questionDao;
	
	@Override
	public long count(String searchContent, String domain) {
		return this.questionDao.count(searchContent,domain);
	}

	@Override
	public List<QuestionEntity> list(Page page, String searchContent,String domain) {
		return this.questionDao.list(page,searchContent,domain);
	}
	
	@Override
	public List<QuestionVO> listQuestions(Page page, String searchContent, String domain) {
		return this.questionDao.listQuestions(page,searchContent,domain);
	}

	@Override
	public void delById(String id) {
		this.questionDao.delById(id);
	}

	@Override
	public QuestionEntity getEntity(String id) {
		return this.questionDao.getEntity(id);
	}

	@Override
	public void delInviteById(String id) {
		this.questionDao.delInviteById(id);
		
	}

	@Override
	public void delAnswerById(String id) {
		this.questionDao.delAnswerById(id);
	}

	@Override
	public void delTagById(String id) {
		this.questionDao.delTagById(id);
	}

	@Override
	public boolean updateQuestionStatus(QuestionEntity entity) {
		return questionDao.updateQuestionStatus(entity);
	}

	@Override
	public void updateQuestionAnswerNum(QuestionEntity questionentity,String uid) {
		 questionDao.updateQuestionAnswerNum(questionentity,uid);
	}

	@Override
	public boolean updateQuestionRecommend(QuestionEntity entity,String uid) {
		return questionDao.updateQuestionRecommend(entity,uid);
	}

	@Override
	public void  doCleanWeekpv(){
		questionDao.doCleanWeekpv();
	}

	@Override
	public Boolean updateQuestionTaggroup(QuestionEntity question, String qid) {
		return questionDao.updateQuestionTaggroup(question,qid);
	}
	
	
	
}
