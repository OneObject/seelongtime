package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.api.WeiXinAPIHelper.WXUserInfo;
import com.longtime.app.ixin.mgr.dao.WXUserDao;
import com.longtime.app.ixin.mgr.model.WXUser;

@Repository("wxUserDao")
public class WXUserDaoImpl implements WXUserDao{
	
	private static final Logger logger = LoggerFactory.getLogger(WXUserDaoImpl.class);

	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public WXUser loadById(String id) {
		String sql = "select * from wx_user where id=? ";
		
		List<WXUser> list = jdbcTemplate.query(sql,new Object[]{id}, new WXUserRowMapper());
		if(CollectionUtils.isNotEmpty(list)) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public void add(WXUserInfo wxUserInfo,String domain) {
		String sql = "insert into wx_user(id,nickname,sex,city,country,province,language,headimgurl,subscribe_time,domain) values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {wxUserInfo.getOpenid(),wxUserInfo.getNickname(),wxUserInfo.getSex(),wxUserInfo.getCity(),
				wxUserInfo.getCountry(),wxUserInfo.getProvince(),wxUserInfo.getLanguage(),wxUserInfo.getHeadimgurl(),
				wxUserInfo.getSubscribe_time(),domain};
		try {
			this.jdbcTemplate.update(sql, params);
		} catch (Exception e) {
			logger.debug("add WXUser fail!because: " + e);
		}
	}
	
	class WXUserRowMapper implements RowMapper<WXUser> {

		@Override
		public WXUser mapRow(ResultSet rs, int rowNum) throws SQLException {
			WXUser user = new WXUser();
			user.setId(rs.getString("id"));
			user.setNickname(rs.getString("nickname"));
			user.setSex(rs.getInt("sex"));
			user.setCity(rs.getString("city"));
			user.setCountry(rs.getString("country"));
			user.setProvince(rs.getString("province"));
			user.setLanguage(rs.getString("language"));
			user.setHeadimgurl(rs.getString("headimgurl"));
			user.setSubscribe_time(rs.getLong("subscribe_time"));
			user.setDomain(rs.getString("domain"));
			return user;
		}
		
	}

}
