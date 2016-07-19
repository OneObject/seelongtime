package com.longtime.app.ixin.mgr.dao.impl;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.dao.IActivityItemDao;
import com.longtime.app.ixin.mgr.model.ActivityItem;
import com.longtime.app.ixin.mgr.model.ActivityItem.Restype;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("activityItemDao")
public class ActivityItemDaoImpl implements IActivityItemDao {

	private static final Logger logger = LoggerFactory.getLogger(ActivityItemDaoImpl.class);
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	private static String insert_sql = "insert into ixin_activity_item(aid,restype,resid,resname,creator,createtime) value (?,?,?,?,?,?)";
	@Override
	public void insert(ActivityItem item){
		
		Object[] params = new Object[]{item.getAid(),item.getRestype(),item.getResid(),item.getResname(),item.getCreator(),item.getCreatetime()};
		try {
			jdbcTemplate.update(insert_sql, params);
		} catch(DataAccessException e) {
			logger.error(String.format("add activiyitem due to fail. item=[%s]", item), e);
		}
	}
	
	private static String delete_sql = "delete from ixin_activity_item where id=?";
	@Override
	public void delete(long id){
		jdbcTemplate.update(delete_sql, id);
	}
	
	private static String delete_byaid_sql = "delete from ixin_activity_item where aid=?";
	@Override
	public void deleteByAid(String aid){
		jdbcTemplate.update(delete_byaid_sql, aid);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public 	List<ActivityItem>  list(String aid,Restype type){
		if(StringUtils.isBlank(aid) || null==type){
			return Collections.EMPTY_LIST;
		}
		String sql = "select * from ixin_activity_item where aid=? and restype=? ";
		Object[] params = new Object[]{aid,type.code};
		List<ActivityItem> list = jdbcTemplate.query(sql, params, new ActivityItemRowMapper());
		return list;
	}
	
	@Override
	public 	ResultSet<ActivityItem>  list(String aid,Restype type ,Page page){
		
		if(null==page){
			page = new Page();
		}
		String sql = "select * from ixin_activity_item where aid=? and restype=?  limit ?, ?";
		Object[] params = new Object[]{aid,type.code, page.getStart(), page.getPage_size()};
		List<ActivityItem> list = jdbcTemplate.query(sql, params, new ActivityItemRowMapper());


		String sql_count =  "select count(id) from ixin_activity_item where aid=? and restype=? "; 
		params = new Object[]{aid,type.code};
		Long count = jdbcTemplate.queryForLong(sql_count, params);
		page.setTotal_size(count.intValue());
		ResultSet<ActivityItem> rs = new ResultSet<ActivityItem>();
		
		rs.setItems(list);
		rs.setPage(page);
		
		return rs;
		
	}
	
	
	class ActivityItemRowMapper implements RowMapper<ActivityItem> {

		@Override
		public ActivityItem mapRow(java.sql.ResultSet rs, int rowNum) throws SQLException {
			ActivityItem  item = new ActivityItem();
			item.setId(rs.getLong("id"));
			item.setAid(rs.getString("aid"));
			item.setResname(rs.getString("resname"));
			item.setRestype(rs.getInt("restype"));
			item.setResid(rs.getString("resid"));
			item.setCreator(rs.getString("creator"));
			item.setCreatetime(rs.getLong("createtime"));
			item.setUpdater(rs.getString("updater"));
			item.setUpdatetime(rs.getLong("updatetime"));
			return item;
		}
	}


	@Override
	public List<ActivityItem> listBySid(String sid) {
		if(StringUtils.isBlank(sid)){
			return Lists.newArrayList();
		}
		String sql = "select * from ixin_activity_item where resid=? ";
		Object[] params = new Object[]{sid};
		List<ActivityItem> list = jdbcTemplate.query(sql, params, new ActivityItemRowMapper());
		return list;
	}


	@Override
	public ActivityItem getaActivityItem(String aid, int restype, String resid) {
		if(StringUtils.isBlank(aid) || StringUtils.isBlank(resid) || restype<0){
			return new ActivityItem();
		}
		String sql="select * from ixin_activity_item where aid=? and resid=? and restype=?";
		Object[] params=new Object[]{aid,resid,restype};
		List<ActivityItem> list=jdbcTemplate.query(sql,params,new ActivityItemRowMapper());
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return new ActivityItem();
	}


	@Override
	public List<ActivityItem> list(String aid) {
		if(StringUtils.isBlank(aid)){
			return Lists.newArrayList();
		}
		String sql = "select * from ixin_activity_item where aid=? ";
		Object[] params = new Object[]{aid};
		List<ActivityItem> list = jdbcTemplate.query(sql, params, new ActivityItemRowMapper());
		return list;
	}


	@Override
	public int delActivityItemByAidAndResid(String resid) {
		String sql = "delete from ixin_activity_item where resid=?";
		Object[] params = new Object[]{resid};
		return jdbcTemplate.update(sql, params);
	}

	
	
}
