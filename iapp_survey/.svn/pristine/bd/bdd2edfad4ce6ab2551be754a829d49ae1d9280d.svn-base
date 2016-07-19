package com.longtime.app.ixin.mgr.topic.dao.impl;

import com.longtime.app.ixin.mgr.topic.dao.CommentDao;
import com.longtime.app.ixin.mgr.topic.model.CommentEntity;
import com.longtime.app.ixin.mgr.utils.DBUtils;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("topicCommentDao")
public class CommentDaoImpl implements CommentDao{
	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int getTopicCommentTotalSize(String topicId) {
		String sql = "select count(*) from ixin_topic_comment where topicId=?";
		return DBUtils.getCount(sql, jdbcTemplate, topicId);
	}

	@Override
	public List<CommentEntity> queryCommentListByTopicId(int pageSize,
			int currPage, String topicId) {
		String sql = "select * from ixin_topic_comment where topicId=? order by commentTime desc limit ?,?";
		return DBUtils.queryList(new CommentEntity(), sql, jdbcTemplate, topicId,(currPage-1)*pageSize,pageSize);
	}
	
	@Override
	public List<CommentEntity> queryInWallCommentListByTopicId(int pageSize, int currPage,
		String topicId){
		
		String sql = "select * from ixin_topic_comment where topicId=? and shield=0 order by commentTime desc limit ?,?";
		return DBUtils.queryList(new CommentEntity(), sql, jdbcTemplate, topicId,(currPage-1)*pageSize,pageSize);
		
	}

	@Override
	public void updateCommentShieldStatus(String id, int shield) {
		String sql = "update ixin_topic_comment set shield=? where id=?";
		jdbcTemplate.update(sql,shield,id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void saveUserTopicComment(CommentEntity entity) {
		Map<String,Object> map = DBUtils.getInsertSql(entity, "ixin_topic_comment", null);
		String sql = (String)map.get("sql");
		List<Object> list = (List<Object>)map.get("insertVals");
		jdbcTemplate.update(sql,list.toArray());
	}

	public CommentEntity loadById(String id){
		if(StringUtils.isBlank(id)){
			return null;
		}
		String sql = "select * from ixin_topic_comment where id=?";
		
		List<CommentEntity> list  = DBUtils.queryList(new CommentEntity(), sql, jdbcTemplate, id);
		
		if(null==list || list.isEmpty()){
			return null;
		}
		return list.get(0);
	}
	
	public void deleteById(String id){
		if(StringUtils.isBlank(id)){
			return ;
		}
		String sql  = "delete from ixin_topic_comment where id=? ";
		
		jdbcTemplate.update(sql, id);
		
		
	}
}
