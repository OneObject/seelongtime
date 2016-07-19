package com.longtime.app.admin.iask.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.longtime.app.admin.iask.dao.AnswerDao;
import com.longtime.app.iask.model.AnswerEntity;
import com.longtime.common.exception.IAppRuntimeException;
import com.longtime.common.utils.Page;
import com.myctu.platform.repository.engine.domain.EntityMetaInfo;

@Repository("answerDao")
public class AnswerDaoImpl implements AnswerDao{
	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	private static Logger logger = LoggerFactory.getLogger(AnswerDaoImpl.class);

	@Override
	public long count(String searchContent,String id) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) as total from base_answer where question_id=?");
		params.add(id);
		if(StringUtils.isNotBlank(searchContent)){
			sql.append(" and ( ");
			sql.append(" content like ? ");
			sql.append(" or author_name like ? ");
			sql.append(" ) ");
			String param = String.format("%%%s%%", searchContent);
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
	public List<AnswerEntity> list(Page page, String searchContent,String id) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select *  from base_answer q  where question_id=? ");
		params.add(id);
		if(StringUtils.isNotBlank(searchContent)){
			sql.append(" and ( ");
			sql.append(" content like ? ");
			sql.append(" or author_name like ? ");
			sql.append(" ) ");
			String param = String.format("%%%s%%", searchContent);
			params.add(param);
			params.add(param);
		}
		sql.append(" order by dateCreated desc ");
		sql.append("limit ?,? ");
		params.add(page.getStart());
		params.add(page.getPage_size());
		List<AnswerEntity> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new AnswerRowMapper());
		return list;
	}
	
	@Override
	public List<AnswerEntity> list(String id) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select *  from base_answer q  where question_id=? ");
		params.add(id);
		sql.append(" order by dateCreated desc ");
		List<AnswerEntity> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new AnswerRowMapper());
		return list;
	}

	@Override
	public void delById(String id) {
		String sql = "delete from base_answer where id=?";
		try {
			this.jdbcTemplate.update(sql, id);
		} catch (DataAccessException e) {
			logger.error(String.format("删除回答出错，id=[%s]", id),e);
			throw new IAppRuntimeException(e);
		}
	}
	
	private class AnswerRowMapper implements RowMapper<AnswerEntity>{

		@Override
		public AnswerEntity mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			
			AnswerEntity answerEntity=new AnswerEntity();
			
			answerEntity.setAgree_num(rs.getInt("agree_num"));
			answerEntity.setAuthor_id(rs.getString("author_id"));
			answerEntity.setAuthor_name(rs.getString("author_name"));
			answerEntity.setComment_num(rs.getInt("comment_num"));
			answerEntity.setContent(rs.getString("content"));
			answerEntity.setContentNoHtml(rs.getString("contentNoHtml"));
			answerEntity.setDisagree_num(rs.getInt("disagree_num"));
			EntityMetaInfo entityMetaInfo=new EntityMetaInfo();
			
			entityMetaInfo.setDateCreated(rs.getLong("dateCreated"));
			entityMetaInfo.setDateLastModified(rs.getLong("dateLastModified"));
			entityMetaInfo.setUserCreated(rs.getString("userCreated"));
			entityMetaInfo.setUserLastModified(rs.getString("userLastModified"));
			
			answerEntity.setEntityMetaInfo(entityMetaInfo);
			answerEntity.setId(rs.getString("id"));
			answerEntity.setIs_best_answer(rs.getBoolean("is_best_answer"));
			answerEntity.setQuestion_id(rs.getString("question_id"));
			answerEntity.setView(rs.getString("view"));
			
			return answerEntity;
		}
		
	}

	@Override
	public AnswerEntity getEntity(String id) {
		
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select *  from base_answer  where id=? ");
		params.add(id);
		
		List<AnswerEntity> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new AnswerRowMapper());
		
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		
		return null;
	}

	@Override
	public void updateAnswerEntity(AnswerEntity answerEntity) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("update base_answer set comment_num=? where id=?");
		params.add(answerEntity.getComment_num());
		params.add(answerEntity.getId());
		this.jdbcTemplate.update(sql.toString(),params.toArray());
	}

	@Override
	public List<AnswerEntity> listAnswerByQuestionId(String id) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select *  from base_answer q  where q.question_id=? ");
		params.add(id);
		sql.append(" order by q.dateCreated desc ");
		List<AnswerEntity> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new AnswerRowMapper());
		return list;
	
	}

	@Override
	public boolean updateAnswerEntityStatus(AnswerEntity answerEntity,String uid) {
		if(answerEntity == null){
			return false;
		}
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" update base_answer set status=? ");
		sql.append(" ,dateLastModified=?,userLastModified=? ");
		sql.append(" where id=? ");
		params.add(answerEntity.getStatus());
		params.add(System.currentTimeMillis());
		params.add(uid);
		params.add(answerEntity.getId());
		this.jdbcTemplate.update(sql.toString(),params.toArray());
		return true;
	}

}
