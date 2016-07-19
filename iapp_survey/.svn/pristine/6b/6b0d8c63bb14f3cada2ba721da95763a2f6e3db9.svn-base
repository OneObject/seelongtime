package com.longtime.app.ixin.mgr.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.dao.IRewardDao;
import com.longtime.app.ixin.mgr.model.ApplyRewardRecord;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.RewardCardItem;
import com.longtime.app.ixin.mgr.model.RewardExplain;
import com.longtime.app.ixin.mgr.model.RewardItem;
import com.longtime.app.ixin.mgr.model.RewardResultVO;
import com.longtime.app.ixin.mgr.model.RewardRuleContainer;
import com.longtime.app.ixin.protal.activity.vo.ApplyRewardVO;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

@Repository("rewardDao")
public class RewardDaoImpl implements IRewardDao {

	@Resource(name="ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public RewardActivity queryById(String id) {
		// TODO Auto-generated method stub
		String sql = "select * from ixin_reward_info where id=? and isDelete=0";
		List<RewardActivity> list = jdbcTemplate.query(sql, new Object[]{id}, new RewardRowMapper());
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean save(RewardActivity reward) {
		
		reward.setCreator(LoginSessionHelper.getThreadLocalUid());
		reward.setCreatorName(LoginSessionHelper.getThreadLocalUname());
		reward.setCreateDate(System.currentTimeMillis());
		
		String sql = "insert into ixin_reward_info(id, title1, content1, picUrl1, " +
				"createDate, startDate, endDate, type, replyKeys, replyContent, " +
				"isCreateFinish, isDelete, domain,title2,content2,picUrl2,creator,creatorName ) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[]{reward.getId(), reward.getExplain1().getTitle(), 
				reward.getExplain1().getContent(), reward.getExplain1().getPicUrl(), 
				reward.getCreateDate(), reward.getStartDate(), reward.getEndDate(), 
				reward.getRewardType(), reward.getKey(), reward.getReplyContent(), 
				reward.getIsCreateFinish(), reward.getIsDelete(), reward.getDomain(),reward.getExplain2().getTitle(),reward.getExplain2().getContent(),reward.getExplain2().getPicUrl(),reward.getCreator(),reward.getCreatorName()};
		try{
			jdbcTemplate.update(sql, params);
		} catch (DataAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public boolean update(RewardActivity reward) {
		// TODO Auto-generated method stub
		reward.setUpdater(LoginSessionHelper.getThreadLocalUid());
		reward.setUpdaterName(LoginSessionHelper.getThreadLocalUname());
		reward.setUpdatetime(System.currentTimeMillis());
		String sql = "update ixin_reward_info set title1=?,title2=?,content1=?," +
				"content2=?,picUrl1=?,picUrl2=?,startDate=?,endDate=?," +
				"replyKeys=?,replyContent=?,maxAttendNum=?,rewardRate=?,showRewardNum=?," +
				"isCreateFinish=?,type=?,updater=?,updaterName=?,updatetime=? where id=?"; 
		Object[] params = new Object[]{reward.getExplain1().getTitle(), reward.getExplain2().getTitle(), 
				reward.getExplain1().getContent(), reward.getExplain2().getContent(), 
				reward.getExplain1().getPicUrl(), reward.getExplain2().getPicUrl(),
				reward.getStartDate(), reward.getEndDate(), reward.getKey(), reward.getReplyContent(), 
				reward.getMaxAttendNum(), reward.getRewardRate(), reward.getShowRewardNum(), 
				reward.getIsCreateFinish(),reward.getRewardType(),reward.getUpdater(),reward.getUpdaterName(),reward.getUpdatetime(), reward.getId()};
		try{
			jdbcTemplate.update(sql, params);
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public boolean save(RewardItem item) {
		// TODO Auto-generated method stub
		String sql = "";
		Object[] params = null;
		if(item instanceof RewardCardItem){
			RewardCardItem cardAward = (RewardCardItem)item;
			sql = "insert into ixin_reward_card_award(id, containerId, title, content, num, remainingNum, weight) value(?,?,?,?,?,?,?)";
			params = new Object[]{cardAward.getId(), cardAward.getContainerId(), cardAward.getTitle(), 
					cardAward.getContent(), cardAward.getNum(), cardAward.getRemainingNum(), cardAward.getWeight()};
		}
		try{
			jdbcTemplate.update(sql, params);
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public List<RewardActivity> query(String domain, int currPage, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select * from ixin_reward_info where domain=? and isDelete=0 and isCreateFinish=1 order by createDate desc limit ?,?";
		List<RewardActivity> list = jdbcTemplate.query(sql, new Object[]{domain, (currPage-1)*pageSize, pageSize}, new RewardRowMapper());
		return list;
	}
	
	class RewardRowMapper implements RowMapper<RewardActivity> {

		@Override
		public RewardActivity mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			RewardActivity reward = new RewardActivity();
			reward.setId(rs.getString("id"));
			reward.setCreateDate(rs.getLong("createDate"));
			reward.setStartDate(rs.getLong("startDate"));
			reward.setEndDate(rs.getLong("endDate"));
			reward.setKey(rs.getString("replyKeys"));
			reward.setReplyContent(rs.getString("replyContent"));
			reward.setRewardType(rs.getString("type"));
			reward.setMaxAttendNum(rs.getInt("maxAttendNum"));
			String rate = rs.getString("rewardRate");
			double rewardRate = Double.parseDouble(rate);
			reward.setRewardRate(rewardRate);
			reward.setShowRewardNum(rs.getInt("showRewardNum"));
			reward.setIsCreateFinish(rs.getInt("isCreateFinish"));
			reward.setDomain(rs.getString("domain"));
			reward.setIsDelete(rs.getInt("isDelete"));
			RewardExplain explain1 = new RewardExplain(rs.getString("title1"), 
				rs.getString("content1"), rs.getString("picUrl1"));
			RewardExplain explain2 = new RewardExplain(rs.getString("title2"), 
				rs.getString("content2"), rs.getString("picUrl2"));
			reward.setExplain1(explain1);
			reward.setExplain2(explain2);
			reward.setActivityId(rs.getString("activityId"));
			reward.setCreatorName(rs.getString("creatorName"));
			reward.setCreator(rs.getString("creator"));
			return reward;
		}
		
	}
	
	class CardAwardRowMapper implements RowMapper<RewardCardItem> {

		@Override
		public RewardCardItem mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			RewardCardItem award = new RewardCardItem();
			award.setId(rs.getString("id"));
			award.setContainerId(rs.getString("containerId"));
			award.setTitle(rs.getString("title"));
			award.setContent(rs.getString("content"));
			award.setNum(rs.getInt("num"));
			award.setRemainingNum(rs.getInt("remainingNum"));
			award.setWeight(rs.getInt("weight"));
			return award;
		}
	}
	
	class RecordRowMapper implements RowMapper<ApplyRewardRecord> {

		@Override
		public ApplyRewardRecord mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			ApplyRewardRecord record = new ApplyRewardRecord();
			record.setId(rs.getString("id"));
			record.setRewardId(rs.getString("rewardId"));
			record.setApplyDate(rs.getLong("applyDate"));
			record.setAwardId(rs.getString("awardId"));
			record.setIsWining(rs.getInt("isWining"));
			record.setUserId(rs.getString("userId"));
			record.setSncode(rs.getString("sncode"));
			record.setPhone(rs.getString("phone"));
			record.setCreatorName(rs.getString("creatorName"));
			return record;
		}
	}

	@Override
	public List<RewardCardItem> queryAwards(String containerId) {
		// TODO Auto-generated method stub
		String sql = "select * from ixin_reward_card_award where containerId=? order by weight asc";
		List<RewardCardItem> items = jdbcTemplate.query(sql, new Object[]{containerId}, new CardAwardRowMapper());
		return items;
	}
	
	@Override
	public RewardCardItem queryAwardById(String id) {
		// TODO Auto-generated method stub
		String sql = "select * from ixin_reward_card_award where id=?";
		List<RewardCardItem> items = jdbcTemplate.query(sql, new Object[]{id}, new CardAwardRowMapper());
		if(null != items && !items.isEmpty()) {
			return items.get(0);
		}
		return null;
	}

	@Override
	public int queryAwardsNum(String containerId) {
		// TODO Auto-generated method stub
		String sql = "select sum(remainingNum) as count from ixin_reward_card_award where containerId=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{containerId}, new RowMapper<Integer>(){

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				int num = rs.getInt("count");
				return num;
			}
			
		});
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return 0;
	}

