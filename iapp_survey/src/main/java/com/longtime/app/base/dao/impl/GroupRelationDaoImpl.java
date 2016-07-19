package com.longtime.app.base.dao.impl;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.GroupRelationDao;
import com.longtime.app.base.model.BaseGroupRelation;
import com.longtime.common.dao.BaseDAOImpl;

@Repository
public class GroupRelationDaoImpl extends BaseDAOImpl<BaseGroupRelation,String> implements GroupRelationDao {
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public void deleteByGid(String gid) {
		String sql = String.format("delete from iapp_group_relation where gid='%s'", gid);
		this.jdbcTemplate.execute(sql);
	}

	@Override
	public void deleteByGidAndType(String gid, int type) {
		String sql = String.format("delete from iapp_group_relation where gid='%s' and type=%d", gid,type);
		this.jdbcTemplate.execute(sql);
	}
}
