package com.longtime.app.base.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.DiyIndexDao;
import com.longtime.app.base.model.IndexEntity;
import com.longtime.app.base.service.DiyIndexService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="diyIndexService")
public class DiyIndexServiceImpl extends BaseService4HImpl<IndexEntity, String> implements DiyIndexService {
	
	@Resource
    private DiyIndexDao diyIndexDao;
    
	@Override
	public BaseDAO<IndexEntity, String> getDAO() {
		return diyIndexDao;
	}

}
