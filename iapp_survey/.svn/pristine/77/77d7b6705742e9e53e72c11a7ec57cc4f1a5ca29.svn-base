package com.longtime.app.ixin.mgr.service;

import java.util.List;
import java.util.Map;

import com.longtime.app.ixin.protocol.Rule;

public interface IXinRuleService {
	
	public Map<String,Rule> getDomainRules(String domain);
	
	public boolean add(Rule rule);
	
	public boolean addOrUpdate(Rule rule);
	
	public void delBySid(String sid);

	public Map<String, Rule> getCommonRules();
	
	public Rule findBySkey(String skey,String domain);
	
	public List<String> findAllSkey(String domain);
	
	
}
