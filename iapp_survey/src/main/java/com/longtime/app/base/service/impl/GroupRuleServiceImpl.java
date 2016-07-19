package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.GroupRuleDao;
import com.longtime.app.base.model.BaseGroupRule;
import com.longtime.app.base.service.GroupRuleService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service
public class GroupRuleServiceImpl extends BaseService4HImpl<BaseGroupRule,String> implements GroupRuleService {
    
	@Resource
	private GroupRuleDao groupRuleDao;
	
	@Override
	public BaseDAO<BaseGroupRule, String> getDAO() {
		return this.groupRuleDao;
	}

}
