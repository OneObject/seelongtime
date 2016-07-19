/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:57
 */
package com.longtime.app.iask.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.iask.model.QuestionEntity;
import com.longtime.app.iask.repository.QuestionRepository;
import com.longtime.app.iask.service.QuestionService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
@Service("iaskQuestionService")
public class QuestionServiceImpl extends AbstractService<QuestionEntity, String> implements QuestionService{

	@Resource(name = "iaskQuestionRepository")
	private QuestionRepository questionRepository;

	@Override
	public MongoRepository<QuestionEntity, String> getMongoRepository() {
		return this.questionRepository;
	}
	

}
