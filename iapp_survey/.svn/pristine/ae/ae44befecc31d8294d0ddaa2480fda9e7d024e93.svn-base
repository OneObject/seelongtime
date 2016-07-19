package com.longtime.app.base.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.GroupRuleConfigDao;
import com.longtime.app.base.model.BaseGroupRuleConfig;
import com.longtime.app.base.service.GroupRuleConfigService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
@Service(value="groupRuleConfigService")
public class GroupRuleConfigServiceImpl extends BaseService4HImpl<BaseGroupRuleConfig,String> implements GroupRuleConfigService{
   
	@Resource
	private GroupRuleConfigDao groupRuleConfigDao;
	
	@Override
	public BaseDAO<BaseGroupRuleConfig, String> getDAO() {
		return this.groupRuleConfigDao;
	}

	@Override
	public List<BaseGroupRuleConfig> getListByDomain(String domain) {
		return this.groupRuleConfigDao.getListByDomain(domain);
	}

}