	@Override
	public boolean saveRecord(ApplyRewardRecord record) {
		// TODO Auto-generated method stub
		String sql = "insert into ixin_reward_record(id, userId, rewardId,containerId, awardId, isWining, applyDate, phone, sncode) " +
				"value(?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[]{record.getId(), record.getUserId(), record.getRewardId(), record.getContainerId(),
				record.getAwardId(), record.getIsWining(), record.getApplyDate(), record.getPhone(), record.getSncode()};
		try{
			jdbcTemplate.update(sql, params);
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public boolean updateRecord(ApplyRewardRecord record) {
		// TODO Auto-generated method stub
		String sql = "update ixin_reward_record set awardId=?,isWining=?,phone=?,sncode=? where id=?";
		Object[] params = new Object[]{record.getAwardId(), record.getIsWining(), 
				record.getPhone(), record.getSncode(), record.getId()};
		try{
			jdbcTemplate.update(sql, params);
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public int queryApplyCount(String rewardId,String containerId, String userId) {
		// TODO Auto-generated method stub
		String sql = "select count(id) as count from ixin_reward_record where rewardId=? and containerId=? and userId=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{rewardId,containerId, userId}, new RowMapper<Integer>(){

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				int num = rs.getInt("count");
				return num;
			}
			
		});
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return 0;
	}

