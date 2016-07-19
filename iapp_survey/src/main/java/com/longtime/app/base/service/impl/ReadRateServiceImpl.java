package com.longtime.app.base.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.ReadRateDao;
import com.longtime.app.base.model.ReadRate;
import com.longtime.app.base.service.ReadRateService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service
public class ReadRateServiceImpl extends BaseService4HImpl<ReadRate, String> implements ReadRateService {
	
	@Resource
    private ReadRateDao readRateDao;
    
	@Override
	public BaseDAO<ReadRate, String> getDAO() {
		return readRateDao;
	}

}
