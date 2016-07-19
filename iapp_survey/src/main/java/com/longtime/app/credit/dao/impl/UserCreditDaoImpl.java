package com.longtime.app.credit.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserCreditVO;
import com.longtime.app.credit.dao.UserCreditDao;
import com.longtime.common.utils.Page;

@Repository("userCreditDao")
public class UserCreditDaoImpl implements UserCreditDao{

	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public long count(String searchContent, String domain) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) as total from iapp_base_user u left join user_credit_total t on u.id=t.uid ");
		sql.append(" where u.domain=? and u.isdel=? ");
		params.add(domain);
		params.add(User.ISDEL_NO);
		if(StringUtils.isNotBlank(searchContent)){
			sql.append(" and ( ");
			sql.append(" u.username like ? ");
			sql.append(" or u.name like ? ");
			sql.append(" or u.email like ? ");
			sql.append(" or u.mobile like ? ");
			sql.append(" ) ");
			String param = String.format("%%%s%%", searchContent);
			params.add(param);
			params.add(param);
			params.add(param);
			params.add(param);
		}
		
		List<Long> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new RowMapper<Long>(){

			@Override
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				long count = rs.getLong("total");
				return count;
			}
			
		});
		if(CollectionUtils.isEmpty(list)){
			return 0L;
		}
		return list.get(0);
	}

	@Override
	public List<UserCreditVO> list(Page page, String searchContent,
			String domain) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select u.id,u.name,u.username,u.email,u.mobile,u.avatar,u.organization_id,u.enable,u.status,t.credit,t.experience from iapp_base_user u left join user_credit_total t on u.id=t.uid ");
		sql.append(" where u.domain=? and u.isdel=? ");
		params.add(domain);
		params.add(User.ISDEL_NO);
		if(StringUtils.isNotBlank(searchContent)){
			sql.append(" and ( ");
			sql.append(" u.username like ? ");
			sql.append(" or u.name like ? ");
			sql.append(" or u.email like ? ");
			sql.append(" or u.mobile like ? ");
			sql.append(" ) ");
			String param = String.format("%%%s%%", searchContent);
			params.add(param);
			params.add(param);
			params.add(param);
			params.add(param);
		}
		
		sql.append(" order by t.credit desc ");
		sql.append("limit ?,? ");
		params.add(page.getStart());
		params.add(page.getPage_size());
		
		List<UserCreditVO> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new UserCreditVORowMapper());
		return list;
	}
	
	private class UserCreditVORowMapper implements RowMapper<UserCreditVO>{

		@Override
		public UserCreditVO mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			String id = rs.getString("id");
			String username = rs.getString("username");
			String name = rs.getString("name");
			String mobile = rs.getString("mobile");
			String email = rs.getString("email");
			String avatar = rs.getString("avatar");
			String oid = rs.getString("organization_id");
			int enable = rs.getInt("enable");
			
			UserCreditVO entity = new UserCreditVO();
			entity.setId(id);
			entity.setName(name);
			entity.setUsername(username);
			entity.setMobile(mobile);
			entity.setEmail(email);
			entity.setAvatar(avatar);
			entity.setEnable(enable);
			entity.setOid(oid);
			return entity;
		}
		
	}

}
