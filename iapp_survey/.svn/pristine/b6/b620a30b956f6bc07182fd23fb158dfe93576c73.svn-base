package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.dao.IXinRuleDao;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.app.util.IdGenerator;

@Repository("iXinRuleDao")
public class IXinRuleDaoImpl implements IXinRuleDao{
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	private static Logger logger = LoggerFactory.getLogger(IXinRuleDaoImpl.class);

	@Override
	public boolean add(Rule rule) {
		String sql = "insert into ixin_rule(id, skey,sid,handlerkey,domain,type) value(?,?,?,?,?,?)";
		Object[] params = new Object[]{IdGenerator.nextId32().toString(), rule.getsKey(),rule.getSid(),rule.getHandlerKey(),rule.getDomain(),rule.getType()};
		try {
			jdbcTemplate.update(sql, params);
			return true;
		} catch(DataAccessException ex) {
			logger.debug("add rule fail!because: " + ex);
			ex.printStackTrace();
			return false;
		}
		
	}
	
	@Override
	public Rule loadBySid(String sid) {
		String sql = "select * from ixin_rule where sid=?";
		List<Rule> list = jdbcTemplate.query(sql,new Object[]{sid}, new RowMapper<Rule>(){
			public Rule mapRow(ResultSet rs, int rowNum) throws SQLException {
				Rule rule = new Rule();
				rule.setId(rs.getString("id"));
				rule.setSid(rs.getString("sid"));
				rule.setsKey(rs.getString("skey"));
				rule.setDomain(rs.getString("domain"));
				rule.setHandlerKey(rs.getString("handlerkey"));
				rule.setType(rs.getString("type"));
				return rule;
			}
		});
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void updateBySid(String sid, String sKey) {
		if(StringUtils.isNotBlank(sid) && StringUtils.isNotBlank(sKey)){
			String sql = "update ixin_rule set skey=? where sid=?";
			jdbcTemplate.update(sql,sKey,sid);
		}
	}

	@Override
	public void delBySid(String sid) {
		String sql = "delete from ixin_rule where sid=?";
		jdbcTemplate.update(sql,sid);		
	}
	
	@Override
	public Rule findBySkey(String skey,String domain) {
		String sql = "select * from ixin_rule where skey=? and ((domain=? and type='2') or type='1');";
		List<Rule> rules = 
				jdbcTemplate.query(sql, new Object[]{skey,domain} , new RowMapper<Rule>(){
					public Rule mapRow(ResultSet rs, int rowNum) throws SQLException {
						Rule rule = new Rule();
						rule.setId(rs.getString("id"));
						rule.setSid(rs.getString("sid"));
						rule.setsKey(rs.getString("skey"));
						rule.setDomain(rs.getString("domain"));
						rule.setHandlerKey(rs.getString("handlerkey"));
						rule.setType(rs.getString("type"));
						return rule;
			}
		});
		if (rules.size()==0) {
			return null;
		}
		return rules.get(0);	
		
	}
	
	
	@Override
	public List<Rule> getAllRules() {
		String sql = "select * from ixin_rule";
		return jdbcTemplate.query(sql, new RowMapper<Rule>(){
			public Rule mapRow(ResultSet rs, int rowNum) throws SQLException {
				Rule rule = new Rule();
				rule.setId(rs.getString("id"));
				rule.setSid(rs.getString("sid"));
				rule.setsKey(rs.getString("skey"));
				rule.setDomain(rs.getString("domain"));
				rule.setHandlerKey(rs.getString("handlerkey"));
				rule.setType(rs.getString("type"));
				return rule;
			}
		});
	}

	@Override
	public List<Rule> getRule(String type, String domain) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from ixin_rule where type=? ");
		Object[] params;
		if(Rule.DOMAIN_RULE.equals(type)){
			sql.append(" and domain=?");
			params = new Object[]{type,domain};
		} else {
			params = new Object[]{type};
		}
		return jdbcTemplate.query(sql.toString(),params, new RowMapper<Rule>(){
			public Rule mapRow(ResultSet rs, int rowNum) throws SQLException {
				Rule rule = new Rule();
				rule.setId(rs.getString("id"));
				rule.setSid(rs.getString("sid"));
				rule.setsKey(rs.getString("skey"));
				rule.setDomain(rs.getString("domain"));
				rule.setHandlerKey(rs.getString("handlerkey"));
				rule.setType(rs.getString("type"));
				return rule;
			}
		});
	}

	

}
