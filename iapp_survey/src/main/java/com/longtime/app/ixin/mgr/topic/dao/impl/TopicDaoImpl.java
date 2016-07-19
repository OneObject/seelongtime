package com.longtime.app.ixin.mgr.topic.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.topic.dao.TopicDao;
import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicStudentEntity;
import com.longtime.app.ixin.mgr.utils.DBUtils;
import com.longtime.common.utils.LoginSessionHelper;

@Repository(value = "topicDao")
public class TopicDaoImpl implements TopicDao {
	private static List<String> ignoreColumns = new ArrayList<String>();
	static{
		ignoreColumns.add("id");
		//ignoreColumns.add("createTime");
	}
	
	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@SuppressWarnings("unchecked")
	@Override
	public void saveOrUpdate(TopicEntity entity) {
		String currentUid = LoginSessionHelper.getThreadLocalUid();
		String currentUname=LoginSessionHelper.getThreadLocalUname();
		try{
			entity.setCreator(currentUid);
			entity.setCreatorName(currentUname);
			Map<String,Object> map = DBUtils.getInsertSql(entity,"ixin_topic",null);
			jdbcTemplate.update((String)map.get("sql"),((List<Object>)map.get("insertVals")).toArray());
		}catch(Exception e){
			entity.setUpdater(currentUid);
			entity.setUpdaterName(currentUname);
			entity.setUpdatetime(System.currentTimeMillis());
			Map<String,Object> map = DBUtils.getUpdateSql(entity,"ixin_topic",ignoreColumns,"id");
			jdbcTemplate.update((String)map.get("sql"),((List<Object>)map.get("updateVals")).toArray());
		}
	}

	@Override
	public int getTopicTotalSize(String domain) {
		String sql = "select count(*) from ixin_topic where domain=? and del=0";
		
		return DBUtils.getCount(sql, jdbcTemplate, domain);
	}
	
	
	
	

	@Override
	public List<TopicEntity> queryTopicEntityList(int pageSize, int currPage,
			String domain) {
        String sql = "select * from ixin_topic where domain=? and del=0 order by createTime desc limit ?,?";
		
		return DBUtils.queryList(new TopicEntity(), sql, jdbcTemplate, domain,(currPage-1)*pageSize,pageSize);
	}

	@Override
	public TopicEntity getTopicEntityById(String id) {
		String sql = "select * from ixin_topic where id=?";
		List<TopicEntity> list = DBUtils.queryList(new TopicEntity(), sql, jdbcTemplate, id);
		if(list !=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void del(String id) {
		String sql = "delete from ixin_topic where id=?";
		jdbcTemplate.update(sql,id);
	}

	@Override
	public TopicEntity queryTopicEntityByKeywords(String keywords,String domain) {
		String sql = "select * from ixin_topic where keywords=? and domain=? ";
		List<TopicEntity> entities = DBUtils.queryList(new TopicEntity(), sql, jdbcTemplate, keywords,domain);
		if(entities!=null && entities.size()>0){
			return entities.get(0);
		}
		return null;
	}

	@Override
	public List<TopicStudentEntity> getTopicEntities(String searchval,String activityid, String domain,int pagesize,int currpage) {
		
		String sql="select t.* from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id and a.aid=? and t.isdel=0 and  t.domain=? ";
		
		if(StringUtils.isNotBlank(searchval)){
			sql=sql+" and t.content like ?";
		}
		sql=sql+" order by top desc,createtime desc limit ?,?";
		
		Object[] obj=null;
		
		if(StringUtils.isNotBlank(searchval)){
			obj=new Object[]{activityid,domain,"%"+searchval+"%",(currpage-1)*pagesize,pagesize};
		}else{
			obj=new Object[]{activityid,domain,(currpage-1)*pagesize,pagesize};
		}
		List<TopicStudentEntity> entities=jdbcTemplate.query(sql,obj,new RowMapper<TopicStudentEntity>() {

			@Override
			public TopicStudentEntity mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				
				TopicStudentEntity topicStudentEntity=new TopicStudentEntity();
				
				topicStudentEntity.setContent(rs.getString("content"));
				topicStudentEntity.setId(rs.getLong("id"));
				topicStudentEntity.setCreatetime(rs.getLong("createtime"));
				topicStudentEntity.setCreator(rs.getString("creator"));
				topicStudentEntity.setDomain(rs.getString("domain"));
				topicStudentEntity.setIsdel(rs.getInt("isdel"));
				topicStudentEntity.setUid(rs.getString("uid"));
				topicStudentEntity.setUname(rs.getString("uname"));
				topicStudentEntity.setUpdater(rs.getString("updater"));
				topicStudentEntity.setUpdatetime(rs.getLong("updatetime"));
				topicStudentEntity.setUtype(rs.getInt("utype"));
				topicStudentEntity.setTop(rs.getLong("top"));
				
				return topicStudentEntity;
			}
		});
		
		if(entities!=null && entities.size()>0){
			return entities;
		}
		return null;
	}

	@Override
	public int getTopicStudentCount(String searchval,String actitityid, String domain) {
		
		String sql="select count(*) as num from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id and t.isdel=0 and a.aid=? and t.domain=? ";
		
		if(StringUtils.isNotBlank(searchval)){
			sql=sql+" and t.content like ?";
			return jdbcTemplate.queryForInt(sql,actitityid,domain,"%"+searchval+"%");
		}
		return jdbcTemplate.queryForInt(sql,actitityid,domain);
	}

	@Override
	public void delstudenttopic(String id) {
         String sql="update ixin_student_topic set isdel=1 where id=?";
         jdbcTemplate.update(sql,id);
         //得到关联信息
         String sql2="delete from ixin_activity_item where resid=?";
         jdbcTemplate.update(sql2,id);
	}

	@Override
	public TopicStudentEntity getTopicStudentEntity(String id) {
		String sql = "select * from ixin_student_topic where id=?";
		List<TopicStudentEntity> entities=jdbcTemplate.query(sql,new Object[]{id},new RowMapper<TopicStudentEntity>() {

			@Override
			public TopicStudentEntity mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				
				TopicStudentEntity topicStudentEntity=new TopicStudentEntity();
				
				topicStudentEntity.setContent(rs.getString("content"));
				topicStudentEntity.setId(rs.getLong("id"));
				topicStudentEntity.setCreatetime(rs.getLong("createtime"));
				topicStudentEntity.setCreator(rs.getString("creator"));
				topicStudentEntity.setDomain(rs.getString("domain"));
				topicStudentEntity.setIsdel(rs.getInt("isdel"));
				topicStudentEntity.setUid(rs.getString("uid"));
				topicStudentEntity.setUname(rs.getString("uname"));
				topicStudentEntity.setUpdater(rs.getString("updater"));
				topicStudentEntity.setUpdatetime(rs.getLong("updatetime"));
				topicStudentEntity.setUtype(rs.getInt("utype"));
				
				return topicStudentEntity;
			}
		});
		if(entities !=null && entities.size()>0){
			return entities.get(0);
		}
		return null;
	}



