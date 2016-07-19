package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.LabelEntityDao;
import com.longtime.app.base.model.LabelEntity;
import com.longtime.app.base.model.LabelRelationEntity;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.LabelEntityService;
import com.longtime.app.base.service.LabelRelationEntityService;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="labelEntityService")
public class LabelEntityServiceImpl  extends BaseService4HImpl<LabelEntity,String> implements LabelEntityService{

	private static final Logger logger = LoggerFactory.getLogger(LabelEntityServiceImpl.class);
	
	@Resource(name = "labelEntityDao")
	private LabelEntityDao labelEntityDao;
	
	@Resource(name = "labelRelationEntityService")
	private LabelRelationEntityService labelRelationEntityService;
	
	@Override
	public BaseDAO<LabelEntity, String> getDAO() {
		return labelEntityDao;
	}
	
	@Override
	public void doAdd(String labels,String rid,int rtype, User user) {
		
		labelRelationEntityService.delteByRidAndDomain(rid,user.getDomain());
		if(StringUtils.isBlank(labels)){
			return;
		}
		labels = labels.replace("，", ",");
		String procssedLabels = labels;
		String domain = user.getDomain();
					
		try {
			String[] labelArr = procssedLabels.split(",");
			for (String label : labelArr) {
				if(StringUtils.isBlank(label)){
					continue;
				}
				label = StringUtils.trim(label);
				
				LabelRelationEntity relationEntity = new LabelRelationEntity();
				relationEntity.setId(IdGenerator.nextId32().toString());
				relationEntity.setLabel(label);;
				relationEntity.setRid(rid);
				relationEntity.setRtype(rtype);
				relationEntity.setDomain(domain);
				relationEntity.setCreator(user.getId());
				labelRelationEntityService.insert(relationEntity);
				
				LabelEntity labelEntity = labelEntityDao.getByTitle(label,domain);
				if(labelEntity != null){
					continue;
				}
				
				labelEntity = new LabelEntity();
				labelEntity.setId(IdGenerator.nextId32().toString());
				labelEntity.setTitle(label);
				labelEntity.setDomain(domain);
				labelEntity.setCreator(user.getId());
				labelEntityDao.insert(labelEntity);
			}
		} catch (Exception e) {
			logger.error("insert label due to error.",e);
		}
		
	}

}
