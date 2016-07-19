package com.longtime.app.ixin.mgr.vote.dao.impl;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.longtime.app.base.model.UserVo;
import com.longtime.app.ixin.mgr.utils.Constants;
import com.longtime.app.ixin.mgr.utils.DBUtils;
import com.longtime.app.ixin.mgr.vote.dao.VoteDao;
import com.longtime.app.ixin.mgr.vote.dao.VoteOptionDao;
import com.longtime.app.ixin.mgr.vote.model.OptionEntity;
import com.longtime.app.ixin.mgr.vote.model.QuestionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteOptionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;
import com.longtime.app.ixin.mgr.vote.vo.OptionVO;
import com.longtime.app.ixin.mgr.vote.vo.QuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteOptionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.dao.BaseDAOImpl;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.Sort;

import net.sf.json.JSONObject;

@Repository("voteDao")
public class VoteDaoImpl extends BaseDAOImpl<VoteEntity, String> implements VoteDao{
	
	private static final Logger logger = LoggerFactory.getLogger(VoteDaoImpl.class);
	
	@Resource(name = "voteOptionDao")
	private VoteOptionDao voteOptionDao;
	
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	private static List<String> excludes = new ArrayList<String>();
	static{
		excludes.add("voteNum");
		excludes.add("domain");
		excludes.add("del");
		excludes.add("id");
		excludes.add("creator");
		excludes.add("createtime");
		excludes.add("updater");
		excludes.add("updaterName");
	}
	
	
	
