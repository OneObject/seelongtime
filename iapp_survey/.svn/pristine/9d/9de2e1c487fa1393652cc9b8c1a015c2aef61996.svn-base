package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.dao.ITokenDao;
import com.longtime.app.ixin.mgr.model.TokenInfo;

@Repository("tokenDao")
public class TokenDaoImpl implements ITokenDao {

	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public TokenInfo getTokenInfoByDomainToken(String domain_token) {
		String sql = "select id, token, domain_token, domain, is_enabled,appid,appsecret,name,pass ,authentication, account_type,aeskey,agentid,oauth from ixin_token where domain_token=?";
		Object[] params = new Object[] { domain_token };
		List<TokenInfo> tokens = jdbcTemplate.query(sql, params,
				new TenementRowMapper());
		if (tokens != null && !tokens.isEmpty()) {
			return tokens.get(0);
		}
		return null;
	}

	@Override
	public TokenInfo queryByDomain(String domain) {
		String sql = "select id, token, domain_token, domain, is_enabled,appid,appsecret ,name,pass, authentication, account_type,aeskey,agentid,oauth from ixin_token where domain=?";
		Object[] params = new Object[] { domain };
		List<TokenInfo> tokens = jdbcTemplate.query(sql, params,
				new TenementRowMapper());
		if (tokens != null && !tokens.isEmpty()) {
			return tokens.get(0);
		}
		return null;
	}

	@Override
	public void insert(TokenInfo tokenInfo) {
		String sql = "insert into ixin_token(id, token, domain_token, domain, is_enabled, aeskey) value(?,?,?,?,?,?)";
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		Object[] params = new Object[] { id, tokenInfo.getToken(),
				tokenInfo.getDomain_token(), tokenInfo.getDomain(),
				tokenInfo.getIsEnabled(), tokenInfo.getAeskey() };
		jdbcTemplate.update(sql, params);
	}

	class TenementRowMapper implements RowMapper<TokenInfo> {

		@Override
		public TokenInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
			TokenInfo tokenInfo = new TokenInfo();
			tokenInfo.setId(rs.getString("id"));
			tokenInfo.setToken(rs.getString("token"));
			tokenInfo.setDomain_token(rs.getString("domain_token"));
			tokenInfo.setDomain(rs.getString("domain"));
			tokenInfo.setIsEnabled(rs.getInt("is_enabled"));
			tokenInfo.setAppId(rs.getString("appid"));
			tokenInfo.setAppSecret(rs.getString("appsecret"));
			tokenInfo.setName(rs.getString("name"));
			tokenInfo.setPass(rs.getString("pass"));
			tokenInfo.setType(rs.getString("account_type"));
			tokenInfo.setAuthentication(rs.getString("authentication"));
			tokenInfo.setAeskey(rs.getString("aeskey"));
			tokenInfo.setAgentid(rs.getString("agentid"));
			tokenInfo.setOauth(rs.getBoolean("oauth"));
			return tokenInfo;
		}

	}

	@Override
	public void updateTokenInfoByDomain(String appId, String appSecret,
			String domain) {
		String sql = "update ixin_token set appid=?,appsecret=? where domain=?";
		jdbcTemplate.update(sql, appId, appSecret, domain);
	}

	@Override
	public TokenInfo getTokenInfoByDomain(String domain) {
		String sql = "select id, token, domain_token, domain, isEnabled,appid,appsecret ,name, pass,authentication,account_type,aeskey,agentid,oauth from ixin_token where domain=?";
		Object[] params = new Object[] { domain };
		List<TokenInfo> tokens = jdbcTemplate.query(sql, params,
				new TenementRowMapper());
		if (tokens != null && !tokens.isEmpty()) {
			return tokens.get(0);
		}
		return null;
	}

	@Override
	public void updateTokenInfo(String name, String pass, String type,
			String authentication, String domain) {
		String sql = "update ixin_token set name=?,pass=?, account_type=?,authentication=? where domain=? ";
		jdbcTemplate.update(sql, name, pass, type, authentication, domain);
	}

	@Override
	public void updateTokenInfo(String username, String password, String domain) {
		String sql = "update ixin_token set name=?,pass=? where domain=? ";
		jdbcTemplate.update(sql, username, password, domain);
	}

	@Override
	public List<TokenInfo> getAll() { 
		String sql = "select id, token, domain_token, domain, is_enabled,appid,appsecret ,name, pass,authentication,account_type ,aeskey,agentid,oauth from ixin_token";
		Object[] params = new Object[] { };
		List<TokenInfo> tokens = jdbcTemplate.query(sql, params,
				new TenementRowMapper());
		
		return tokens;
	}

	@Override
	public List<TokenInfo> getTokenInfoByType(String type) {
		String sql = "select id, token, domain_token, domain, is_enabled,appid,appsecret,name,pass ,authentication, account_type,aeskey,agentid,oauth from ixin_token where account_type=?";
		Object[] params = new Object[] { type };
		List<TokenInfo> tokens = jdbcTemplate.query(sql, params,
				new TenementRowMapper());
		return tokens;
	}
	
	@Override
	public boolean updateTokenInfo(String encodename, String encodepassword, String type, String authentication,
			String appId, String appSecret, String agentid, boolean oauth, String domain) {
		String sql = "update ixin_token set name=?,pass=?, account_type=?,authentication=?, appid=?, appsecret=?, agentid=?, oauth=? where domain=? ";
		int rows = jdbcTemplate.update(sql, encodename, encodepassword, type, authentication, appId, appSecret, agentid, oauth, domain);
		return rows == 1;
	}
	@Override
	public boolean updateTokenInfo(String encodename, String encodepassword, String type, String authentication,
			String appId, String appSecret, String agentid, boolean oauth, String domain,String AESkey) {
		String sql = "update ixin_token set name=?,pass=?, account_type=?,authentication=?, appid=?, appsecret=?, agentid=?, oauth=?, aeskey=? where domain=? ";
		int rows = jdbcTemplate.update(sql, encodename, encodepassword, type, authentication, appId, appSecret, agentid, oauth,AESkey, domain);
		return rows == 1;
	}
}
