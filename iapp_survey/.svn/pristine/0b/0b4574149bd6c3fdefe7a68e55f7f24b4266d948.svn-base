package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.TopicConfigDao;
import com.longtime.app.base.model.TopicConfig;
import com.longtime.app.base.service.TopicConfigService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("topicConfigService")
public class TopicConfigServiceImpl extends BaseService4HImpl<TopicConfig,String> implements TopicConfigService {

	
	@Resource
	private TopicConfigDao topicConfigDao;
	
	@Override
	public BaseDAO<TopicConfig, String> getDAO() {
		return this.topicConfigDao;
	}

}