	@Override
	@Deprecated
	public String saveOrUpdateVoteEntity(VoteEntity vo) {
		
		String currentUid = LoginSessionHelper.getThreadLocalUid();
		
		String currentUname=LoginSessionHelper.getThreadLocalUname();
		try{
			vo.setCreator(currentUid);
			vo.setCreatorName(currentUname);
			List<Object> list = new ArrayList<Object>();
			StringBuffer mBuffer = new StringBuffer("insert into ixin_vote (");
			StringBuffer valueBuffer = new StringBuffer(" value (");
			Class<?> clazz = vo.getClass();
			Field[] fields = clazz.getDeclaredFields();
			try{
				PropertyDescriptor descriptor = null;
				for (Field field : fields) {
					if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
						continue;
					}
					mBuffer.append(field.getName()).append(",");
					valueBuffer.append("?").append(",");
					descriptor = new PropertyDescriptor(field.getName(), clazz);
					list.add(descriptor.getReadMethod().invoke(vo));
				}
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			mBuffer.replace(mBuffer.length()-1, mBuffer.length(), ")");
			valueBuffer.replace(valueBuffer.length()-1, valueBuffer.length(), ")");
			mBuffer.append(valueBuffer);
			jdbcTemplate.update(mBuffer.toString(),list.toArray());
			return vo.getId();
		}catch(Exception e){
			vo.setUpdater(currentUid);
			vo.setUpdaterName(currentUname);
			vo.setUpdatetime(System.currentTimeMillis());
			Class<?> clazz = vo.getClass();
			StringBuffer mBuffer = new StringBuffer("update ixin_vote set");
			Field[] fields = clazz.getDeclaredFields();
			List<Object> list = new ArrayList<Object>();
			PropertyDescriptor descriptor = null;
			try{
				for (Field field : fields) {
					if(excludes.contains(field.getName())){
						continue;
					}
					if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
						continue;
					}
					mBuffer.append(" ").append(field.getName()).append("=?,");
					descriptor = new PropertyDescriptor(field.getName(), clazz);
					list.add(descriptor.getReadMethod().invoke(vo));
				}
				mBuffer.replace(mBuffer.length()-1, mBuffer.length(), " where id=?");
				list.add(vo.getId());
				jdbcTemplate.update(mBuffer.toString(),list.toArray());
				return vo.getId();
				}catch(Exception es){
					es.printStackTrace();
					return null;
				}
		}
		
	}
	
	
	@Override
	public String saveOrUpdateQuestionEntity(QuestionEntity questionEntity) {
		try{
			Class<?> clazz = questionEntity.getClass();
			Field[] fields = clazz.getDeclaredFields();
			StringBuffer mBuffer = new StringBuffer("insert into ixin_question (");
			StringBuffer valBuffer = new StringBuffer(" value (");
			List<Object> list = new ArrayList<Object>();
			PropertyDescriptor descriptor = null;
			try{
				for (Field field : fields) {
					if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
						continue;
					}
					mBuffer.append(field.getName()).append(",");
					valBuffer.append("?,");
					descriptor = new PropertyDescriptor(field.getName(), clazz);
					list.add(descriptor.getReadMethod().invoke(questionEntity));
				}
				mBuffer.replace(mBuffer.length()-1, mBuffer.length(), ")");
				valBuffer.replace(valBuffer.length()-1, valBuffer.length(), ")");
				mBuffer.append(valBuffer);
				
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			jdbcTemplate.update(mBuffer.toString(),list.toArray());
			return questionEntity.getQid();
		}catch(Exception e){
			String sql = "update ixin_question set qtitle=? where qid=?";
			jdbcTemplate.update(sql,questionEntity.getQtitle(),questionEntity.getQid());
			return questionEntity.getQid();
		}
		
	}

	@Override
	public void saveOrUpdateOptionEntity(OptionEntity optionEntity) {
		try{
			Class<?> clazz = optionEntity.getClass();
			Field[] fields = clazz.getDeclaredFields();
			StringBuffer mBuffer = new StringBuffer("insert into ixin_option (");
			StringBuffer valBuffer = new StringBuffer(" value (");
			List<Object> list = new ArrayList<Object>();
			PropertyDescriptor descriptor = null;
			try{
				for (Field field : fields) {
					if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
						continue;
					}
					mBuffer.append(field.getName()).append(",");
					valBuffer.append("?,");
					descriptor = new PropertyDescriptor(field.getName(), clazz);
					list.add(descriptor.getReadMethod().invoke(optionEntity));
				}
				mBuffer.replace(mBuffer.length()-1, mBuffer.length(), ")");
				valBuffer.replace(valBuffer.length()-1, valBuffer.length(), ")");
				mBuffer.append(valBuffer);
				
			}catch(Exception e){
				e.printStackTrace();
			}
			jdbcTemplate.update(mBuffer.toString(),list.toArray());
		}catch(Exception e){
			String sql = "update ixin_option set ocontent=?,ocoverPath=?,ofileId=? where oid=?";
			jdbcTemplate.update(sql,optionEntity.getOcontent(),optionEntity.getOcoverPath(),optionEntity.getOfileId(),optionEntity.getOid());
		}
		
	}

	@Override
	public void setVoteNoDel(String voteId) {
		String sql = "update ixin_vote set del=0 where id=?";
		jdbcTemplate.update(sql,voteId);
	}
	
	@Override
	public int getVoteTotalSize(String domain) {
		String sql = "select count(*) c from ixin_vote where domain=? and del=0";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain},new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				return rs.getInt("c");
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return 0;
	}

	@Override
	public List<VoteVO> queryByPage(int pageSize, int currPage, String domain) {
		String sql = "select * from ixin_vote where domain=? and del=0 order by createTime desc limit ?,?";
		
		return jdbcTemplate.query(sql, new Object[]{domain,(currPage-1)*pageSize,pageSize},new  VoteVORowMapper());
	}
	
	

	public List<VoteVO> queryByPage(int pageSize, int currPage, String domain,int surveyOrvote) {
		String sql = "select * from ixin_vote where domain=? and del=0 and surveyOrvote="+surveyOrvote+" order by weight desc limit ?,?";
		
		return jdbcTemplate.query(sql, new Object[]{domain,(currPage-1)*pageSize,pageSize},new  VoteVORowMapper());
	}
	@Override
	public com.longtime.common.utils.ResultSet<VoteVO> queryByPage(Page page, String domain,String name,int surveyOrvote) {
		
		List<Object> param = Lists.newArrayList();
		StringBuilder sb = new StringBuilder(" from ixin_vote where domain=? and surveyOrvote=?");
		
		param.add(domain);
		param.add(surveyOrvote);
		if(StringUtils.isNotBlank(name)){
			sb.append(" and title like ?");
			param.add(String.format("%%%s%%", StringUtils.trim(name)));
		}
		
		sb.append(" and del=0 ");
		
		
		Long count = jdbcTemplate.queryForLong(String.format("select count(*) %s ", sb.toString()), param.toArray());
		
		page.setTotal_size(count.intValue());
		
		if(0==count){
			return com.longtime.common.utils.ResultSet.emptyResultSet();
		}
		
		
		sb.append("order by weight desc limit ?,?");
		param.add(page.getStart());
		param.add(page.getPage_size());
		
		List<VoteVO> list =  jdbcTemplate.query(String.format("select *  %s ", sb.toString()), param.toArray(),new  VoteVORowMapper());
		com.longtime.common.utils.ResultSet<VoteVO> rs = new com.longtime.common.utils.ResultSet<VoteVO>();
		rs.setItems(list);
		rs.setPage(page);
		return rs;
	}


	@Override
	public VoteVO getVoteVOFormVoteEntityById(String id) {
		String sql = "select * from ixin_vote where id=? and del=0";
		List<VoteVO> list = jdbcTemplate.query(sql, new Object[]{id},new  VoteVORowMapper());
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<QuestionVO> getQuestionVOSByVoteId(String voteId) {
		String sql = "select * from ixin_question where voteId=?";
		return jdbcTemplate.query(sql, new Object[]{voteId},new RowMapper<QuestionVO>(){
			@Override
			public QuestionVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				QuestionEntity entity = new QuestionEntity();
				Class<?> clazz = entity.getClass();
				Field[] fields = clazz.getDeclaredFields();
				PropertyDescriptor descriptor = null;
				try{
					for (Field field : fields) {
						if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
							continue;
						}
						descriptor = new PropertyDescriptor(field.getName(), clazz);
						descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
					}
				
				}catch(Exception e){
					e.printStackTrace();
				}
				return QuestionEntity.castToQuestionVO(entity);
			}
		});
	}

	@Override
	public List<OptionVO> getOptionVOByQID(String qid) {
		String sql = "select * from ixin_option where questionId=?";
		return jdbcTemplate.query(sql, new Object[]{qid},new RowMapper<OptionVO>(){
			@Override
			public OptionVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				OptionEntity entity = new OptionEntity();
				Class<?> clazz = entity.getClass();
				Field[] fields = clazz.getDeclaredFields();
				PropertyDescriptor descriptor = null;
				try{
					for (Field field : fields) {
						if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
							continue;
						}
						descriptor = new PropertyDescriptor(field.getName(), clazz);
						descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return OptionEntity.castToOptionVO(entity);
			}
		});
	}

	@Override
	public void delOption(String optionId) {
		String sql = "delete from ixin_option where oid=?";
		jdbcTemplate.update(sql,optionId);
	}

	@Override
	public void del(String voteId) {
		String sql = "update  ixin_vote set del=1 where id=?";
		jdbcTemplate.update(sql,voteId);
	}

	@Override
	public int getUserVoteInfo(String voteId, String uid) {
		String sql = "select count(*) c from ixin_user_vote where voteId=? and base_uid=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{voteId,uid},new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
			
				return rs.getInt(1);
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return 0;
	}
	@Override
	public List<VoteOptionEntity> getUserOptionInfo(String questionId, String openId) {
		String sql = "select *  from ixin_vote_option where voteQuestionId=? and openId=?";
		  List<VoteOptionEntity> list = DBUtils.queryList(new VoteOptionEntity(), sql, jdbcTemplate, questionId,openId);
		return list;
	}

	@Override
	public void addUserVoteInfo(String voteId) throws Exception{
		try{
		String sql = "update ixin_vote set voteNum = voteNum+1 where id=?";
		jdbcTemplate.update(sql,voteId);
		}catch(Exception e){
			throw new Exception(e);
		}
	}

	@Override
	public void addUserVoteQuestion(String qId) throws Exception{
		try{
			String sql = "update ixin_question set voteNum = voteNum+1 where qid=?";
			jdbcTemplate.update(sql,qId);
		}catch(Exception e){
			throw new Exception(e);
		}
	}

	@Override
	public void addUserVoteOption(String oId)throws Exception {
		try{
			String sql = "update ixin_option set voteNum = voteNum+1 where oid=?";
			jdbcTemplate.update(sql,oId);
		}catch(Exception e){
			throw new Exception(e);
		}
	}

	@Override
	public void addUserVote(String voteId,String uid, String openId) throws Exception{
		try{
			String sql = "insert into ixin_user_vote (voteId,userId,timestamp,base_uid) value (?,?,?,?)";
			jdbcTemplate.update(sql,voteId,openId,System.currentTimeMillis(),uid);
		}catch(Exception e){
			throw new Exception(e);
		}
	}
	@Override
	public List<ItemArticle> queryItemArticle(int itemNum,final String coverBasePath,final String suffix,final String voteBasePath,final String openId,String domain) {
		String sql = "select * from ixin_vote  where endTime>? and domain=? and del=0  order by startTime desc limit 0,?";
		return jdbcTemplate.query(sql, new Object[]{System.currentTimeMillis(),domain,itemNum},new RowMapper<ItemArticle>(){

			@Override
			public ItemArticle mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ItemArticle itemArticle = new ItemArticle();
				itemArticle.setCreator(rs.getString("creator"));
				itemArticle.setId(rs.getString("id"));
				itemArticle.setTitle(rs.getString("title"));
				itemArticle.setCreatorName(rs.getString("creatorName"));
				itemArticle.setDescription(rs.getString("summary"));
				itemArticle.setPicUrl(String.format("%s%s%s", coverBasePath,rs.getString("coverPath"),suffix));
				itemArticle.setUrl(String.format("%svoteId=%s&openId=%s&domain=%s&fdomain=%s",voteBasePath,rs.getString("id"),openId,rs.getString("domain"),rs.getString("domain")));
				
				return itemArticle;
			}
		});
	}

	@Override
	public ItemArticle queryItemArticleByKewWords(String kewwords,
			final String coverBasePath,final String suffix, final String voteBasePath,
			final String openId,String domain) {
		String sql = "select * from ixin_vote where keywords=? and del=0 and domain=? ";
		List<ItemArticle> list = jdbcTemplate.query(sql, new Object[]{kewwords,domain},new RowMapper<ItemArticle>(){

			@Override
			public ItemArticle mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ItemArticle itemArticle = new ItemArticle();
				
				itemArticle.setId(rs.getString("id"));
				itemArticle.setTitle(rs.getString("title"));
				itemArticle.setDescription(rs.getString("summary"));
				itemArticle.setPicUrl(String.format("%s%s%s", coverBasePath,rs.getString("coverPath"),suffix));
				itemArticle.setUrl(String.format("%svoteId=%s&openId=%s&domain=%s&fdomain=%s",voteBasePath,rs.getString("id"),openId,rs.getString("domain"),rs.getString("domain")));
				
				return itemArticle;
			}
		});
		if(list == null || list.size()<=0){
			return null;
		}
		return list.get(0);
	}
	class VoteRowMapper implements RowMapper<VoteEntity> {

		@Override
		public VoteEntity mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			/*VoteEntity record = new VoteEntity();
			record.setId(rs.getString("id"));
			record.setCreateTime(rs.getLong("activityId"));
			record.setCreator(rs.getString("creator"));
			record.setCreatorName(rs.getString("CreatorName"));*/
			
			VoteEntity entity = new VoteEntity();
			Class<?> clazz = entity.getClass();
			Field[] fields = clazz.getDeclaredFields();
			PropertyDescriptor descriptor = null;
			try{
				for (Field field : fields) {
					
					if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
						continue;
					}
					descriptor = new PropertyDescriptor(field.getName(), clazz);
					descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
				}
			}catch(Exception e){
				logger.error("rowmapper due to error.", e);
			}
			return entity;
			
			
			//return record;
		}
	}
	
	public VoteEntity findbyid(String id){
		String sql="select * from ixin_vote where id=?";
		
		List<VoteEntity> list = jdbcTemplate.query(sql, new Object[] { id }, new VoteRowMapper());
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}
//使用try catch 做流程控制，太懒了
	@SuppressWarnings("unchecked")
	@Override
	public void saveOrUpdateStep1(VoteEntity entity) {
		
		
		String currentUid = LoginSessionHelper.getThreadLocalUid();
		String currentUname = LoginSessionHelper.getThreadLocalUname();
		
		String id = entity.getId();
		VoteEntity v = null;
		if(StringUtils.isNotBlank(id)){
			v=findbyid(entity.getId());
		}
					
		if(v==null){
			if(StringUtils.isBlank(id)){
				entity.setId(StringUtils.isBlank(entity.getId())?(String)IdGenerator.nextId32():entity.getId());
			}
			entity.setCreator(currentUid);
			entity.setCreatorName(currentUname);
			Map<String,Object> map = DBUtils.getInsertSql(entity, "ixin_vote", null);
			String sql = map.get("sql").toString();
			List<Object> insertVals = (List<Object>) map.get("insertVals");
			jdbcTemplate.update(sql,insertVals.toArray());
		}else{
			//VoteEntity v=findbyid(entity.getId());
			entity.setAuthor(v.getAuthor());
			entity.setCreator(v.getCreator());
			entity.setCreateTime(v.getCreateTime());
			entity.setCreatorName(v.getCreatorName());
			entity.setUpdater(currentUid);
			entity.setUpdaterName(currentUname);
			entity.setUpdatetime(System.currentTimeMillis());
			List<String> list = new ArrayList<String>();
			list.add("createTime");
			list.add("voteNum");
			list.add("weight");
			list.add("creator");
			list.add("creatorName");
			Map<String,Object> map = DBUtils.getUpdateSql(entity, "ixin_vote", list, "id");
			String sql = map.get("sql").toString();
			List<Object> updateVals = (List<Object>) map.get("updateVals");
			jdbcTemplate.update(sql,updateVals.toArray());
		 
	}
		}

	@SuppressWarnings("unchecked")
	@Override
	public void saveOrUpdateVoteQuestionEntity(VoteQuestionEntity entity) {
		try{
			Map<String,Object> map = DBUtils.getInsertSql(entity, "ixin_vote_question", null);
			String sql = map.get("sql").toString();
			List<Object> insertVals = (List<Object>) map.get("insertVals");
			jdbcTemplate.update(sql,insertVals.toArray());
		}catch(Exception e){
			List<String> list = new ArrayList<String>();
			list.add("voteNum");
			Map<String,Object> map = DBUtils.getUpdateSql(entity, "ixin_vote_question", list, "id");
			String sql = map.get("sql").toString();
			List<Object> updateVals = (List<Object>) map.get("updateVals");
			jdbcTemplate.update(sql,updateVals.toArray());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public void saveOrUpdateVoteOptionEntity(VoteOptionEntity optionEntity) {
		try{
			Map<String,Object> map = DBUtils.getInsertSql(optionEntity, "ixin_vote_option", null);
			String sql = map.get("sql").toString();
			List<Object> insertVals = (List<Object>) map.get("insertVals");
			jdbcTemplate.update(sql,insertVals.toArray());
		}catch(Exception e){
			List<String> list = new ArrayList<String>();
			list.add("voteNum");
			Map<String,Object> map = DBUtils.getUpdateSql(optionEntity, "ixin_vote_option", list, "id");
			String sql = map.get("sql").toString();
			List<Object> updateVals = (List<Object>) map.get("updateVals");
			jdbcTemplate.update(sql,updateVals.toArray());
		}
	}
	
	@Override
	public void saveAction(VoteActionDetailEntity voteActionDetailEntity) {
      	try{
      		Map<String,Object> map=DBUtils.getInsertSql(voteActionDetailEntity,"ixin_vote_action_detail",null);
      		String sql=map.get("sql").toString();
      		@SuppressWarnings("unchecked")
			List<Object> insertVals=(List<Object>) map.get("insertVals");
      		jdbcTemplate.update(sql,insertVals.toArray());
      	}catch (Exception e) {
		}
	}
	
	
	
	
	
	

	@Override
	public List<VoteQuestionVO> getVoteQuestionVOByVoteId(String voteId) {
		String sql = "select * from ixin_vote_question where voteId=? order by weight asc";
		List<VoteQuestionEntity> list = DBUtils.queryList(new VoteQuestionEntity(), sql, jdbcTemplate, voteId);
		List<VoteQuestionVO> result = new ArrayList<VoteQuestionVO>();
		if(CollectionUtils.isEmpty(list)){
			return result;
		}
		for (VoteQuestionEntity voteQuestionEntity : list) {
			VoteQuestionVO vo = VoteQuestionEntity.castToVoteQuestionVO(voteQuestionEntity);
			result.add(vo);
		}
		return result;
	}

	@Override
	public void deleteVoteQuestion(String voteQuestionId) {
		String sql = "delete from ixin_vote_question where id=?";
		jdbcTemplate.update(sql,voteQuestionId);
	}

	@Override
	public void delVoteOption(String voteQuestionId) {
		String sql = "delete from ixin_vote_option where voteQuestionId=?";
		jdbcTemplate.update(sql,voteQuestionId);
	}

	@Override
	public VoteQuestionVO getVoteQuestionVOById(String voteQuestionId) {
		String sql = "select * from ixin_vote_question where id=?";
		List<VoteQuestionEntity> list = DBUtils.queryList(new VoteQuestionEntity(), sql, jdbcTemplate, voteQuestionId);
		List<VoteQuestionVO> result = new ArrayList<VoteQuestionVO>();
		for (VoteQuestionEntity voteQuestionEntity : list) {
			VoteQuestionVO vo = VoteQuestionEntity.castToVoteQuestionVO(voteQuestionEntity);
			result.add(vo);
		}
		if(null!=result && result.size()>0){
			return result.get(0);
		}
		return null;
	}

	@Override
	public List<VoteOptionVO> getVoteOptionVOByQuestionId(String voteQuestionId) {
//		String sql = "select * from ixin_vote_option where voteQuestionId=? order by timestamp asc";
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("voteQuestionId", voteQuestionId);
		query.addOrder("timestamp", Sort.Order.ASC);
		com.longtime.common.utils.ResultSet<VoteOptionEntity> rs = voteOptionDao.list(query, null);
		List<VoteOptionEntity> list = rs.getItems();
		
		List<VoteOptionVO> result = new ArrayList<VoteOptionVO>();
		if(CollectionUtils.isEmpty(list)){
			return result;
		}
		for (VoteOptionEntity voteOptionEntity : list) {
			VoteOptionVO vo = VoteOptionEntity.castToVoteOptionVO(voteOptionEntity);
			result.add(vo);
		}
		return result;
	}

	@Override
	public void deleteVoteOption(String optionId) {
		String sql = "delete from ixin_vote_option where id=?";
		jdbcTemplate.update(sql,optionId);
	}

	@Override
	public void updateUserVoteNum(String voteId) {
		String sql = "update ixin_vote set voteNum = voteNum+1 where id=?";
		jdbcTemplate.update(sql,voteId);
	}

	@Override
	public String userVoteToOption(String optionId) {
		String sql = "update ixin_vote_option set voteNum = voteNum+1 where id=?";
		jdbcTemplate.update(sql,optionId);
		String querySql = "select voteQuestionId from ixin_vote_option where id=?";
		List<String> list = jdbcTemplate.query(querySql, new Object[]{optionId},new RowMapper<String>(){
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString(1);
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void userVoteToQuestion(String questionId) {
		String sql = "update ixin_vote_question set voteNum = voteNum+1 where id=?";
		jdbcTemplate.update(sql,questionId);
	}

	
	@Override
	public void updateQuestionCount(String questionId) {
		String sql = "update ixin_vote_question set voteNum = voteNum+1 where id=?";
		jdbcTemplate.update(sql,questionId);
	}
	
	@Override
	public  void updateOptionCount(String optionId){
		String sql = "update ixin_vote_option set voteNum = voteNum+1 where id=?";
		jdbcTemplate.update(sql,optionId);
	}
	
	
	
	@Override
	public int getVoteTotalSizeHasKey(String domain) {
		String sql = "select count(*) c from ixin_vote where domain=? and del=0 and keywords!='' ";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain},new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				return rs.getInt("c");
			}
		});
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		return 0;
	}

	@Override
	public List<VoteVO> queryByPageHasKey(int pageSize, int currPage,
			String domain) {
		String sql = "select * from ixin_vote where domain=? and del=0 and keywords!='' order by createTime desc limit ?,?";
		
		return jdbcTemplate.query(sql, new Object[]{domain,(currPage-1)*pageSize,pageSize},new  VoteVORowMapper());
	}
	
	public List<VoteActionDetailEntity> getVoteAction(String voteid){
		String sql="select * from ixin_vote_action_detail where voteid=?";
		List<VoteActionDetailEntity> list= jdbcTemplate.query(sql, new Object[]{voteid},new RowMapper<VoteActionDetailEntity>(){
			@Override
			public VoteActionDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteActionDetailEntity entity = new VoteActionDetailEntity();
				Class<?> clazz = entity.getClass();
				Field[] fields = clazz.getDeclaredFields();
				PropertyDescriptor descriptor = null;
				try{
					for (Field field : fields) {
						if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
							continue;
						}
						descriptor = new PropertyDescriptor(field.getName(), clazz);
						descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return entity;
			}
		});
		
		if(list!=null && list.size()>0){
			return list;
		}
		
		return null;
	}

	@Override
	public List<VoteActionDetailEntity> getSelfVoteAction(String openid,
			String voteid,String domain) {
		String sql="select * from ixin_vote_action_detail where openid=? and voteid=? and domain=? ";
		List<VoteActionDetailEntity> list= jdbcTemplate.query(sql, new Object[]{openid,voteid,domain},new RowMapper<VoteActionDetailEntity>(){
			@Override
			public VoteActionDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteActionDetailEntity entity = new VoteActionDetailEntity();
				Class<?> clazz = entity.getClass();
				Field[] fields = clazz.getDeclaredFields();
				PropertyDescriptor descriptor = null;
				try{
					for (Field field : fields) {
						if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
							continue;
						}
						descriptor = new PropertyDescriptor(field.getName(), clazz);
						descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return entity;
			}
		});
		
		if(list!=null && list.size()>0){
			return list;
		}
		
		return null;
	}

	@Override
	public List<VoteActionDetailEntity> getlist(String voteid,String domain) {
		
		String sql="SELECT u.username, u.`name`,o.`name` as oname, v.title as title,q.title as qtitle,q.id as questionid,d.optionid as answercontent FROM"+
				"ixin_vote v"+
				"LEFT JOIN ixin_vote_question q ON v.id =q.voteId"+
				"LEFT JOIN ixin_vote_action_detail d ON d.questionid = q.id"+
				"LEFT JOIN iapp_base_user u ON u.id = d.openid"+
				"LEFT JOIN iapp_base_organization o ON o.id = u.organization_id"+
				"where u.`enable`=1 and v.del=0 and d.voteid=? and d.domain=?";
		
		List<VoteActionDetailEntity> list= jdbcTemplate.query(sql, new Object[]{voteid,domain},new RowMapper<VoteActionDetailEntity>(){
			@Override
			public VoteActionDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteActionDetailEntity entity = new VoteActionDetailEntity();
				Class<?> clazz = entity.getClass();
				Field[] fields = clazz.getDeclaredFields();
				PropertyDescriptor descriptor = null;
				try{
					for (Field field : fields) {
						if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
							continue;
						}
						descriptor = new PropertyDescriptor(field.getName(), clazz);
						descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return entity;
			}
		});
		
		if(list!=null && list.size()>0){
			return list;
		}
		
		return null;
	}

	@Override
	public VoteActionDetailEntity getEntity(String voteid, String domain,
			String openid, String questionid) {
		
       String sql="select * from ixin_vote_action_detail where voteid=? and domain=? and questionid=? and openid=?";
		
		List<VoteActionDetailEntity> list= jdbcTemplate.query(sql, new Object[]{voteid,domain,questionid,openid},new RowMapper<VoteActionDetailEntity>(){
			@Override
			public VoteActionDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteActionDetailEntity entity = new VoteActionDetailEntity();
				Class<?> clazz = entity.getClass();
				Field[] fields = clazz.getDeclaredFields();
				PropertyDescriptor descriptor = null;
				try{
					for (Field field : fields) {
						if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
							continue;
						}
						descriptor = new PropertyDescriptor(field.getName(), clazz);
						descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return entity;
			}
		});
		
		if(list!=null && list.size()>0){
			return list.get(0);
		}
		
		return null;
		
		
		
	}

//	@Override
//	public Integer updateVoteActionDetailEntity(
//			VoteActionDetailEntity voteActionDetailEntity) {
//		Class<?> clazz = voteActionDetailEntity.getClass();
//		StringBuffer mBuffer = new StringBuffer("update ixin_vote_action_detail set");
//		Field[] fields = clazz.getDeclaredFields();
//		List<Object> list = new ArrayList<Object>();
//		PropertyDescriptor descriptor = null;
//		try{
//			for (Field field : fields) {
//				if(excludes.contains(field.getName())){
//					continue;
//				}
//				mBuffer.append(" ").append(field.getName()).append("=?,");
//				descriptor = new PropertyDescriptor(field.getName(), clazz);
//				list.add(descriptor.getReadMethod().invoke(voteActionDetailEntity));
//			}
//			mBuffer.replace(mBuffer.length()-1, mBuffer.length(), " where id=?");
//			list.add(voteActionDetailEntity.getId());
//			jdbcTemplate.update(mBuffer.toString(),list.toArray());
//			return voteActionDetailEntity.getId();
//			}catch(Exception es){
//				es.printStackTrace();
//				return null;
//			}
//		
//	}
	
	
	class VoteVORowMapper implements RowMapper<VoteVO>{
		@Override
		public VoteVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			VoteEntity entity = new VoteEntity();
			Class<?> clazz = entity.getClass();
			Field[] fields = clazz.getDeclaredFields();
			PropertyDescriptor descriptor = null;
			try{
				for (Field field : fields) {
					
					if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
						continue;
					}
					descriptor = new PropertyDescriptor(field.getName(), clazz);
					descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return VoteEntity.castToVoteVO(entity);
		}
	}
	
	
	@Override
	public long updateWeight(String qid,long weight){
		if(StringUtils.isBlank(qid) ){
			return -1;
		}
		String sql = "update ixin_vote_question set weight=? where id=?";
		this.jdbcTemplate.update(sql,weight,qid);
		return weight;
	}

	@Override
	public void deleteVoteOptionByQid(String questionId) {
		String sql = "delete from ixin_vote_option where voteQuestionId=?";
		jdbcTemplate.update(sql,questionId);
	}

	/**
	 * 修改投票和调研的排序值
	 */
	@Override
	public long updateVoteAndSurveyWeight(String vid, long weight) {
		if(StringUtils.isBlank(vid) ){
			return -1;
		}
		String sql = "update ixin_vote set weight=? where id=?";
		int result = this.jdbcTemplate.update(sql,weight,vid);
		return result;
	}
	
	public VoteVO queryVoteVOByUpOrDown(String domain,int surveyOrvote,long weight,String upOrDown,String voteId){
		String sql = "";
		if (StringUtils.isNotBlank(upOrDown)){
			if (upOrDown.equals("up")){
				
				sql = "select * from ixin_vote where domain=? and del=0 and surveyOrvote=? and weight >= ? order by weight asc limit 2";
			}else{
				sql = "select * from ixin_vote where domain=? and del=0 and surveyOrvote=? and weight <= ? order by weight desc limit 2";
			}
			List<VoteVO> list = this.jdbcTemplate.query(sql,new Object[]{domain,surveyOrvote,weight},new  VoteVORowMapper());
			if (CollectionUtils.isNotEmpty(list)&& !list.isEmpty()){
				for (int i = 0; i < list.size(); i++) {
					if (!list.get(i).getId().equals(voteId)){
						return list.get(i);
					}
				}
			}
		}
		return null;
	}
	
	@Override
	public List<VoteActionDetailEntity> list(String uid,String voteid){
		String sql="select * from ixin_vote_action_detail where uid=? and voteid=? ";
		List<VoteActionDetailEntity> list= jdbcTemplate.query(sql, new Object[]{uid,voteid},new RowMapper<VoteActionDetailEntity>(){
			@Override
			public VoteActionDetailEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				VoteActionDetailEntity entity = new VoteActionDetailEntity();
				Class<?> clazz = entity.getClass();
				Field[] fields = clazz.getDeclaredFields();
				PropertyDescriptor descriptor = null;
				try{
					for (Field field : fields) {
						if(Modifier.isStatic(field.getModifiers())){ //属性是static类型
							continue;
						}
						descriptor = new PropertyDescriptor(field.getName(), clazz);
						descriptor.getWriteMethod().invoke(entity, rs.getObject(field.getName()));
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return entity;
			}
		});
		
		if(null==list){
			return Collections.EMPTY_LIST;
		}
		return list;
	}

	@Override
	public List<UserVo> queryJoinUser(Page page,String domain, String voteid) {
		String sql="SELECT ibu.id AS baseid,ibu.username AS username,ibu.name AS name,ibu.mobile as mobile,ibu.temporary_mobile as temporary_mobile,v.timestamp as timestamp  FROM iapp_base_user ibu INNER  JOIN ixin_user_vote v ON v.base_uid=ibu.id WHERE v.voteId=? AND ibu.domain=? limit ?,?";
		// 已经参加的
		List<UserVo> joinUserlist = jdbcTemplate.query(sql, new RowMapper<UserVo>(){
			public UserVo mapRow(ResultSet rs, int rowNum) throws SQLException{
				UserVo vo = new UserVo();
				vo.setId(rs.getString("baseid"));
				vo.setUsername(rs.getString("username"));
				if (StringUtils.isBlank(rs.getString("username"))){
					vo.setUsername(rs.getString("name"));
				}
				vo.setName(rs.getString("name"));
				if (StringUtils.isBlank(rs.getString("name"))){
					vo.setName(rs.getString("username"));
				}
				vo.setMobile(rs.getString("mobile"));
				
				vo.setTemporaryMobile(rs.getString("temporary_mobile"));
				
				vo.setUpdatetime(rs.getLong("timestamp"));
				return vo;
			}
		},voteid,domain,page.getStart(),page.getPage_size());
		return joinUserlist;
	}

	@Override
	public List<UserVo> queryNoJoinUser(Page page,String domain,String voteid) {
		String sql = "select username,name ,id,mobile,temporary_mobile from iapp_base_user ibu where domain=? and ibu.id not in (SELECT base_uid FROM ixin_user_vote v   where v.voteid=? ) limit ?,?";
		List<UserVo> allUser = jdbcTemplate.query(sql, new RowMapper<UserVo>(){
			public UserVo mapRow(ResultSet rs, int rowNum) throws SQLException{
				UserVo vo = new UserVo();
				vo.setId(rs.getString("id"));
				vo.setUsername(rs.getString("username"));
				if (StringUtils.isBlank(rs.getString("username"))){
					vo.setUsername(rs.getString("name"));
				}
				vo.setName(rs.getString("name"));
				if (StringUtils.isBlank(rs.getString("name"))){
					vo.setName(rs.getString("username"));
				}
				vo.setMobile(rs.getString("mobile"));
				vo.setTemporaryMobile(rs.getString("temporary_mobile"));
				return vo;
			}
		},domain,voteid,page.getStart(),page.getPage_size());
		return allUser;
	}

	@Override
	public long getJoinUserCount(String domain, String voteid) {
		String sql="SELECT count(*) AS total FROM iapp_base_user ibu INNER  JOIN ixin_user_vote v ON v.base_uid=ibu.id WHERE v.voteId=? AND ibu.domain=?";
		List<Long> list = this.jdbcTemplate.query(sql,new RowMapper<Long>(){
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				long count = rs.getLong("total");
				return count;
			}
			
		},voteid,domain);
		if(CollectionUtils.isEmpty(list)){
			return 0L;
		}
		return list.get(0);
	}

	@Override
	public long getNoJoinUserCount(String domain,String voteid) {
		String sql = "select count(*) as total from iapp_base_user ibu where domain=? and ibu.id not in (select base_uid from ixin_user_vote where voteId=?)";
		List<Long> list = this.jdbcTemplate.query(sql,new RowMapper<Long>(){
			public Long mapRow(ResultSet rs, int rowNum) throws SQLException {
				long count = rs.getLong("total");
				return count;
			}
			
		},domain,voteid);
		if(CollectionUtils.isEmpty(list)){
			return 0L;
		}
		return list.get(0);
	}

	@Override
	public List<VoteEntity> querySurveyOrVoteList(int currentpage,int pagesize,String param,String domain, String search) {
		
		StringBuilder sb=new StringBuilder("select * from ixin_vote where 1=1 ");
		
		Map<String, Object> searchOptions=null;
		List<Object> list=Lists.newArrayList();
		if(StringUtils.isNotBlank(param)){
			JSONObject jsonObj = JSONObject.fromObject(param);
			searchOptions= (Map) jsonObj;
			if(searchOptions.get("surveyOrvote")!=null){
				list.add(searchOptions.get("surveyOrvote").toString());
				sb.append(" and surveyOrvote=?");
			}
			//list.add(searchOptions.get("title"));
			//sb.append(" and title=?");
		}
		if(StringUtils.isNotBlank(search)){
			sb.append(" and title like ?");
			list.add('%'+search+'%');
		}
		sb.append(" and del=?");
		list.add(Constants.NO_DEL);
		sb.append(" and domain=?");
		list.add(domain);
		sb.append(" order by createTime desc");
		sb.append(" limit ?,?");
		list.add((currentpage-1)*pagesize);
		list.add(pagesize);
		
		return this.jdbcTemplate.query(sb.toString(),list.toArray(),new RowMapper<VoteEntity>() {

			@Override
			public VoteEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				VoteEntity voteEntity=new VoteEntity();
				
				voteEntity.setCoverPath(rs.getString("coverPath"));
				voteEntity.setCreateTime(rs.getLong("createTime"));
				voteEntity.setDomain(rs.getString("domain"));
				voteEntity.setId(rs.getString("id"));
				voteEntity.setSummary(rs.getString("summary"));
				voteEntity.setTitle(rs.getString("title"));
				voteEntity.setSurveyOrvote(rs.getInt("surveyOrvote"));
				voteEntity.setCreator(rs.getString("creator"));
				return voteEntity;
			}
		});
	}
	

	@Override
	public long getSurveyOrVoteCount(String param, String domain,String search) {
		StringBuilder sb=new StringBuilder("select count(*) as total from ixin_vote ivo where ivo.domain=?");
		
		List<Object> list=Lists.newArrayList();
		list.add(domain);
		
		Map<String, Object> searchOptions=null;
		if(StringUtils.isNotBlank(param)){
			JSONObject jsonObj = JSONObject.fromObject(param);
			searchOptions= (Map) jsonObj;
		}
		if(searchOptions!=null && searchOptions.get("surveyOrvote")!= null){
			sb.append(" and ivo.surveyOrvote=?");
			list.add(searchOptions.get("surveyOrvote").toString());
		}
		if(StringUtils.isNotBlank(search)){
			sb.append(" and title like ?");
			list.add('%'+search+'%');
			}
	   sb.append(" and ivo.del=?");
	   list.add(Constants.NO_DEL);
		
		return this.jdbcTemplate.queryForInt(sb.toString(),list.toArray());
	}

	@Override
	public long updaterelase(String vid, int relase)
	{
		if(StringUtils.isBlank(vid) ){
			return -1;
		}
		String sql = "update ixin_vote set `isrelease`=? where id=?";
		System.out.println(sql);
		int result = this.jdbcTemplate.update(sql,relase,vid);
		return result;
	}

	@Override
	public long updateshowinlist(String vid, int showinlist)
	{
		if(StringUtils.isBlank(vid) ){
			return -1;
		}
		String sql = "update ixin_vote set showinlist=? where id=?";
		int result = this.jdbcTemplate.update(sql,showinlist,vid);
		return result;
	}

	@Override
	public long updateshowresult(String vid, int status)
	{
		if(StringUtils.isBlank(vid) ){
			return -1;
		}
		String sql = "update ixin_vote set showresult=? where id=?";
		int result = this.jdbcTemplate.update(sql,status,vid);
		return result;
	}

	
}
