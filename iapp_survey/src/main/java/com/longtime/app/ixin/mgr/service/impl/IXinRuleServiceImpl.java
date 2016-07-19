package com.longtime.app.ixin.mgr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.dao.IXinRuleDao;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.protocol.Rule;
import com.telecom.ctu.platform.common.cache.CacheService;

@Service("iXinRuleService")
public class IXinRuleServiceImpl implements IXinRuleService{
	
	@Resource(name = "iXinRuleDao")
	private IXinRuleDao iXinRuleDao;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	private final static String COMMON_RULE_KEY = "r_c";
	
	private final static String DOMAIN_RULE_KEY = "r_d";
	
	private static int EXPIRE_SECONDS = 24*60*60*1000;
	
	@Override
	public Map<String, Rule> getCommonRules() {
		Map<String, Rule> commonRuleMap = getCacheRule(COMMON_RULE_KEY);
		if(commonRuleMap == null){
			commonRuleMap = getRuleMap(Rule.COMMON_RULE);
			cacheService.put(COMMON_RULE_KEY, EXPIRE_SECONDS, commonRuleMap);
		}
		return commonRuleMap;
	}
	
	@Override
	public Map<String, Rule> getDomainRules(String domain) {
		String domainKey = String.format("%s_%s", DOMAIN_RULE_KEY,domain);
		Map<String, Rule> domainRuleMap = getCacheRule(domainKey);
		if(domainRuleMap == null){
			domainRuleMap = getRuleMap(Rule.DOMAIN_RULE,domain);
			cacheService.put(domainKey, EXPIRE_SECONDS, domainRuleMap);
		}
		return domainRuleMap;
	}
	
	private Map<String,Rule> getCacheRule(String key){
		Map<String, Map<String, Object>> map = cacheService.get(key);
		if(map == null){
			return null;
		}
		
		Map<String,Rule> ruleMap = new HashMap<String,Rule>();
		for(Entry<String, Map<String, Object>> entry : map.entrySet()){
			Map<String, Object> values = entry.getValue();
			String id =(String) values.get("id");
			String skey = (String) values.get("sKey");
			String sid = (String) values.get("sid");
			String handlerKey = (String) values.get("handlerKey");
			String domain = (String) values.get("domain");
			String type =	 (String) values.get("type");
			
			Rule rule = new Rule();
			rule.setId(id);
			rule.setSid(sid);
			rule.setsKey(skey);
			rule.setHandlerKey(handlerKey);
			rule.setDomain(domain);
			rule.setType(type);
			ruleMap.put(entry.getKey(), rule);
		}
		return ruleMap;
	}
	
	
	private Map<String, Rule> getRuleMap(String type) {
		return getRuleMap(type, "");
	}
	
	private Map<String, Rule> getRuleMap(String type,String domain) {
		List<Rule> rules = iXinRuleDao.getRule(type,domain);
		if(CollectionUtils.isEmpty(rules)){
			return new HashMap<String, Rule>();
		}
		
		Map<String, Rule> ruleMap = new HashMap<String,Rule>();
		
		for(Rule rule : rules){
			ruleMap.put(rule.getsKey(), rule);
		}
		return ruleMap;
	}
	
	@Override
	public boolean addOrUpdate(Rule rule) {
		if(rule == null || StringUtils.isBlank(rule.getsKey())){
			return false;
		}
		
		Rule r = this.iXinRuleDao.loadBySid(rule.getSid());
		if(r == null){
			boolean result = this.iXinRuleDao.add(rule);
			String domainKey = String.format("%s_%s", DOMAIN_RULE_KEY,rule.getDomain());
			cacheService.remove(domainKey);
			return result;
		}
		if(!rule.getsKey().equalsIgnoreCase(r.getsKey())){
			iXinRuleDao.updateBySid(rule.getSid(), rule.getsKey());
		}
		String domainKey = String.format("%s_%s", DOMAIN_RULE_KEY,rule.getDomain());
		cacheService.remove(domainKey);
		return true;
	}
	
	@Override
	public boolean add(Rule rule) {
		boolean rs = this.iXinRuleDao.add(rule);
		String domainKey = String.format("%s_%s", DOMAIN_RULE_KEY,rule.getDomain());
		cacheService.remove(domainKey);
		return rs;
	}

	@Override
	public void delBySid(String sid) {
		Rule rule = iXinRuleDao.loadBySid(sid);
		if(rule == null){
			return;
		}
		String domainKey = String.format("%s_%s", DOMAIN_RULE_KEY,rule.getDomain());
		cacheService.remove(domainKey);
		
		this.iXinRuleDao.delBySid(sid);
	}
	
	@Override
	public Rule findBySkey(String skey,String domain) {
		return this.iXinRuleDao.findBySkey(skey,domain);
		
	}
	
	@Override
	public List<String> findAllSkey(String domain) {
		List<String> list = new ArrayList<String>();

		Map<String, Rule> map = getDomainRules(domain);
		if(map == null || map.isEmpty()){
			return Lists.newArrayList();
		}
		for (Entry<String, Rule> entry : map.entrySet()) {
			list.add(entry.getKey());
		}
		return list;
	}
	
}