	@Override
	public List<TopicStudentEntity> getTopicStudentEntities(String searchval,
			String domain, int pagesize, int currpage) {
		
		List<Object> params=Lists.newArrayList();
		
        StringBuilder sql= new StringBuilder("select t.* from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id  and t.isdel=0 and t.domain=? ");
		
        params.add(domain);
        
		if(StringUtils.isNotBlank(searchval)){
			sql.append(" and t.content like ?");
			params.add("%"+searchval+"%");
		}
		sql.append(" order by top desc,createtime desc limit ?,?");
		
		params.add((currpage-1)*pagesize);
		params.add(pagesize);
		
		List<TopicStudentEntity> entities=jdbcTemplate.query(sql.toString(),params.toArray(),new RowMapper<TopicStudentEntity>() {

			@Override
			public TopicStudentEntity mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				
				TopicStudentEntity topicStudentEntity=new TopicStudentEntity();
				
				topicStudentEntity.setContent(rs.getString("content"));
				topicStudentEntity.setId(rs.getLong("id"));
				topicStudentEntity.setCreatetime(rs.getLong("createtime"));
				topicStudentEntity.setCreator(rs.getString("creator"));
				topicStudentEntity.setDomain(rs.getString("domain"));
				topicStudentEntity.setIsdel(rs.getInt("isdel"));
				topicStudentEntity.setUid(rs.getString("uid"));
				topicStudentEntity.setUname(rs.getString("uname"));
				topicStudentEntity.setUpdater(rs.getString("updater"));
				topicStudentEntity.setUpdatetime(rs.getLong("updatetime"));
				topicStudentEntity.setUtype(rs.getInt("utype"));
				topicStudentEntity.setRecommend(rs.getInt("recommend"));
				topicStudentEntity.setTop(rs.getLong("top"));
				topicStudentEntity.setShield(rs.getInt("shield"));
				topicStudentEntity.setCreator(rs.getString("creator"));
				return topicStudentEntity;
			}
		});
		
