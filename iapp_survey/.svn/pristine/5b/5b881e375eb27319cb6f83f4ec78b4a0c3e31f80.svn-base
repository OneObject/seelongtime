package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.LabelRelationEntityDao;
import com.longtime.app.base.model.LabelRelationEntity;
import com.longtime.app.base.service.LabelRelationEntityService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="labelRelationEntityService")
public class LabelRelationEntityServiceImpl  extends BaseService4HImpl<LabelRelationEntity,String> implements LabelRelationEntityService{

	@Resource(name = "labelRelationEntityDao")
	private LabelRelationEntityDao labelRelationEntityDao;
	
	@Override
	public BaseDAO<LabelRelationEntity, String> getDAO() {
		return labelRelationEntityDao;
	}
	
	@Override
	public void delteByRidAndDomain(String rid, String domain) {
		String hql = "delete from LabelRelationEntity where rid=? and domain=?";
		labelRelationEntityDao.execute(hql, rid,domain);
	}
}
