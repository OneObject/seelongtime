package com.longtime.app.admin.iask.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.admin.iask.dao.AnswerDao;
import com.longtime.app.admin.iask.service.AnswerService;
import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.common.utils.Page;

@Service("baseAnswerService")
public class AnswerServiceImpl implements AnswerService {
   @Resource
   private AnswerDao answerDao;
	
	
	
	@Override
	public long count(String searchContent,String id) {
		return this.answerDao.count(searchContent,id);
	}

	@Override
	public List<AnswerEntity> list(Page page, String searchContent,String id) {
		return this.answerDao.list(page, searchContent,id);
	}

	@Override
	public void delById(String id) {
         this.answerDao.delById(id);		
	}

	@Override
	public AnswerEntity getEntity(String id) {
		return this.answerDao.getEntity(id);
	}

	@Override
	public void updateAnswerEntity(AnswerEntity answerEntity) {
       this.answerDao.updateAnswerEntity(answerEntity);		
	}

	@Override
	public List<AnswerEntity> list(String id) {
		return answerDao.list(id);
	}

	@Override
	public boolean updateAnswerEntityStatus(AnswerEntity answerEntity,String uid) {
		return answerDao.updateAnswerEntityStatus(answerEntity,uid);
	}



}
