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

import com.longtime.app.admin.iask.dao.QuestionDao;
import com.longtime.app.iask.model.QuestionEntity;
import com.longtime.app.iask.model.QuestionVO;
import com.longtime.common.exception.IAppRuntimeException;
import com.longtime.common.utils.Page;

@Repository("questionDao")
public class QuestionDaoImpl implements QuestionDao{
	
	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	private static Logger logger = LoggerFactory.getLogger(QuestionDaoImpl.class);

	@Override
	public long count(String searchContent, String domain) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) as total from base_question q  where domain=? ");
		params.add(domain);
		if(StringUtils.isNotBlank(searchContent)){
			sql.append(" and ( ");
			sql.append(" title like ? ");
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
	public List<QuestionEntity> list(Page page, String searchContent,
			String domain) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select *  from base_question q  where domain=? ");
		params.add(domain);
		if(StringUtils.isNotBlank(searchContent)){
			sql.append(" and ( ");
			sql.append(" title like ? ");
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
		List<QuestionEntity> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new QuestionRowMapper());
		return list;
	}
	
	

	@Override
	public List<QuestionVO> listQuestions(Page page, String searchContent, String domain) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select q.*,class.classname as classname from base_question q left join ext_enn_class_user class on q.author_id = class.uid where domain=? ");
		params.add(domain);
		if(StringUtils.isNotBlank(searchContent)){
			sql.append(" and ( ");
			sql.append(" title like ? ");
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
		List<QuestionVO> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new QuestionVORowMapper());
		return list;
	}
	
	@Override
	public void delById(String id) {
		String sql = "delete from base_question where id=?";
		try {
			this.jdbcTemplate.update(sql, id);
		} catch (DataAccessException e) {
			logger.error(String.format("删除问题出错，id=[%s]", id),e);
			throw new IAppRuntimeException(e);
		}
	}
	
	
	private class QuestionVORowMapper implements RowMapper<QuestionVO>{
		
		@Override
		public QuestionVO mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			String id = rs.getString("id");
			String title = rs.getString("title");
			String supplement = rs.getString("supplement");
			String supplementNoHtml = rs.getString("supplementNoHtml");
			String author_id = rs.getString("author_id");
			String author_name = rs.getString("author_name");
			int answer_num = rs.getInt("answer_num");
			int comment_num = rs.getInt("comment_num");
			int is_set_best_answer = rs.getInt("is_set_best_answer");
			Long dateCreated = rs.getLong("dateCreated");
			String userCreated = rs.getString("userCreated");
			Long dateLastModified = rs.getLong("dateLastModified");
			String userLastModified = rs.getString("userLastModified");
			String domain = rs.getString("domain");
			String classname = rs.getString("classname");
			String recommend_aid = rs.getString("recommend_aid");
			Long recommend_timestamp = rs.getLong("recommend_timestamp");
			QuestionVO entity = new QuestionVO();
			entity.setId(id);
			entity.setTitle(title);
			entity.setSupplement(supplement);
			entity.setSupplementNoHtml(supplementNoHtml);
			entity.setAuthor_id(author_id);
			entity.setAuthor_name(author_name);
			entity.setAnswer_num(answer_num);
			entity.setComment_num(comment_num);
			entity.setIs_set_best_answer(is_set_best_answer);
			entity.setDateCreated(dateCreated);
			entity.setUserCreated(userCreated);
			entity.setDateLastModified(dateLastModified);
			entity.setUserLastModified(userLastModified);
			entity.setDomain(domain);
			if (StringUtils.isNotBlank(classname)) {
				entity.setClassname(classname);
			}
			entity.setRecommend_aid(recommend_aid);
			entity.setRecommend_timestamp(recommend_timestamp);
			return entity;
		}
		
	}
	private class QuestionRowMapper implements RowMapper<QuestionEntity>{

		@Override
		public QuestionEntity mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			String id = rs.getString("id");
			String title = rs.getString("title");
			String supplement = rs.getString("supplement");
			String supplementNoHtml = rs.getString("supplementNoHtml");
			String author_id = rs.getString("author_id");
			String author_name = rs.getString("author_name");
			int answer_num = rs.getInt("answer_num");
			int comment_num = rs.getInt("comment_num");
			int is_set_best_answer = rs.getInt("is_set_best_answer");
			Long dateCreated = rs.getLong("dateCreated");
			String userCreated = rs.getString("userCreated");
			Long dateLastModified = rs.getLong("dateLastModified");
			String userLastModified = rs.getString("userLastModified");
			String domain = rs.getString("domain");
			String recommend_aid = rs.getString("recommend_aid");
			Long recommend_timestamp = rs.getLong("recommend_timestamp");
			
			QuestionEntity entity = new QuestionEntity();
			entity.setId(id);
			entity.setTitle(title);
			entity.setSupplement(supplement);
			entity.setSupplementNoHtml(supplementNoHtml);
			entity.setAuthor_id(author_id);
			entity.setAuthor_name(author_name);
			entity.setAnswer_num(answer_num);
			entity.setComment_num(comment_num);
			entity.setIs_set_best_answer(is_set_best_answer);
			entity.setDateCreated(dateCreated);
			entity.setUserCreated(userCreated);
			entity.setDateLastModified(dateLastModified);
			entity.setUserLastModified(userLastModified);
			entity.setDomain(domain);
			entity.setRecommend_aid(recommend_aid);
			entity.setRecommend_timestamp(recommend_timestamp);
			return entity;
		}
		
	}


	@Override
	public QuestionEntity getEntity(String id) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select *  from base_question q  where id=? ");
		params.add(id);
		List<QuestionEntity> list = this.jdbcTemplate.query(sql.toString(),params.toArray(), new QuestionRowMapper());
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null ;
	}
	
	@Override
	public boolean updateQuestionStatus(QuestionEntity entity) {
		if (StringUtils.isBlank(entity.getId())) {
			return false;
		}
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("update base_question set status =? where id=?;");
		params.add(entity.getStatus());
		params.add(entity.getId());
		this.jdbcTemplate.update(sql.toString(), params.toArray());
		return true;
	}
	
	@Override
	public void updateQuestionAnswerNum(QuestionEntity entity,String uid) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("update base_question set answer_num =? ");
		if (entity.getIs_set_best_answer() ==0) {
			sql.append(",is_set_best_answer=0,best_aid=null,best_timestamp=0 ");
		}
		if (StringUtils.isBlank(entity.getRecommend_aid())) {
			sql.append(",recommend_aid=null,recommend_timestamp=0 ");
		}
		sql.append(",dateLastModified=?,userLastModified=?");
		sql.append(" where id=?;");
		params.add(entity.getAnswer_num());
		params.add(System.currentTimeMillis());
		params.add(uid);
		params.add(entity.getId());
		this.jdbcTemplate.update(sql.toString(), params.toArray());
	}
	
	@Override
	public boolean updateQuestionRecommend(QuestionEntity entity,String uid) {
		if(entity == null){
			return false;
		}
		
		List<Object> p = new ArrayList<Object>();
		String s = "UPDATE base_answer SET status = 0 where question_id=? and status=1;";
		p.add(entity.getId());
		this.jdbcTemplate.update(s.toString(), p.toArray());
		
		
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("update base_question set ");
		if (entity.getRecommend_aid() == null) {
			sql.append("recommend_aid =null,");
		}else{
			sql.append("recommend_aid =?,");
			params.add(entity.getRecommend_aid());
		}
		sql.append("recommend_timestamp=? ");
		sql.append(" ,dateLastModified=?,userLastModified=?");
		sql.append(" where id=? ;");
		params.add(entity.getRecommend_timestamp());
		params.add(System.currentTimeMillis());
		params.add(uid);
		params.add(entity.getId());
		this.jdbcTemplate.update(sql.toString(), params.toArray());
		return true;
	}


	@Override
	public void delInviteById(String id) {
		String sql = "delete from base_invite where rid =?";
		try {
			this.jdbcTemplate.update(sql, id);
		} catch (DataAccessException e) {
			logger.error(String.format("删除invite信息出错，id=[%s]", id),e);
			throw new IAppRuntimeException(e);
		}
		
	}

	@Override
	public void delAnswerById(String id) {
		String sql = "delete from base_answer where question_id = ?";
		try {
			this.jdbcTemplate.update(sql, id);
		} catch (DataAccessException e) {
			logger.error(String.format("删除回答时信息出错，questionid=[%s]", id),e);
			throw new IAppRuntimeException(e);
		}
	}

	@Override
	public void delTagById(String id) {
		
		String sql = "delete from base_questiontags where questionid = ?";
		try {
			this.jdbcTemplate.update(sql, id);
		} catch (DataAccessException e) {
			logger.error(String.format("删除问题标签时信息出错，questionid=[%s]", id),e);
			throw new IAppRuntimeException(e);
		}
	}


	@Override
	public List<QuestionEntity> listAllQuestionForReport(String domain) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from base_question q  where domain=?  order by dateCreated desc ");
		params.add(domain);
		List<QuestionEntity>  list = this.jdbcTemplate.query(sql.toString(),params.toArray(),new QuestionRowMapper());
		if (CollectionUtils.isNotEmpty(list)) {
			return list;
		}
		return null;
	}


	@Override
	public void doCleanWeekpv() {
		this.jdbcTemplate.update("UPDATE base_question set week_pv=0 ");
	}

	@Override
	public List<QuestionEntity> listQuestionBetweenTime(String domain,Long start, Long end) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from base_question q  where q.domain=? and q.dateCreated  BETWEEN ? AND ?   order by dateCreated desc ");
		params.add(domain);
		params.add(start);
		params.add(end);
		List<QuestionEntity>  list = this.jdbcTemplate.query(sql.toString(),params.toArray(),new QuestionRowMapper());
		if (CollectionUtils.isNotEmpty(list)) {
			return list;
		}
		return null;
	}

	@Override
	public Boolean updateQuestionTaggroup(QuestionEntity question, String qid) {
		if (StringUtils.isBlank(qid)) {
			return false;
		}
		if(question == null){
			return false;
		}
		String sql = "UPDATE base_question set taggroup=? where id=? ";
		List<Object> params = new ArrayList<Object>();
		params.add(question.getTaggroup());
		params.add(qid);
		this.jdbcTemplate.update(sql.toString(), params.toArray());
		return true;
	}


	

}
