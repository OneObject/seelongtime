package com.longtime.app.base.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.LabelEntityDao;
import com.longtime.app.base.model.LabelEntity;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("labelEntityDao")
public class LabelEntityDaoImpl extends BaseDAOImpl<LabelEntity,String> implements LabelEntityDao{

	@Override
	public LabelEntity getByTitle(String title, String domain) {
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("title", title);
		params.put("domain", domain);
		List<LabelEntity> list = list(params);
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
	}
	
}
