package com.longtime.app.base.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.AclResourceDao;
import com.longtime.app.base.model.AclResource;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("aclResourceDao")
public class AclResourceDaoImpl extends  BaseDAOImpl<AclResource, Long> implements AclResourceDao{
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<AclResource> listByUid(String uid) {
		
		String sql = "select DISTINCT resource.* from acl_role_user aru INNER JOIN acl_role ar on aru.roleid = ar.id INNER JOIN acl_role_resource arr on arr.roleid = ar.id INNER JOIN acl_resource resource on arr.resourceid = resource.id where aru.uid=? ";
		
		List<AclResource> list = this.jdbcTemplate.query(sql, new Object[]{uid},new RowMapper<AclResource>() {
			@Override
			public AclResource mapRow(ResultSet rs, int rowNum) throws SQLException {
				AclResource ar = new AclResource();
				ar.setId(rs.getLong("id"));
				ar.setIsopen(rs.getInt("isopen"));
				ar.setName(rs.getString("name"));
				ar.setType(rs.getInt("type"));
				ar.setUrls(rs.getString("urls"));
				ar.setWeight(rs.getInt("weight"));
				return ar;
			}
		});
		
		return list;
		
		
	}

}
