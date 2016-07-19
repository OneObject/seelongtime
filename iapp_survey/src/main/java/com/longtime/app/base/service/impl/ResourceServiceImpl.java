package com.longtime.app.base.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.longtime.app.base.dao.ResourceDao;
import com.longtime.app.base.service.ResourceService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="resourceService")
public class ResourceServiceImpl extends BaseService4HImpl<com.longtime.app.base.model.ResourceEntity, String> implements ResourceService {
	
	@Resource
    private ResourceDao resourceDao;
    
	@Override
	public BaseDAO<com.longtime.app.base.model.ResourceEntity, String> getDAO() {
		return resourceDao;
	}

}
