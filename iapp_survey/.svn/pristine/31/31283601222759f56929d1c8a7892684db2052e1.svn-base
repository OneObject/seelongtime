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

import com.longtime.app.iask.model.ReviewEntity;
import com.longtime.app.iask.repository.ReviewRepository;
import com.longtime.app.iask.service.ReviewService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
@Service("iaskReviewService")
public class ReviewServiceImpl extends AbstractService<ReviewEntity, String> implements ReviewService{
	
	@Resource(name = "iaskReviewRepository")
	private ReviewRepository reviewRepository;
	
	@Override
	public MongoRepository<ReviewEntity, String> getMongoRepository() {
		return this.reviewRepository;
	}

	@Override
	public ReviewEntity findByUidAndSid(String uid, String answerid) {
		Query query = new Query();
		query.addCriteria(Criteria.where("uid").is(uid));
		query.addCriteria(Criteria.where("sid").is(answerid));
		List<ReviewEntity> list = this.reviewRepository.find(query);
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<ReviewEntity> findByUidAndSids(String uid, List<String> answerids) {
		Query query = new Query();
		query.addCriteria(Criteria.where("uid").is(uid));
		query.addCriteria(Criteria.where("sid").in(answerids));
		return this.reviewRepository.find(query);
	}
}
