/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:57
 */
package com.longtime.app.iask.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.iask.model.CommentEntity;
import com.longtime.app.iask.repository.IAskCommentRepository;
import com.longtime.app.iask.service.IAskCommentService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
@Service("iAskCommentService")
public class IAskCommentServiceImpl extends AbstractService<CommentEntity, String> implements IAskCommentService{

	@Resource(name = "iAskCommentRepository")
	private IAskCommentRepository iAskCommentRepository;

	@Override
	public MongoRepository<CommentEntity, String> getMongoRepository() {
		return this.iAskCommentRepository;
	}
	

}
