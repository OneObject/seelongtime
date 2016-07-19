package com.longtime.app.ixin.mgr.dao.impl;

import com.longtime.app.base.model.User;
import com.longtime.app.ixin.mgr.dao.IXinUserDao;
import com.longtime.app.ixin.mgr.model.IXinUser;
import com.longtime.app.ixin.mgr.utils.DBUtils;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("iXinUserDao")
public class IXinUserDaoImpl implements IXinUserDao{
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public IXinUser loadByOpenId(String openid) {
		String sql = "select * from ixin_user where openid=? ";
		
		Object[] params = new Object[]{openid};
		List<IXinUser> list = jdbcTemplate.query(sql, params, new IXinUserRowMapper());
		if(CollectionUtils.isNotEmpty(list)) {
			return list.get(0);
		}
		return null;
	}
	
	class IXinUserRowMapper implements RowMapper<IXinUser> {

		@Override
		public IXinUser mapRow(ResultSet rs, int rowNum) throws SQLException {
			IXinUser user = new IXinUser();
			user.setId(rs.getString("id"));
			user.setBase_id(rs.getString("base_id"));
			user.setOpenid(rs.getString("openid"));
			user.setD_openid(rs.getString("d_openid"));
			user.setUsername(rs.getString("username"));
			user.setMobile(rs.getString("mobile"));
			user.setName(rs.getString("name"));
			user.setCompany(rs.getString("company"));
			user.setNickname(rs.getString("nickname"));
			user.setSex(rs.getInt("sex"));
			user.setDomain(rs.getString("domain"));
			user.setHeadimgurl(rs.getString("headimgurl"));
			user.setUpdateTime(rs.getLong("updatetime"));
			return user;
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public void saveOrUpdate(IXinUser user) {
		try{
			Map<String,Object> map = DBUtils.getInsertSql(user, "ixin_user", null);
			String sql = map.get("sql").toString();
			List<Object> list = (List<Object>) map.get("insertVals");
			jdbcTemplate.update(sql,list.toArray());
		}catch(Exception e){
			Map<String,Object> map = DBUtils.getUpdateSql(user, "ixin_user", null, "id");
			String sql = map.get("sql").toString();
			List<Object> list = (List<Object>) map.get("updateVals");
			jdbcTemplate.update(sql,list.toArray());
		}
	}
	@Override
	public String getUidByOpenIdAndDomain(String openid,String domain){
		if(StringUtils.isBlank(openid) || StringUtils.isBlank(domain)){
			return StringUtils.EMPTY;
		}
		
		String sql = "select base_id from ixin_user where openid=? and domain=?";
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sql, openid , domain);
		
		if(null==list || list.isEmpty()){
			return StringUtils.EMPTY;
		}
		return (String)list.get(0).get("base_id");
	}
	
	@Override
	public IXinUser getIxinUserByBaseId(String baseid, String domain) {
		// TODO Auto-generated method stub
		if(StringUtils.isBlank(baseid) || StringUtils.isBlank(domain)){
			return null;
		}
		String sql = "select * from ixin_user where base_id=? and domain=?";
		List<IXinUser> list = jdbcTemplate.query(sql,new Object[]{baseid,domain}, new IXinUserRowMapper());
		if(CollectionUtils.isNotEmpty(list)) {
			return list.get(0);
		}
		return null;
	}
	@Override
	public int deleteByid(String id) {
		String sql="delete from ixin_user where id =?";
		return this.jdbcTemplate.update(sql,id);
	}
	@Override
	public User  getUserByDopenId(String d_openId,String domain){
		
		String sql = "select u.* from iapp_base_user u left join ixin_user iu on u.id=iu.base_id where iu.d_openid=? and iu.domain=?";
		
		List<User> list = jdbcTemplate.query(sql,new Object[]{d_openId,domain}, new UserRowMapper());
		if(CollectionUtils.isNotEmpty(list)) {
			return list.get(0);
		}
		return null;
	}
	
	class UserRowMapper implements RowMapper<User> {

		@Override
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setId(rs.getString("id"));
			user.setUsername(rs.getString("username"));
			user.setName(rs.getString("name"));
			user.setAvatar(rs.getString("avatar"));
			user.setNickName(rs.getString("nickname"));
			user.setUsertype(rs.getInt("usertype"));
			return user;
		}
		
	}
}