		if(entities!=null && entities.size()>0){
			return entities;
		}
		return null;
		
	}

	@Override
	public int getTopicStudentCount(String searchval, String domain) {
		
		List<Object> params=Lists.newArrayList();
        StringBuilder  sql= new StringBuilder("select count(*) as num from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id and t.isdel=0 and t.domain=?");
		
        params.add(domain);
        
		if(StringUtils.isNotBlank(searchval)){
			sql.append(" and t.content like ?");
			params.add("%"+searchval+"%");
		}
		return jdbcTemplate.queryForInt(sql.toString(),params.toArray());
	}



	@Override
	public void batchtopicstudentdel(String[] ids) {
		 String sql="update ixin_student_topic set isdel=1 where id=?";
		 
		 String sql2="delete from ixin_activity_item where resid=?";
		 
		 List<Object[]> list=Lists.newArrayList();
			for(int i=0;i<ids.length;i++)
			{
				Object[] objects=new Object[]{ids[i]};
				list.add(objects);
			}
	         this.jdbcTemplate.batchUpdate(sql,list);	
	         
	         this.jdbcTemplate.batchUpdate(sql2,list);
	}

	@Override
	public void recommendtopicstudent(String id) {
		String sql="update ixin_student_topic set recommend=1 where id=?";
		this.jdbcTemplate.update(sql,id);
	}

	@Override
	public void topstudenttopic(String id) {
		String sql="update ixin_student_topic set top=? where id=?";
		this.jdbcTemplate.update(sql,System.currentTimeMillis(),id);
	}

	@Override
	public int getTopicStudentCounts(String searchval, String domain) {
		
		List<Object> params=Lists.newArrayList();
        StringBuilder  sql= new StringBuilder("select count(*) as num from ixin_student_topic t where t.isdel=0 and t.domain=? and t.id not in(select DISTINCT(t.id) from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id and t.isdel=0 and t.domain=?)");
		
        params.add(domain);
        params.add(domain);
        
		if(StringUtils.isNotBlank(searchval)){
			sql.append(" and t.content like ?");
			params.add("%"+searchval+"%");
		}
		return jdbcTemplate.queryForInt(sql.toString(),params.toArray());
	}

	@Override
	public List<TopicStudentEntity> getTopicEntities(String searchval,
			String domain, int pagesize, int currpage) {
	List<Object> params=Lists.newArrayList();
		
        StringBuilder sql= new StringBuilder("select * from ixin_student_topic t where t.isdel=0 and t.domain=? and t.id not in(select DISTINCT(t.id) from ixin_activity_item a ,ixin_student_topic t where a.resid=t.id and t.isdel=0 and t.domain=?)");
		
        params.add(domain);
        params.add(domain);
        
		if(StringUtils.isNotBlank(searchval)){
			sql.append(" and t.content like ?");
			params.add("%"+searchval+"%");
		}
		sql.append(" order by top desc,createtime desc limit ?,?");
		
		params.add((currpage-1)*pagesize);
		params.add(pagesize);
		
		List<TopicStudentEntity> entities=jdbcTemplate.query(sql.toString(),params.toArray(),new RowMapper<TopicStudentEntity>() {

			@Override
			public TopicStudentEntity mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				
				TopicStudentEntity topicStudentEntity=new TopicStudentEntity();
				
				topicStudentEntity.setContent(rs.getString("content"));
				topicStudentEntity.setId(rs.getLong("id"));
				topicStudentEntity.setCreatetime(rs.getLong("createtime"));
				topicStudentEntity.setCreator(rs.getString("creator"));
				topicStudentEntity.setDomain(rs.getString("domain"));
				topicStudentEntity.setIsdel(rs.getInt("isdel"));
				topicStudentEntity.setUid(rs.getString("uid"));
				topicStudentEntity.setUname(rs.getString("uname"));
				topicStudentEntity.setUpdater(rs.getString("updater"));
				topicStudentEntity.setUpdatetime(rs.getLong("updatetime"));
				topicStudentEntity.setUtype(rs.getInt("utype"));
				topicStudentEntity.setRecommend(rs.getInt("recommend"));
				topicStudentEntity.setTop(rs.getLong("top"));
				topicStudentEntity.setCover(rs.getString("cover"));
				topicStudentEntity.setAudiourl(rs.getString("audiourl"));
				topicStudentEntity.setVideourl(rs.getString("videourl"));
				topicStudentEntity.setShield(rs.getInt("shield"));
				return topicStudentEntity;
			}
		});
		
		if(entities!=null && entities.size()>0){
			return entities;
		}
		return null;
	}

	@Override
	public void cancelrecommendtopic(String id) {
		String sql="update ixin_student_topic set recommend=0 where id=?";
		this.jdbcTemplate.update(sql,id);
	}

	@Override
	public void canceltoptopic(String id) {
		String sql="update ixin_student_topic set top=0 where id=?";
		this.jdbcTemplate.update(sql,id);
	}

	@Override
	public int shield(String id, String shield)
	{
		String sql = "update ixin_student_topic set shield = ? where id =?";
		Object[] params = {Integer.parseInt(shield),id};
		return this.jdbcTemplate.update(sql, params);
	}
}
