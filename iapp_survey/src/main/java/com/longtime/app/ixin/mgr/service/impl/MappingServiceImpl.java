package com.longtime.app.ixin.mgr.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.dao.MappingDao;
import com.longtime.app.ixin.mgr.service.MappingService;

@Service("mappingService")
public class MappingServiceImpl implements MappingService{

	@Resource(name = "mappingDao")
	private MappingDao mappingDao;
	
	@Override
	public String getValueBykey(String key,String domain) {
		return this.mappingDao.getValueByKey(key,domain);
	}

}
