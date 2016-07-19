package com.longtime.app.ixin.mgr.topic.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.topic.dao.CommentStudentDao;
import com.longtime.app.ixin.mgr.topic.model.CommentStudentEntity;
@Repository(value = "commentStudentDao")
public class CommentStudentDaoImpl implements CommentStudentDao {
    
	@Resource
    JdbcTemplate jdbcTemplate;
	
	
	@Override
	public List<CommentStudentEntity> getlist(String domain, String topicid,
			String searchval, int pagesize, int currpage) {
	String sql="select * from base_comment  where resid=?  and domain=? and restype=2";
		
		if(StringUtils.isNotBlank(searchval)){
			sql=sql+" and body like ?";
		}
		sql=sql+" order by createtime desc limit ?,?";
		
		Object[] obj=null;
		
		if(StringUtils.isNotBlank(searchval)){
			obj=new Object[]{topicid,domain,"%"+searchval+"%",(currpage-1)*pagesize,pagesize};
		}else{
			obj=new Object[]{topicid,domain,(currpage-1)*pagesize,pagesize};
		}
		List<CommentStudentEntity> entities=jdbcTemplate.query(sql,obj,new RowMapper<CommentStudentEntity>() {

			@Override
			public CommentStudentEntity mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				CommentStudentEntity commentStudentEntity=new CommentStudentEntity();
				
				commentStudentEntity.setAction(rs.getInt("action"));
				commentStudentEntity.setBody(rs.getString("body"));
				commentStudentEntity.setCreatetime(rs.getLong("createtime"));
				commentStudentEntity.setCreator(rs.getString("creator"));
				commentStudentEntity.setDomain(rs.getString("domain"));
				commentStudentEntity.setHeader(rs.getString("header"));
				commentStudentEntity.setId(rs.getLong("id"));
				commentStudentEntity.setPid(rs.getString("pid"));
				commentStudentEntity.setResid(rs.getString("resid"));
				commentStudentEntity.setRestype(rs.getInt("restype"));
				commentStudentEntity.setTouid(rs.getString("touid"));
				commentStudentEntity.setTouname(rs.getString("touname"));
				commentStudentEntity.setUid(rs.getString("uid"));
				commentStudentEntity.setUname(rs.getString("uname"));
				commentStudentEntity.setUpdater(rs.getString("updater"));
				commentStudentEntity.setUpdatetime(rs.getLong("updatetime"));
				commentStudentEntity.setUtype(rs.getInt("utype"));
				commentStudentEntity.setShield(rs.getInt("shield"));
				return commentStudentEntity;
			}
		});
		
		if(entities!=null && entities.size()>0){
			return entities;
		}
		return null;
	}

	@Override
	public int gettotalnum(String domain, String topicid, String searchval) {
		
        String sql="select count(*) as num from base_comment  where resid=?  and domain=? and restype=2  ";
		
		if(StringUtils.isNotBlank(searchval)){
			sql=sql+" and body like ?";
			return jdbcTemplate.queryForInt(sql,topicid,domain,"%"+searchval+"%");
		}
		return jdbcTemplate.queryForInt(sql,topicid,domain);
	}
   
	
	@Override
	public void delstudentcomment(final String id) {
		String sql="delete from base_comment where id=?";
		this.jdbcTemplate.update(sql,id);
	}

	@Override
	public void batchdelcomment(String[] ids) {
	    
		String sql="delete from base_comment where id=?";
		
		List<Object[]> list=Lists.newArrayList();
		for(int i=0;i<ids.length;i++)
		{
			Object[] objects=new Object[]{ids[i]};
			list.add(objects);
		}
         this.jdbcTemplate.batchUpdate(sql,list);		
	}
	
	/**
	 * 屏蔽/取消屏蔽评论
	 */
	@Override
	public void shieldcomment(String id, String status)
	{
		String sql = "update base_comment set shield = ? where id =?";
		Object[] params = {Integer.parseInt(status),id};
		this.jdbcTemplate.update(sql, params);
	} 
}
