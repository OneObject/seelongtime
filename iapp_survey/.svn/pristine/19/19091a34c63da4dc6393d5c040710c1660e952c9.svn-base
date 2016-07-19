package com.longtime.app.track.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.longtime.app.track.model.ReportVisitEntity;
import com.longtime.app.track.repository.ReportVisitDao;
import com.longtime.common.dao.BaseDAOImpl;
import com.longtime.common.utils.Page;

@Repository
public class ReportVisitDaoImpl extends  BaseDAOImpl<ReportVisitEntity, String> implements ReportVisitDao{
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;


	@Override
	public List<Map<String, Object>> countCourseDetail(String domain, long start, long end) {
		StringBuffer sql = new StringBuffer();
		
		sql.append("select u.username,u.`name`,t2.cname,");
		sql.append("t2.`name`, FROM_UNIXTIME(t2.time/1000, '%Y-%m-%d %H:%i:%s' ) from ");
		sql.append("(select t1.uid,t1.time,t1.`name`,c.`name` as cname from (select tr.*,v.`name`,v.categoryid ");
		sql.append("from user_track tr INNER JOIN study_course v on tr.rid = v.id WHERE tr.domain=? ");
		sql.append("and tr.model='course' and tr.time>? and tr.time<? ) t1 LEFT JOIN study_course_category c on t1.categoryid = c.id ) t2 ");
		sql.append("INNER JOIN iapp_base_user u on t2.uid = u.id where u.usertype = 0 order by t2.time ");
		
		
		List<Map<String, Object>>  list = this.jdbcTemplate.query(sql.toString(), new Object[]{domain,start,end},  new RowMapper<Map<String, Object>>(){

			@Override
			public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Object> map = new HashMap<String, Object>();
					map.put("工号", rs.getObject(1));
					map.put("姓名", rs.getObject(2));
					map.put("课程分类", rs.getObject(3));
					map.put("课程名称", rs.getObject(4));
					map.put("访问时间", rs.getObject(5));
				return map;
			}
		});
		
		return list;
	}


	@Override
	public List<Map<String, Object>> countSurveyOrVoteDetail(String domain, long start, long end) {
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select u.username as '工号',u.`name` as '姓名',t.type as '类型',t.title ");
		sql.append("as '调研/投票名称',FROM_UNIXTIME(t.time/1000, '%Y-%m-%d %H:%i:%s' ) as  ");
		sql.append("'访问时间' from (select tr.*,v.title as title, IF(v.surveyOrvote=0,'投票','调研') ");
		sql.append(" AS type from user_track tr INNER JOIN ixin_vote v on tr.rid = v.id ");
		sql.append(" WHERE tr.domain=?  and tr.model='survey' and tr.time>? and tr.time<? ) t INNER JOIN ");
		sql.append("iapp_base_user u on t.uid = u.id where u.usertype = 0 order by t.time ");
		
		List<Map<String, Object>>  list = this.jdbcTemplate.query(sql.toString(), new Object[]{domain,start,end},  new RowMapper<Map<String, Object>>(){

			@Override
			public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Object> map = new HashMap<String, Object>();
					map.put("工号", rs.getObject(1));
					map.put("姓名", rs.getObject(2));
					map.put("类型", rs.getObject(3));
					map.put("调研/投票名称", rs.getObject(4));
					map.put("访问时间", rs.getObject(5));
				return map;
			}
		});
		
		return list;
	}

	@Override
	public List<Map<String, Object>> countFodderDetail(String domain, long start, long end) {
		//select t2.`title` as '标题',u.username as '工号',t2.openId as openId, FROM_UNIXTIME(t2.time/1000, '%Y-%m-%d %H:%i:%s' ) as '访问时间' from (select tr.*,v.`title` from user_track tr inner JOIN ixin_fodder v on tr.rid = v.id WHERE tr.model='fodder' and tr.domain='-1'  ) t2 INNER JOIN iapp_base_user u on t2.uid = u.id where u.usertype = 0 order by t2.time 
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select t2.`title` as '标题',u.username as '工号',u.name as '用户姓名',t2.openId as openId, ");
		sql.append("FROM_UNIXTIME(t2.time/1000, '%Y-%m-%d %H:%i:%s' ) as '访问时间' from (select tr.*, ");
		sql.append("v.`title` from user_track tr inner JOIN ixin_fodder v on tr.rid = v.id WHERE ");
		sql.append("tr.model='fodder' and tr.domain=? and tr.time>? and tr.time<? ) t2 left JOIN iapp_base_user u ");
		sql.append("on t2.uid = u.id and u.usertype = 0 order by t2.time ");
		
		List<Map<String, Object>>  list = this.jdbcTemplate.query(sql.toString(), new Object[]{domain,start,end},  new RowMapper<Map<String, Object>>(){

			@Override
			public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Object> map = new HashMap<String, Object>();
					map.put("标题", rs.getObject(1));
					map.put("工号", rs.getObject(2));
					map.put("用户姓名", rs.getObject(3));
					map.put("openId", rs.getObject(4));
					map.put("访问时间", rs.getObject(5));
				return map;
			}
		});
		return list;
	}


	@Override
	public List<ReportVisitEntity> listTopVisitNum(Long start, Long end, Page page, String domain, String model) {
		String sql = "select report.rid,report.model,report.domain,sum(value) as sum from report_visit_statistics report where report.`timestamp`>= ?  AND  report.`timestamp` < ?  and domain=? and model=? GROUP BY rid ORDER BY sum desc";
		
		List<Object> args = Lists.newArrayList();
		
		args.add(start);
		
		args.add(end);
		
		args.add(domain);
		
		args.add(model);
		
		if (null != page) {
			
			sql = String.format("%s limit ?,? ",sql);
			
			args.add(page.getStart());
			
			args.add(page.getPage_size());
			
		}
		
		List<ReportVisitEntity> list = this.jdbcTemplate.query(sql, args.toArray(), new RowMapper<ReportVisitEntity>(){
			
			@Override
			public ReportVisitEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				ReportVisitEntity entity = new ReportVisitEntity();
				
				entity.setRid(rs.getString("rid"));
				
				entity.setDomain(rs.getString("domain"));
				
				entity.setModel(rs.getString("model"));
				
				entity.setValue(rs.getLong("sum"));
				
				return entity;
			}
		});
		
		return list;
	}


	@Override
	public List<Object> countCourseVisit(String domain) {
		
		String sql = "SELECT course.name as name,t.sum as num  from study_course course LEFT JOIN (select report.rid as rid,sum(value) as sum from report_visit_statistics report where  domain=? and model='course_detail_pv' GROUP BY rid ) t on course.id = t.rid  where course.domainid=? ORDER BY sum desc";
		
		List<Object> args = Lists.newArrayList();
		
		args.add(domain);
		
		args.add(domain);
		
		List<Object> list = this.jdbcTemplate.query(sql, args.toArray(), new RowMapper<Object>(){
			
			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("name",rs.getString("name"));
				
				map.put("num",rs.getString("num"));
				
				return map;
			}
		});
		
		if (CollectionUtils.isEmpty(list)) {
			return Lists.newArrayList();
		}
		
		return list;
	}
	
	
}
