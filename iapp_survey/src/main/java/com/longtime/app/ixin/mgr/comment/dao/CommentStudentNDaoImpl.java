package com.longtime.app.ixin.mgr.comment.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.longtime.app.admin.iask.dao.AnswerDao;
import com.longtime.app.ixin.mgr.comment.model.CommentStudentVo;
import com.longtime.common.utils.Page;
@Repository("commentStudentNDao")
public class CommentStudentNDaoImpl implements CommentStudentNDao {
   @Resource
   JdbcTemplate jdbcTemplate;
   
   @Resource
   AnswerDao answerDao;

@Override
public int gettotal(int restype, String domain, String resid, String searchval) {
	StringBuilder sql=new StringBuilder();
	//话题
	if(restype==2){
		sql.append("select count(*) as num from base_comment c left join ixin_student_topic t on c.resid=t.id");	
	}else if(restype==1){//课程
		sql.append("select count(*) as num from base_comment c left join study_course t on c.resid=t.id");
	}else if(restype==3){
		sql.append("select count(*) as num from base_comment c left join base_answer t on c.resid=t.id");
	}
	
	sql.append(" where c.restype=? and c.domain=?");
	
	if(StringUtils.isNotBlank(resid)){
		sql.append(" and c.resid=?");
	}
	
	if(StringUtils.isNotBlank(searchval)){
		if(restype==2 || restype==3){
		sql.append(" and c.body like ? or t.content like ? ");
		}else if(restype==1){
			sql.append(" and c.body like ? or t.name like ?");
		}
		if(StringUtils.isNotBlank(resid)){
			return jdbcTemplate.queryForInt(sql.toString(),restype,domain,resid,"%"+searchval+"%","%"+searchval+"%");
		}else{
		return jdbcTemplate.queryForInt(sql.toString(),restype,domain,"%"+searchval+"%","%"+searchval+"%");
		}
	}
	
	if(StringUtils.isNotBlank(resid)){
		 return jdbcTemplate.queryForInt(sql.toString(),restype,domain,resid);
	}else {
		return jdbcTemplate.queryForInt(sql.toString(),restype,domain);
	}
	
}


@Override
public List<CommentStudentVo> getlist(String domain, String resid,
		String searchval, Page page, final int restype) {
	
	   StringBuilder sql=new StringBuilder();
	//话题
		if(restype==2){
			sql.append("select c.*,t.content from base_comment c left join ixin_student_topic t on c.resid=t.id");	
		}else if(restype==1){//课程
			sql.append("select c.*,t.name from base_comment c left join study_course t on c.resid=t.id");
		}else if(restype==3){
			sql.append("select c.*,t.content from base_comment c left join base_answer t on c.resid=t.id");
		}
		
		
		sql.append(" where c.restype=? and c.domain=?");
		
		if(StringUtils.isNotBlank(resid)){
			sql.append(" and c.resid=?");
		}
		
		Object[] obj=null;
		if(StringUtils.isNotBlank(searchval)){
			if(restype==2 || restype==3){
				sql.append(" and (c.body like ? or t.content like ? )");
				}else if(restype==1){
					sql.append(" and (c.body like ? or t.name like ?)");
				}
		}
		
		sql.append(" order by createtime desc limit ?,?");
		
		if(StringUtils.isNotBlank(searchval)){
			if(StringUtils.isNotBlank(resid)){
			obj=new Object[]{restype,domain,resid,"%"+searchval+"%","%"+searchval+"%",(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};
			}else{
				obj=new Object[]{restype,domain,"%"+searchval+"%","%"+searchval+"%",(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};
			}
		}else {
			if(StringUtils.isNotBlank(resid)){
				obj=new Object[]{restype,domain,resid,(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};	
			}else {
				obj=new Object[]{restype,domain,(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()};	
			}
			
		}
	
	List<CommentStudentVo> entities=jdbcTemplate.query(sql.toString(),obj,new RowMapper<CommentStudentVo>() {

		@Override
		public CommentStudentVo mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			CommentStudentVo commentStudentVo=new CommentStudentVo();
			
			commentStudentVo.setAction(rs.getInt("action"));
			commentStudentVo.setBody(rs.getString("body"));
			commentStudentVo.setCreatetime(rs.getLong("createtime"));
			commentStudentVo.setCreator(rs.getString("creator"));
			commentStudentVo.setDomain(rs.getString("domain"));
			commentStudentVo.setHeader(rs.getString("header"));
			commentStudentVo.setId(rs.getLong("id"));
			commentStudentVo.setPid(rs.getString("pid"));
			commentStudentVo.setResid(rs.getString("resid"));
		    commentStudentVo.setRestype(rs.getInt("restype"));
		    commentStudentVo.setTouid(rs.getString("touid"));
		    commentStudentVo.setTouname(rs.getString("touname"));
		    commentStudentVo.setUid(rs.getString("uid"));
		    commentStudentVo.setUname(rs.getString("uname"));
		    commentStudentVo.setUpdater(rs.getString("updater"));
		    commentStudentVo.setUpdatetime(rs.getLong("updatetime"));
		    commentStudentVo.setUtype(rs.getInt("utype"));
		    if(restype==2 || restype==3){
		    	commentStudentVo.setContent(rs.getString("content"));
		    }else if(restype==1){
		    	commentStudentVo.setContent(rs.getString("name"));
		    }
			return commentStudentVo;
		}
	});
	
	if(entities!=null && entities.size()>0){
		return entities;
	}
	return null;
}

@Override
public void del(String id) {
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
   
}
