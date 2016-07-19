package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.dao.MappingDao;
import com.longtime.app.ixin.mgr.model.MappingEntity;

@Repository("mappingDao")
public class MappingDaoImpl implements MappingDao{

	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public String getValueByKey(String key,String domain) {
		String sql = "select * from ixin_mapping where key=? and domain=? ";
		List<MappingEntity> list = jdbcTemplate.query(sql,new Object[]{key,domain}, new RowMapper<MappingEntity>(){
			public MappingEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				MappingEntity mapping = new MappingEntity();
				mapping.setId(rs.getString("id"));
				mapping.setEventKey(rs.getString("eventkey"));
				mapping.setSkey(rs.getString("skey"));
				mapping.setDomain(rs.getString("doamin"));
				return mapping;
			}
		});
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0).getSkey();
		}
		return null;
	}
}
