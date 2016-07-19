package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.TagEntityDao;
import com.longtime.app.base.model.TagEntity;
import com.longtime.app.base.service.TagEntityService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="tagEntityService")
public class TagEntityServiceImpl  extends BaseService4HImpl<TagEntity,String> implements TagEntityService{

	@Resource
	private TagEntityDao tagEntityDao;
	
	
	@Override
	public BaseDAO<TagEntity, String> getDAO() {
		return tagEntityDao;
	}

}
