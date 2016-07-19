/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:57
 */
package com.longtime.app.iask.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.app.iask.repository.AnswerRepository;
import com.longtime.app.iask.service.AnswerService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
@Service("answerService")
public class AnswerServiceImpl extends AbstractService<AnswerEntity, String> implements AnswerService{

	@Resource(name = "answerRepository")
	private AnswerRepository answerRepository;
	
	@Override
	public MongoRepository<AnswerEntity, String> getMongoRepository() {
		return this.answerRepository;
	}

	@Override
	public void delByQid(String askid) {
		Query query = new Query();
		query.addCriteria(Criteria.where("question_id").is(askid));
		this.answerRepository.delete(query);
	}

	@Override
	public AnswerEntity findBestAnswer(String id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("question_id").is(id));
		query.addCriteria(Criteria.where("is_best_answer").is(true));
		List<AnswerEntity> list = this.answerRepository.find(query);
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<AnswerEntity> findMyAnswer(String uid) {
		Query query = new Query();
		query.addCriteria(Criteria.where("author_id").is(uid));
		return this.answerRepository.find(query);
	}

}
