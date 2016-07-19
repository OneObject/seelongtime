package com.longtime.app.base.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.longtime.app.base.dao.AccountDao;
import com.longtime.app.base.model.Account;
import com.longtime.app.base.model.Account.Status;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("accountDao")
public class AccountDaoImpl extends  BaseDAOImpl<Account, Long> implements AccountDao{

	@Resource
	private NamedParameterJdbcTemplate jdbcTemplate;
	
	@Override
	public List<String> getRecentlyNoAccessUsers(int remaindperiod,
			String domain) {
		long lastLoginTime = System.currentTimeMillis()-remaindperiod*24*60*60*1000;
		
		String sql = "select distinct uid from base_account where domainid=:domain and status=:status and lastlogintime<:lastlogintime";
		Map<String, Object> paramMap = Maps.newHashMap();
		paramMap.put("domain", domain);
		paramMap.put("status", Status.normal.getCode());
		paramMap.put("lastlogintime", lastLoginTime);
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql, paramMap);
		List<String> uids = Lists.newArrayList();
		if(CollectionUtils.isEmpty(list)){
			return uids;
		}
		for(Map<String, Object> item : list){
			uids.add((String) item.get("uid"));
		}
		return uids;
	}
}
