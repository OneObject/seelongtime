package com.longtime.app.cache.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.cache.model.RemoveQueueModel;
import com.longtime.app.cache.repository.RemoveQueueRepository;
import com.longtime.app.cache.service.RemoveQueueService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

@Service("removeQueueService")
public class RemoveQueueServiceImpl extends AbstractService<RemoveQueueModel, String> implements RemoveQueueService{
	
	@Resource(name = "removeQueueRepository")
	private RemoveQueueRepository removeQueueRepository;
	

	@Override
	public MongoRepository<RemoveQueueModel, String> getMongoRepository() {
		return removeQueueRepository;
	}

}
