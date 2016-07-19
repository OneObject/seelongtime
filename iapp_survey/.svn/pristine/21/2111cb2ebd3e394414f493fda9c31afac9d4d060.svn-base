package com.longtime.app.remind.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.remind.model.Remind;
import com.longtime.app.remind.repository.RemindRepository;
import com.longtime.app.remind.service.RemindService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

@Service(value="remindService")
public class RemindServiceImpl extends AbstractService<Remind, String> implements RemindService{

	@Resource(name="remindRepository")
	private RemindRepository remindRepository;
	@Override
	public MongoRepository<Remind, String> getMongoRepository() {
		return remindRepository;
	}
}