	@Override
	public boolean cutAwardRemainingNum(RewardCardItem award) {
		// TODO Auto-generated method stub
		String sql = "update ixin_reward_card_award set remainingNum=? where id=?";
		Object[] params = new Object[]{award.getRemainingNum() - 1, award.getId()};
		try{
			jdbcTemplate.update(sql, params);
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public ApplyRewardRecord queryRecord(String id) {
		// TODO Auto-generated method stub
		String sql = "select * from ixin_reward_record where id=?";
		List<ApplyRewardRecord> list = jdbcTemplate.query(sql, new Object[]{id}, new RecordRowMapper());
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public RewardActivity queryByKeys(String keys,String domain) {
		// TODO Auto-generated method stub
		String sql = "select * from ixin_reward_info where isDelete=0 and replyKeys=? and domain=? ";
		List<RewardActivity> list = jdbcTemplate.query(sql, new Object[]{keys,domain}, new RewardRowMapper());
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<RewardActivity> queryByDate(String domain, long nowDate) {
		String sql = "select * from ixin_reward_info where domain=? and isDelete=0 " +
				"and isCreateFinish=1 and endDate>? order by createDate desc";
		List<RewardActivity> list = jdbcTemplate.query(sql, new Object[]{domain, nowDate}, new RewardRowMapper());
		return list;
	}

	@Override
	public List<RewardResultVO> queryWiningRecord(String rewardId, int currPage, int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select userId, title, content, applyDate, phone,sncode,base_uid from " +
				"ixin_reward_record, ixin_reward_card_award where ixin_reward_record.rewardId=? and " +
				"isWining=1 and ixin_reward_record.awardId=ixin_reward_card_award.id " +
				"order by applyDate desc limit ?,?";
		List<RewardResultVO> list = jdbcTemplate.query(sql, new Object[]{rewardId, (currPage-1)*pageSize, pageSize}, 
			new RowMapper<RewardResultVO>(){

			@Override
			public RewardResultVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				RewardResultVO result = new RewardResultVO();
				result.setUserId(rs.getString("userId"));
				result.setTitle(rs.getString("title"));
				result.setContent(rs.getString("content"));
				result.setApplyDate(rs.getLong("applyDate"));
				result.setPhone(rs.getString("phone"));
				result.setSncode(rs.getString("sncode"));
				result.setBaseUid(rs.getString("base_uid"));
				return result;
			}
		});
		return list;
	}
	
	@Override
	public ApplyRewardVO queryWiningRecordByUid(String rewardId, String uid) {
		// TODO Auto-generated method stub
		String sql = "select ixin_reward_record.id, userId, awardId, title, content, applyDate, phone,sncode from " +
				"ixin_reward_record, ixin_reward_card_award where ixin_reward_record.rewardId=? and " +
				"isWining=1 and ixin_reward_record.awardId=ixin_reward_card_award.id " +
				"and ixin_reward_record.userId=?";
		List<ApplyRewardVO> list = jdbcTemplate.query(sql, new Object[]{rewardId, uid}, 
			new RowMapper<ApplyRewardVO>(){

			@Override
			public ApplyRewardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				ApplyRewardVO result = new ApplyRewardVO();
				result.setId(rs.getString("id"));
				result.setUserId(rs.getString("userId"));
				result.setAwardTitle(rs.getString("title"));
				result.setAwardContent(rs.getString("content"));
				result.setPhone(rs.getString("phone"));
				result.setSncode(rs.getString("sncode"));
				result.setAwardId(rs.getString("awardId"));
				return result;
			}
		});
		if(list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public int queryWinCount(String rewardId) {
		// TODO Auto-generated method stub
		String sql = "select count(id) as count from ixin_reward_record where rewardId=? and isWining=1";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{rewardId}, new RowMapper<Integer>(){

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				int num = rs.getInt("count");
				return num;
			}
			
		});
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return 0;
	}
	
	@Override
	public boolean deleteReward(String rewardId) {
		String sql = "update ixin_reward_info set isDelete=1 where id=?";
		try{
			jdbcTemplate.update(sql, new Object[]{rewardId});
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public int queryRewardCount(String domain) {
		// TODO Auto-generated method stub
		String sql = "select count(id) as count from ixin_reward_info where isDelete=0 and domain=? and isCreateFinish=1";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain}, new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				int num = rs.getInt("count");
				return num;
			}
			
		});
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return 0;
	}
	
