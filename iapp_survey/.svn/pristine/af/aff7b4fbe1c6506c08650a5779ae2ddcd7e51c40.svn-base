package com.longtime.app.remind.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.remind.model.RefreshRecode;
import com.longtime.app.remind.repository.RefreshRecodeRepository;
import com.longtime.app.remind.service.RefreshRecodeService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

@Service(value="refreshRecodeService")
public class RefreshRecodeServiceImpl extends AbstractService<RefreshRecode, String> implements RefreshRecodeService{
	@Resource(name="refreshRecodeRepository")
	private RefreshRecodeRepository refreshRecodeRepository;
	@Override
	public MongoRepository<RefreshRecode, String> getMongoRepository() {
		// TODO Auto-generated method stub
		return refreshRecodeRepository;
	}

}
