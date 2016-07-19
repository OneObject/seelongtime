package com.longtime.app.base.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;
import com.longtime.app.base.dao.PraiseDao;
import com.longtime.app.base.model.Praise;
import com.longtime.app.base.service.PraiseService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="praiseService")
public class PraiseServiceImpl extends BaseService4HImpl<Praise, String> implements PraiseService{

	
	
	@Resource
	private PraiseDao praiseDao;
	
	@Override
	public BaseDAO<Praise, String> getDAO() {
		return praiseDao;
	}

	@Override
	public int countByResid(String resid, int restype) {
		Map<String,Object> param = Maps.newHashMap();
		param.put("resid", resid);
		param.put("restype",restype);
		param.put("type",0);//表示赞类型
		List<Praise> list = praiseDao.list(param);
		if (CollectionUtils.isNotEmpty(list)) {
			return (int) list.get(0).getTotal();
		}
		return 0;
	}

}
