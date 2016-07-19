package com.longtime.app.ixin.mgr.dao;

import java.util.List;

import com.longtime.app.ixin.protocol.Rule;

public interface IXinRuleDao {
	
	public boolean add(Rule rule);
	
	public void updateBySid(String sid,String sKey);
	
	public void delBySid(String sid);

	public List<Rule> getAllRules();

	public Rule loadBySid(String sid);
	
	public Rule findBySkey(String skey,String domain);

	public List<Rule> getRule(String type, String domain);
	
	
}
