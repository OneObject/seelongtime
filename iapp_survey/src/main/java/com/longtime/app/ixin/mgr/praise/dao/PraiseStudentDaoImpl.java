package com.longtime.app.ixin.mgr.praise.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.longtime.app.base.model.Praise;
import com.longtime.app.ixin.mgr.praise.model.PraiseStudentVo;
import com.longtime.common.utils.Page;

@Repository
public class PraiseStudentDaoImpl implements PraiseStudentDao {
   
	@Resource
	JdbcTemplate jdbcTemplate;
	
	
	@Override
	public int gettotal(int restype, String domain, String resid,
			String searchval) {
		
		StringBuilder sql=new StringBuilder();
		//话题
		if(restype==2){
			sql.append("select count(*) as num from base_praise_history c left join ixin_student_topic t on c.resid=t.id");	
		}else if(restype==1){//课程
			sql.append("select count(*) as num from base_praise_history c left join study_course t on c.resid=t.id");
		}
		
		sql.append(" where c.restype=? and c.domain=?  and cancel=0");
		
		if(StringUtils.isNotBlank(resid)){
			sql.append(" and resid=?");
		}
		
		if(StringUtils.isNotBlank(searchval)){
			if(restype==2){
			sql.append(" and c.uname like ? or t.content like ? ");
			}else if(restype==1){
				sql.append(" and c.uname like ? or t.name like ?");
			}
			if(StringUtils.isNotBlank(resid)){
				return jdbcTemplate.queryForInt(sql.toString(),restype,domain,resid,"%"+searchval+"%","%"+searchval+"%");
			}
			return jdbcTemplate.queryForInt(sql.toString(),restype,domain,"%"+searchval+"%","%"+searchval+"%");
		}else{
			if(StringUtils.isNotBlank(resid)){
				 return jdbcTemplate.queryForInt(sql.toString(),restype,domain,resid);
			}else {
				 return jdbcTemplate.queryForInt(sql.toString(),restype,domain);
			}
		}
		
	}

	@Override
	public List<PraiseStudentVo> getlist(String domain, String resid,
			String searchval, Page page, final int restype) {

		   StringBuilder sql=new StringBuilder();
		//话题
			if(restype==2){
				sql.append("select c.*,t.content from base_praise_history c left join ixin_student_topic t on c.resid=t.id");	
			}else if(restype==1){//课程
				sql.append("select c.*,t.name from base_praise_history c left join study_course t on c.resid=t.id");
			}
			
			sql.append(" where c.restype=? and c.domain=?  and cancel=0");
			
			if(StringUtils.isNotBlank(resid)){
				sql.append(" and resid=?");
			}
			
			Object[] obj=null;
			if(StringUtils.isNotBlank(searchval)){
				if(restype==2){
					sql.append(" and c.uname like ? or t.content like ? ");
					}else if(restype==1){
						sql.append(" and c.uname like ? or t.name like ?");
					}
			}
			
			sql.append(" order by c.createtime desc limit ?,?");
			
			if(StringUtils.isNotBlank(searchval)){
				if(StringUtils.isNotBlank(resid)){
					obj=new Object[]{restype,domain,resid,"%"+searchval+"%","%"+searchval+"%",(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};
				}else {
					obj=new Object[]{restype,domain,"%"+searchval+"%","%"+searchval+"%",(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};
				}
			}else {
				if(StringUtils.isNotBlank(resid)){
					obj=new Object[]{restype,domain,resid,(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};
				}else {
					obj=new Object[]{restype,domain,(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};
				}
				
			}
		
		List<PraiseStudentVo> entities=jdbcTemplate.query(sql.toString(),obj,new RowMapper<PraiseStudentVo>() {

			@Override
			public PraiseStudentVo mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				
				PraiseStudentVo praiseStudentVo=new PraiseStudentVo();
				
				praiseStudentVo.setCancel(rs.getInt("cancel"));
				praiseStudentVo.setCreatetime(rs.getLong("createtime"));
				praiseStudentVo.setCreator(rs.getString("creator"));
				praiseStudentVo.setDomain(rs.getString("domain"));
				praiseStudentVo.setId(rs.getLong("id"));
				praiseStudentVo.setResid(rs.getString("resid"));
				praiseStudentVo.setRestype(rs.getInt("restype"));
				praiseStudentVo.setUid(rs.getString("uid"));
				praiseStudentVo.setUname(rs.getString("uname"));
				praiseStudentVo.setUpdater(rs.getString("updater"));
				praiseStudentVo.setUpdatetime(rs.getLong("updatetime"));
				praiseStudentVo.setUtype(rs.getInt("utype"));
				if(restype==2){
					praiseStudentVo.setContent(rs.getString("content"));
				}else if(restype==1){
					praiseStudentVo.setContent(rs.getString("name"));
				}
				
				return praiseStudentVo;
			}
		});
		
		if(entities!=null && entities.size()>0){
			return entities;
		}
		return null;
	}

	@Override
	public long count(String cid, String uid) {
		StringBuilder sql=new StringBuilder();
		sql.append("select count(*) as num from base_praise_history c ");
		sql.append(" where c.restype=1 and c.resid=? and c.uid=? and cancel=0");
		return this.jdbcTemplate.queryForInt(sql.toString(),cid,uid);
	}

	@Override
	public Praise getPraiseByParams(String rid, String domain, int restype,int type) {
		String sql = "select * from base_praise where resid = ? and domain = ? and restype = ? and type = ? "; 
		List<Praise> list = this.jdbcTemplate.query(sql,new Object[]{rid,domain,restype,type}, new RowMapper<Praise>(){
			@Override
			public Praise mapRow(ResultSet rs, int rowNum) throws SQLException {
				Praise entity = new Praise();
				entity.setTotal(rs.getLong("total"));
				return entity;
			}
			});
		 if (CollectionUtils.isNotEmpty(list)) {
			return list.get(0);
		 }
		 
		 return null;
	}
   
}