	@Override
	public boolean updateAward(RewardCardItem award) {
		// TODO Auto-generated method stub
		String sql = "update ixin_reward_card_award set title=?,content=?,num=?,remainingNum=?,weight=? where id=?";
		Object[] params = new Object[]{award.getTitle(), award.getContent(), award.getNum(), 
				award.getRemainingNum(), award.getWeight(), award.getId()};
		try{
			jdbcTemplate.update(sql, params);
		}catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public boolean deleteAwardById(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from ixin_reward_card_award where id=?";
		try{
			jdbcTemplate.update(sql, new Object[]{id});
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public RewardRuleContainer queryRuleContainer(String rewardId) {
		String sql = "SELECT * from ixin_reward_rule_container where rewardId=? and startTime<=? and endTime>? ";
		long current = System.currentTimeMillis();
		List<RewardRuleContainer> list = jdbcTemplate.query(sql, new Object[]{rewardId,current,current}, new RewardRuleContainerMapper());
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		if(list.size() == 1){
			return list.get(0);
		}
		RewardRuleContainer container = list.get(0);
		for(RewardRuleContainer item : list){
			if(item.getStartTime()<container.getStartTime()){
				container = item;
			}
		}
		return container;
	}
	
	private class RewardRuleContainerMapper implements RowMapper<RewardRuleContainer>{
		
		@Override
		public RewardRuleContainer mapRow(ResultSet rs, int arg1)
				throws SQLException {
			RewardRuleContainer container = new RewardRuleContainer();
			container.setId(rs.getString("id"));
			container.setRewardId(rs.getString("rewardId"));
			container.setMaxAttendNum(rs.getInt("maxAttendNum"));
			container.setRewardRate(rs.getDouble("rewardRate"));
			container.setStartTime(rs.getLong("startTime"));
			container.setEndTime(rs.getLong("endTime"));
			container.setDomain(rs.getString("domain"));
			return container;
		}
	}

	@Override
	public RewardRuleContainer getRuleContainerById(String containerId) {
		String sql = "SELECT * from ixin_reward_rule_container where id=? ";
		List<RewardRuleContainer> list = jdbcTemplate.query(sql, new Object[]{containerId}, new RewardRuleContainerMapper());
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list.get(0);
	}

	@Override
	public boolean save(RewardRuleContainer container) {
		String sql = "insert into ixin_reward_rule_container(id, rewardId, rewardRate, maxAttendNum,startTime, endTime,domain) value(?,?,?,?,?,?,?)";
		Object[] params = new Object[]{container.getId(),container.getRewardId(),container.getRewardRate(),container.getMaxAttendNum(),container.getStartTime(),container.getEndTime(),container.getDomain()};
		try{
			jdbcTemplate.update(sql, params);
		} catch (DataAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<RewardRuleContainer> getRewardRuleContainers(String rewardId) {
		String sql = "SELECT * from ixin_reward_rule_container where rewardId=? ";
		List<RewardRuleContainer> list = jdbcTemplate.query(sql, new Object[]{rewardId}, new RewardRuleContainerMapper());
		if(CollectionUtils.isEmpty(list)){
			return null;
		}
		return list;
	}

	@Override
	public boolean updateContainer(RewardRuleContainer container) {
		String sql = "update ixin_reward_rule_container set rewardRate=?,maxAttendNum=?,startTime=?,endTime=? where id=?"; 
		Object[] params = new Object[]{container.getRewardRate(),container.getMaxAttendNum(),container.getStartTime(),container.getEndTime(),container.getId()};
		try{
			jdbcTemplate.update(sql, params);
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteRewardRuleContainer(String id) {
		String sql = "delete from ixin_reward_rule_container where id=?";
		try{
			jdbcTemplate.update(sql, new Object[]{id});
		} catch(DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public int queryRewardCountHasKey(String domain) {
		String sql = "select count(id) as count from ixin_reward_info where isDelete=0 and domain=? and isCreateFinish=1 and replyKeys is not null";
		List<Integer> list = jdbcTemplate.query(sql, new Object[]{domain}, new RowMapper<Integer>(){
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				int num = rs.getInt("count");
				return num;
			}
		});
		if(null != list && !list.isEmpty()) {
			return list.get(0);
		}
		return 0;
	}

	@Override
	public List<RewardActivity> queryHasKey(String domain, int currPage,
			int pageSize) {
		String sql = "select * from ixin_reward_info where domain=? and isDelete=0 and isCreateFinish=1 order by createDate desc limit ?,?";
		List<RewardActivity> list = jdbcTemplate.query(sql, new Object[]{domain, (currPage-1)*pageSize, pageSize}, new RewardRowMapper());
		return list;
	}

	@Override
	public List<RewardActivity> queryByPage(String name, String domain,
			Page page) {
		String sql="select * from ixin_reward_info where title2 like ? and domain=? limit ?,? ";
		
		List<RewardActivity> list = jdbcTemplate.query(sql, new Object[]{"%"+name+"%",domain,(page.getCurrent_page()-1)*page.getPage_size(),page.getPage_size()}, new RewardRowMapper());
		
		if(null != list && !list.isEmpty()) {
			return  list;
		}
		return null;
	}

	@Override
	public List<RewardActivity> getRewardByDomain(String domain,
			int currentpage, int pagesize, String param) {
		
		StringBuilder sb=new StringBuilder("select * from ixin_reward_info where 1=1");
		List<Object> objects=Lists.newArrayList();
		if(StringUtils.isNotBlank(param)){
			
		}
		
		sb.append(" and domain=?");
		objects.add(domain);
		sb.append(" and isDelete=0 and isCreateFinish=1");
		sb.append(" and endDate>?");
		objects.add(System.currentTimeMillis());
		sb.append(" order by createDate desc");
		sb.append(" limit ?,?");
		objects.add((currentpage-1)*pagesize);
		objects.add(pagesize);
		
		List<RewardActivity> list = jdbcTemplate.query(sb.toString(),objects.toArray(), new RewardRowMapper());
		return list;
	}

	@Override
	public int getRewardCount(String domain, String param) {
		StringBuilder sb=new StringBuilder("select count(*) as num from ixin_reward_info where 1=1");
		List<Object> objects=Lists.newArrayList();
		if(StringUtils.isNotBlank(param)){
			
		}
		
		sb.append(" and domain=?");
		objects.add(domain);
		sb.append(" and endDate>?");
		objects.add(System.currentTimeMillis());
		
		return this.jdbcTemplate.queryForInt(sb.toString(),objects.toArray());
	}
	
	
	
	
	
	
	
}
