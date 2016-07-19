package com.longtime.app.base.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.GroupRuleConfigDao;
import com.longtime.app.base.model.BaseGroupRuleConfig;
import com.longtime.common.dao.BaseDAOImpl;

@Repository(value = "groupRuleConfigDao")
public class GroupRuleConfigDaoImpl extends
		BaseDAOImpl<BaseGroupRuleConfig, String> implements GroupRuleConfigDao {

	public List<BaseGroupRuleConfig> getListByDomain(String domain) {
		StringBuffer HQL = new StringBuffer(
				"select entity from BaseGroupRuleConfig entity where entity.domain=? or entity.domain=null");
		List<BaseGroupRuleConfig> list = this.list(HQL.toString(), domain);
		return list;
	}
}
