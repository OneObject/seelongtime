package com.longtime.app.base.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.DiyIndexModuleDao;
import com.longtime.app.base.model.IndexModuleEntity;
import com.longtime.app.base.service.DiyIndexModuleService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="diyIndexModuleService")
public class DiyIndexModuleServiceImpl extends BaseService4HImpl<IndexModuleEntity, String> implements DiyIndexModuleService {
	
	@Resource
    private DiyIndexModuleDao diyIndexModuleDao;
    
	@Override
	public BaseDAO<IndexModuleEntity, String> getDAO() {
		return diyIndexModuleDao;
	}

	@Override
	public void deleteByIndexId(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("indexid", id);
		List<IndexModuleEntity> lists = this.diyIndexModuleDao.list(params);
		for (IndexModuleEntity indexModuleEntity : lists) {
			this.diyIndexModuleDao.delete(indexModuleEntity);
		}
	}

}
