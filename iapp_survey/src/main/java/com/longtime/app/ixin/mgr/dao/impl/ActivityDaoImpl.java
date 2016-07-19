package com.longtime.app.ixin.mgr.dao.impl;

import com.longtime.app.base.model.ActivityPersonVO;
import com.longtime.app.ixin.mgr.dao.IActivityDao;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecord;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecordVO;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("activityDao")
public class ActivityDaoImpl implements IActivityDao {

	private static final Logger logger = LoggerFactory
			.getLogger(ActivityDaoImpl.class);
	@Resource(name = "ixin_jdbcTemplate")
	private JdbcTemplate jdbcTemplate;

	@Override
	public boolean addActivity(ActivityInfo info) {
		info.setCreator(LoginSessionHelper.getThreadLocalUid());
		info.setCreatorName(LoginSessionHelper.getThreadLocalUname());
		String sql = "insert into ixin_activity(id, name, sponsor, address, createDate, startDate, "
				+ "endDate, lastApplyDate, picUrl, descript, content, domain, signinCode, findKeys,hasLimit, isDelete,apply,style,signin,mapShowInDetail,coordinate,startSignLocation,isopen,showQuestion,creator,creatorName) "
				+ "value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = new Object[] { info.getId(), info.getName(),
				info.getSponsor(), info.getAddress(), info.getCreateDate(),
				info.getStartDate(), info.getEndDate(),
				info.getLastApplyDate(), info.getPicUrl(), info.getDesc(),
				info.getContent(), info.getDomain(), info.getSigninCode(),
				info.getFindKeys(), info.getHasLimit(), info.getIsDelete(),
				info.getApply(), info.getStyle(), info.getSignin(),
				info.getMapShowInDetail(), info.getCoordinate(),
				info.getStartSignLocation(), info.getIsopen(), 
				info.getShowQuestion(),info.getCreator(),info.getCreatorName()};
		try {
			jdbcTemplate.update(sql, params);
			return true;
		} catch (DataAccessException ex) {
			logger.debug("add activity fail!because: " + ex);
			ex.printStackTrace();
			return false;
		}

	}

	@Override
	public List<ActivityInfo> query(String domain, int page, int pageSize) {
		String sql = "select id, name, sponsor, address, createDate, startDate, endDate, "
				+ "lastApplyDate, picUrl, descript, content, domain, signinCode, findKeys,hasLimit,afterSignIn, isDelete ,apply,style,signin,mapShowInDetail,coordinate,startSignLocation,showTopic,isopen,showQuestion,creator,creatorName,updater,updaterName,updatetime "
				+ "from ixin_activity where domain=? and isDelete=0 order by createDate desc limit ?, ?";
		Object[] params = new Object[] { domain, (page - 1) * pageSize,
				pageSize };
		List<ActivityInfo> list = jdbcTemplate.query(sql, params,
				new ActivityRowMapper());
		return list;
	}

	@Override
	public List<ActivityInfo> queryByDate(String domain, long nowDate) {
		String sql = "select id, name, sponsor, address, createDate, startDate, endDate, "
				+ "lastApplyDate, picUrl, descript, content, domain, signinCode, findKeys,hasLimit,afterSignIn, isDelete ,apply,style,signin,mapShowInDetail,coordinate,startSignLocation,showTopic,isopen,showQuestion,creator,creatorName,updater,updaterName,updatetime "
				+ "from ixin_activity where domain=? and isDelete=0 and endDate>? order by createDate desc";
		Object[] params = new Object[] { domain, nowDate };
		List<ActivityInfo> list = jdbcTemplate.query(sql, params,
				new ActivityRowMapper());
		return list;
	}

	@Override
	public ActivityInfo queryById(String id) {
		String sql = "select id, name, sponsor, address, createDate, startDate, endDate, "
				+ "lastApplyDate, picUrl, descript, content, domain, signinCode, findKeys,hasLimit,afterSignIn, isDelete ,apply,style,signin,mapShowInDetail,coordinate,startSignLocation,showTopic,isopen,showQuestion,creator,creatorName,updater,updaterName,updatetime  "
				+ "from ixin_activity where id=?";
		Object[] params = new Object[] { id };
		List<ActivityInfo> list = jdbcTemplate.query(sql, params,
				new ActivityRowMapper());
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public ActivityApplyRecord querySpecifiedApplyRecord(String activityId,
			String userId) {
		String sql = "select id, activityId, userId, userName, applyDate, isSignin,"
				+ " signinDate ,baseuid from ixin_activity_apply_list where activityId=? and userId=?";
		List<ActivityApplyRecord> list = jdbcTemplate.query(sql, new Object[] {
				activityId, userId }, new RecordRowMapper());
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Deprecated
	@Override
	public List<ActivityApplyRecordVO> queryApplyRecord(String activityId,
			int page, int pageSize) {
		String sql = "select a.id, a.activityId, a.userId, b.name, a.applyDate, a.isSignin,"
				+ " a.signinDate ,a.baseuid,b.mobile,b.company from ixin_activity_apply_list a,ixin_user b "
				+ "where a.userid=b.openid and activityId=? order by applyDate desc limit ?,?";
		List<ActivityApplyRecordVO> list = jdbcTemplate.query(sql,
				new Object[] { activityId, (page - 1) * pageSize, pageSize },
				new RowMapper<ActivityApplyRecordVO>() {
					public ActivityApplyRecordVO mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ActivityApplyRecordVO activityApplyRecord = new ActivityApplyRecordVO();
						activityApplyRecord.setId(rs.getString(1));
						activityApplyRecord.setActivityId(rs.getString(2));
						activityApplyRecord.setUserId(rs.getString(3));
						activityApplyRecord.setUserName(rs.getString(4));
						activityApplyRecord.setApplyDate(rs.getLong(5));
						activityApplyRecord.setIsSignin(rs.getInt(6));
						activityApplyRecord.setSigninDate(rs.getLong(7));
						activityApplyRecord.setBaseuid(rs.getString(8));
						activityApplyRecord.setMobile(rs.getString(9));
						activityApplyRecord.setCompany(rs.getString(10));
						return activityApplyRecord;
					}
				});
		return list;
	}

	@Override
	public List<ActivityApplyRecord> queruAllRecordByUid(String userId) {
		String sql = "select id, activityId, userId, userName, applyDate, isSignin,"
				+ " signinDate , baseuid from ixin_activity_apply_list where isSignin=? and userId=?";
		List<ActivityApplyRecord> list = jdbcTemplate.query(sql, new Object[] {
				1, userId }, new RecordRowMapper());
		if (list != null && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public int queryActivityCount(String domain) {
		String sql = "select count(id) as totleSize from ixin_activity where domain=? and isDelete=0";
		List<Integer> list = jdbcTemplate.query(sql, new Object[] { domain },
				new RowMapper<Integer>() {

					@Override
					public Integer mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						return rs.getInt("totleSize");
					}
				});
		return list.get(0);
	}

	@Override
	public boolean applyActivity(ActivityApplyRecord record) {
		String sql = "insert into ixin_activity_apply_list(id, userId, activityId, userName, applyDate, isSignin, signinDate,baseuid) value(?,?,?,?,?,?,?,?)";
		try {
			jdbcTemplate.update(
					sql,
					new Object[] { record.getId(), record.getUserId(),
							record.getActivityId(), record.getUserName(),
							record.getApplyDate(), record.getIsSignin(),
							record.getSigninDate(), record.getBaseuid() });
		} catch (DataAccessException ex) {
			logger.debug("apply activity fail! because：" + ex);
			return false;
		}
		return true;
	}

	@Override
	public boolean signin(String activityId, String openid, long signinDate,
			String baseuid) {
		String sql = "update ixin_activity_apply_list set isSignin = 1, signinDate=?  , baseuid =? where activityId=? and userId=?";
		try {
			jdbcTemplate.update(sql, new Object[] { signinDate, activityId,
					baseuid, openid });
		} catch (DataAccessException ex) {
			logger.debug("apply activity fail! because：" + ex);
			return false;
		}
		return true;
	}

	@Override
	public int queryApplyCount(String activityId) {
		String sql = "select count(id) as totleSize from ixin_activity_apply_list where activityId=?";
		List<Integer> list = jdbcTemplate.query(sql,
				new Object[] { activityId }, new RowMapper<Integer>() {

					@Override
					public Integer mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						return rs.getInt("totleSize");
					}
				});
		return list.get(0);
	}

	class ActivityRowMapper implements RowMapper<ActivityInfo> {

		@Override
		public ActivityInfo mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			ActivityInfo info = new ActivityInfo();
			info.setId(rs.getString("id"));
			info.setName(rs.getString("name"));
			info.setSponsor(rs.getString("sponsor"));
			info.setAddress(rs.getString("address"));
			info.setCreateDate(rs.getLong("createDate"));
			info.setStartDate(rs.getLong("startDate"));
			info.setEndDate(rs.getLong("endDate"));
			info.setLastApplyDate(rs.getLong("lastApplyDate"));
			info.setPicUrl(rs.getString("picUrl"));
			info.setDesc(rs.getString("descript"));
			info.setContent(rs.getString("content"));
			info.setDomain(rs.getString("domain"));
			info.setSigninCode(rs.getString("signinCode"));
			info.setFindKeys(rs.getString("findKeys"));
			info.setHasLimit(rs.getInt("hasLimit"));
			info.setAfterSignIn(rs.getInt("afterSignIn"));
			info.setIsDelete(rs.getInt("isDelete"));
			info.setApply(rs.getInt("apply"));
			info.setStyle(rs.getString("style"));
			info.setSignin(rs.getInt("signin"));
			info.setMapShowInDetail(rs.getInt("mapShowInDetail"));
			info.setCoordinate(rs.getString("coordinate"));
			info.setStartSignLocation(rs.getInt("startSignLocation"));
			info.setShowTopic(rs.getInt("showTopic"));
			info.setIsopen(rs.getInt("isopen"));
			info.setShowQuestion(rs.getInt("showQuestion"));
			info.setCreator(rs.getString("creator"));
			info.setCreatorName(rs.getString("creatorName"));
			
			return info;
		}
	}

	class RecordRowMapper implements RowMapper<ActivityApplyRecord> {

		@Override
		public ActivityApplyRecord mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			ActivityApplyRecord record = new ActivityApplyRecord();
			record.setId(rs.getString("id"));
			record.setActivityId(rs.getString("activityId"));
			record.setUserId(rs.getString("userId"));
			record.setUserName(rs.getString("userName"));
			record.setApplyDate(rs.getLong("applyDate"));
			record.setIsSignin(rs.getInt("isSignin"));
			record.setSigninDate(rs.getLong("signinDate"));
			record.setBaseuid(rs.getString("baseuid"));
			return record;
		}
	}

	@Override
	public ActivityInfo queryByKeys(String keys, String domain) {
		String sql = "select * from ixin_activity where isDelete=0 and findKeys=? and domain=? order by createDate desc";
		List<ActivityInfo> list = jdbcTemplate.query(sql, new Object[] { keys,
				domain }, new ActivityRowMapper());
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean deleteActivity(String activityId) {
		String sql = "update ixin_activity set isDelete=1 where id=?";
		try {
			jdbcTemplate.update(sql, new Object[] { activityId });
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean updateActivity(ActivityInfo info) {
		String sql = "update ixin_activity set name=?, sponsor=?, address=?, startDate=?, "
				+ "endDate=?, lastApplyDate=?, picUrl=?, descript=?, content=?, signinCode=?,"
				+ " findKeys=?,hasLimit=?,afterSignIn=?,apply=?,style=?,signin=?,mapShowInDetail=?,coordinate=?,startSignLocation=?,showTopic=?,isopen=?,showQuestion=? ,updater=?,updaterName=?,updatetime=? where id=?";
		
		info.setUpdater(LoginSessionHelper.getThreadLocalUid());
		info.setUpdaterName(LoginSessionHelper.getThreadLocalUname());
		info.setUpdatetime(System.currentTimeMillis());
		Object[] params = new Object[] { info.getName(), info.getSponsor(),
				info.getAddress(), info.getStartDate(), info.getEndDate(),
				info.getLastApplyDate(), info.getPicUrl(), info.getDesc(),
				info.getContent(), info.getSigninCode(), info.getFindKeys(),
				info.getHasLimit(), info.getAfterSignIn(), info.getApply(),
				info.getStyle(), info.getSignin(), info.getMapShowInDetail(),
				info.getCoordinate(), info.getStartSignLocation(),
				info.getShowTopic(), info.getIsopen(),info.getShowQuestion(), 
				info.getUpdater(),info.getUpdaterName(),info.getUpdatetime(),
				info.getId() };
		
		try {
			int reulst = jdbcTemplate.update(sql, params);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<ActivityInfo> queryHasKey(String domain, int page, int pageSize) {
		String sql = "select id, name, sponsor, address, createDate, startDate, endDate, "
				+ "lastApplyDate, picUrl, descript, content, domain, signinCode, findKeys,hasLimit,afterSignIn, isDelete ,apply,style,signin,mapShowInDetail,coordinate,startSignLocation,showTopic,isopen,showQuestion,creator,creatorName,updater,updaterName,updatetime  "
				+ "from ixin_activity where domain=? and isDelete=0 and findKeys is not null order by createDate desc limit ?, ?";
		Object[] params = new Object[] { domain, (page - 1) * pageSize,
				pageSize };
		List<ActivityInfo> list = jdbcTemplate.query(sql, params,
				new ActivityRowMapper());
		return list;
	}

	@Override
	public int queryActivityCountHasKey(String domain) {
		String sql = "select count(id) as totleSize from ixin_activity where domain=? and isDelete=0 and findKeys is not null ";
		List<Integer> list = jdbcTemplate.query(sql, new Object[] { domain },
				new RowMapper<Integer>() {
					@Override
					public Integer mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						return rs.getInt("totleSize");
					}
				});
		return list.get(0);
	}

	@Deprecated
	@Override
	public List<ActivityApplyRecordVO> queryApplyRecord(String domain,
			String activityId, int page, int pageSize) {
		String sql = "select  a.id as applyid, a.activityId as activityId, a.userId as userId,c.id as uid,b.username as username,c.name as uname,"
				+ "b.name as name,c.nickname as nickname,a.applyDate as applydate, a.isSignin as issignin,a.signinDate as signindate,a.baseuid as baseuid,b.mobile as mobile,b.company as company,d.name as orgname "
				+ "from ixin_activity_apply_list  as a "
				+ "left  join  ixin_user as b on a.userId=b.openid "
				+ "left join  iapp_base_user as c on a.baseuid=c.id "
				+ "left join  iapp_base_organization as d on c.organization_id=d.id "
				+ "where (b.domain=? or b.openid is null) and activityId=? order by applyDate desc limit ?,?";
		List<ActivityApplyRecordVO> list = jdbcTemplate.query(sql,
				new Object[] { domain, activityId, (page - 1) * pageSize,
						pageSize }, new RowMapper<ActivityApplyRecordVO>() {
					public ActivityApplyRecordVO mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ActivityApplyRecordVO activityApplyRecord = new ActivityApplyRecordVO();
						activityApplyRecord.setId(rs.getString("applyid"));
						activityApplyRecord.setActivityId(rs
								.getString("activityId"));
						activityApplyRecord.setUserId(rs.getString("uid"));
						if (StringUtils.isBlank(rs.getString("uid"))) {
							activityApplyRecord.setUserId(rs
									.getString("userId"));
						}
						activityApplyRecord.setUserName(rs.getString("uname"));
						if (StringUtils.isBlank(rs.getString("uname"))) {
							activityApplyRecord.setUserName(rs
									.getString("username"));
						}
						activityApplyRecord.setUserName(rs
								.getString("nickname"));
						if (StringUtils.isBlank(rs.getString("nickname"))) {
							activityApplyRecord.setUserName(rs
									.getString("name"));
						}
						activityApplyRecord.setApplyDate(rs
								.getLong("applydate"));
						activityApplyRecord.setIsSignin(rs.getInt("issignin"));
						activityApplyRecord.setSigninDate(rs
								.getLong("signindate"));
						activityApplyRecord.setBaseuid(rs.getString("baseuid"));
						activityApplyRecord.setMobile(rs.getString("mobile"));
						activityApplyRecord.setCompany(rs.getString("orgname"));
						if (StringUtils.isBlank(rs.getString("orgname"))) {
							activityApplyRecord.setCompany(rs
									.getString("company"));
						}
						return activityApplyRecord;
					}
				});
		return list;
	}

	// 使用程序逻辑实现 以iapp_base_user temporary_mobile、name、unitinfo
	@Override
	public List<ActivityApplyRecordVO> queryApplyRecord2(String domain,
			String activityId, int page, int pageSize) {
		// String sql =
		// "select  a.id as applyid, a.activityId as activityId, a.userId as userId,c.username as username ,"
		// +
		// "c.name as name,a.applyDate as applydate, a.isSignin as issignin,a.signinDate as signindate,a.baseuid as baseuid,c.temporary_mobile as mobile,c.unitinfo as company "
		// +
		// "from ixin_activity_apply_list  as a " +
		// "left  join  ixin_user as b on a.userId=b.openid " +
		// "left join  iapp_base_user as c on a.baseuid=c.id " +
		// //"left join  iapp_base_organization as d on c.organization_id=d.id "
		// +
		// "where b.domain=? and activityId=? order by applyDate desc limit ?,?";

		String sql = "SELECT a.id AS applyid, a.activityId AS activityId, a.userId AS userId, c.username AS username, c. NAME AS NAME, a.applyDate AS applydate, a.isSignin AS issignin, a.signinDate AS signindate, a.baseuid AS baseuid, c.temporary_mobile AS mobile, c.unitinfo AS company "
				+ "FROM	ixin_activity_apply_list AS a,  iapp_base_user AS c "
				+ "WHERE a.baseuid = c.id AND	c.domain = ? AND activityId = ? "
				+ "ORDER BY applyDate DESC limit ?, ?";
		List<ActivityApplyRecordVO> list = jdbcTemplate.query(sql,
				new Object[] { domain, activityId, (page - 1) * pageSize,
						pageSize }, new RowMapper<ActivityApplyRecordVO>() {
					public ActivityApplyRecordVO mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ActivityApplyRecordVO activityApplyRecord = new ActivityApplyRecordVO();
						activityApplyRecord.setId(rs.getString("applyid"));
						activityApplyRecord.setActivityId(rs
								.getString("activityId"));
						activityApplyRecord.setApplyDate(rs
								.getLong("applydate"));
						activityApplyRecord.setIsSignin(rs.getInt("issignin"));
						activityApplyRecord.setSigninDate(rs
								.getLong("signindate"));
						activityApplyRecord.setBaseuid(rs.getString("baseuid"));
						activityApplyRecord.setMobile(rs.getString("mobile"));
						activityApplyRecord.setCompany(rs.getString("company"));
						activityApplyRecord.setUserId(rs.getString("baseuid"));
						activityApplyRecord.setUname(rs.getString("name"));
						activityApplyRecord.setUserName(rs
								.getString("username"));
						return activityApplyRecord;
					}
				});
		return list;
	}
	@Override
	public List<ActivityPersonVO> queryPersonRecord(String domain,
		String activityId, int page, int pageSize,String status) {
		String sql = "select person.id as id,person.activityid as activityid,person.name as name,person.mobile as mobile,person.work as work,apply.issignin as issignin,apply.signindate as signindate from ixin_activity_person as person " +
				"left join iapp_base_user AS user on person.mobile = user.mobile "
				+ "left join ixin_activity_apply_list apply on apply.baseuid = user.id "
				+ " WHERE person.domain = ? AND person.activityid = ? " ;
		
		if ("2".equals(status)) {//已签到
			sql = sql + " and issignin = 1 " ;
		}else if("3".equals(status)){//未签到
			sql = sql + " and (issignin =0 or issignin is null or issignin = '' ) " ;
		}
		
		sql  = sql + " ORDER BY person.createtime DESC limit ?, ?";
		
		List<ActivityPersonVO> list = jdbcTemplate.query(sql,
			new Object[] { domain, activityId, (page - 1) * pageSize,
				pageSize }, new RowMapper<ActivityPersonVO>() {
			public ActivityPersonVO mapRow(ResultSet rs, int rowNum)
					throws SQLException {
				ActivityPersonVO record = new ActivityPersonVO();
				record.setId(rs.getString("id"));
				record.setActivityid(rs.getString("activityid"));
				record.setIssignin(rs.getInt("issignin"));
				record.setSignindate(rs.getLong("signindate"));
				record.setMobile(rs.getString("mobile"));
				record.setName(rs.getString("name"));
				record.setWork(rs.getString("work"));
				return record;
			}
		});
		return list;
	}

	@Deprecated
	@Override
	public int queryApplyCount(String domain, String activityId) {
		String sql = "select count(a.id) as totleSize "
				+ "from ixin_activity_apply_list  as a "
				+ "left  join  ixin_user as b on a.userId=b.openid "
				+ "left join  iapp_base_user as c on a.baseuid=c.id "
				+ "left join  iapp_base_organization as d on c.organization_id=d.id "
				+ "where b.domain=? and activityId=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[] { domain,
				activityId }, new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("totleSize");
			}
		});
		return list.get(0);
	}

	@Override
	public int queryApplyCount2(String domain, String activityId) {
		String sql = "select count(a.id) as totleSize "
				+ "from ixin_activity_apply_list  as a "
				+ "left  join  ixin_user as b on a.userId=b.openid " +
				// "left join  iapp_base_user as c on a.baseuid=c.id " +
				// "left join  iapp_base_organization as d on c.organization_id=d.id "
				// +
				"where b.domain=? and activityId=?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[] { domain,
				activityId }, new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("totleSize");
			}
		});
		return list.get(0);
	}
	@Override
	public int queryPersonCount(String domain, String activityId,String status) {
		String sql = "select count(*) as totleSize from ixin_activity_person as person " +
				"left join iapp_base_user AS user on person.mobile = user.mobile "
				+ "left join ixin_activity_apply_list apply on apply.baseuid = user.id "
				+ " WHERE person.domain = ? AND person.activityid = ? " ;
		if ("2".equals(status)) {//已签到
			sql = sql + " and apply.issignin = 1 " ;
		}else if("3".equals(status)){//未签到
			sql = sql + " and (apply.issignin = 0 or apply.issignin is null or apply.issignin='' ) " ;
		}
		
		List<Integer> list = jdbcTemplate.query(sql, new Object[] { domain,
				activityId }, new RowMapper<Integer>() {
			
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("totleSize");
			}
		});
		return list.get(0);
	}

	@Override
	public List<ActivityApplyRecordVO> queryApplyRecord(String domain,
			String activityId) {
		// String sql =
		// "select  a.id as applyid, a.activityId as activityId, a.userId as userId,c.id as uid,c.username as username,c.name as uname,"
		// +
		// "c.name as name,c.nickname as nickname,a.applyDate as applydate, a.isSignin as issignin,a.signinDate as signindate,a.baseuid as baseuid,c.temporary_mobile as mobile,c.unitinfo as company,d.name as orgname "
		// + "from ixin_activity_apply_list  as a "
		// + "left  join  ixin_user as b on a.userId=b.openid "
		// + "left join  iapp_base_user as c on a.baseuid=c.id "
		// + "left join  iapp_base_organization as d on c.organization_id=d.id "
		// + "where b.domain=? and activityId=? order by applyDate desc";

		String sql = "SELECT a.id AS applyid, a.activityId AS activityId, a.userId AS userId, c.id AS uid, c.username AS username, c.NAME AS uname, c.NAME AS NAME, c.nickname AS nickname, a.applyDate AS applydate, a.isSignin AS issignin, a.signinDate AS signindate, a.baseuid AS baseuid, c.temporary_mobile AS mobile, c.unitinfo AS company "
				+ "FROM ixin_activity_apply_list AS a "
				+ "LEFT JOIN iapp_base_user AS c ON a.baseuid = c.id "
				+ "WHERE c.domain =? AND activityId =?	"
				+ "ORDER BY applyDate DESC";

		List<ActivityApplyRecordVO> list = jdbcTemplate.query(sql,
				new Object[] { domain, activityId },
				new RowMapper<ActivityApplyRecordVO>() {
					public ActivityApplyRecordVO mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ActivityApplyRecordVO activityApplyRecord = new ActivityApplyRecordVO();
						activityApplyRecord.setId(rs.getString("applyid"));
						activityApplyRecord.setActivityId(rs
								.getString("activityId"));
						activityApplyRecord.setUserId(rs.getString("uid"));
						if (StringUtils.isBlank(rs.getString("uid"))) {
							activityApplyRecord.setUserId(rs
									.getString("userId"));
						}
						activityApplyRecord.setUserName(rs
								.getString("username"));
						if (StringUtils.isBlank(rs.getString("username"))) {
							activityApplyRecord.setUserName(rs
									.getString("nickname"));
						}
						// activityApplyRecord.setUserName(rs.getString("nickname"));
						// if (StringUtils.isBlank(rs.getString("nickname"))){
						// activityApplyRecord.setUserName(rs.getString("name"));
						// }
						if (StringUtils.isNotBlank(rs.getString("uname"))) {
							activityApplyRecord.setUname(rs.getString("uname"));
						}
						if (StringUtils.isBlank(rs.getString("uname"))) {
							activityApplyRecord.setUname(rs
									.getString("username"));
						}
						activityApplyRecord.setApplyDate(rs
								.getLong("applydate"));
						activityApplyRecord.setIsSignin(rs.getInt("issignin"));
						activityApplyRecord.setSigninDate(rs
								.getLong("signindate"));
						activityApplyRecord.setBaseuid(rs.getString("baseuid"));
						activityApplyRecord.setMobile(rs.getString("mobile"));
						activityApplyRecord.setCompany(rs.getString("company"));
						return activityApplyRecord;
					}
				});
		return list;
	}

	@Override
	public List<ActivityInfo> queryByDate(String domain, long nowDate,
			int currentpage, int pagesize) {

		String sql = "select id, name, sponsor, address, createDate, startDate, endDate, "
				+ "lastApplyDate, picUrl, descript, content, domain, signinCode, findKeys,hasLimit,afterSignIn, isDelete ,apply,style,signin,mapShowInDetail,coordinate,startSignLocation,showTopic,isopen,showQuestion ,creator,creatorName,updater,updaterName,updatetime "
				+ "from ixin_activity where domain=? and isDelete=0 and endDate>? order by createDate desc limit ?,?";
		Object[] params = new Object[] { domain, nowDate, currentpage, pagesize };
		List<ActivityInfo> list = jdbcTemplate.query(sql, params,
				new ActivityRowMapper());
		return list;

	}

	@Override
	public int queryActivityCount(String domain, long nowDate) {

		String sql = "select count(id) as totleSize from ixin_activity where domain=? and isDelete=0 and endDate>?";
		List<Integer> list = jdbcTemplate.query(sql, new Object[] { domain,
				nowDate }, new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("totleSize");
			}
		});
		return list.get(0);
	}
	
	@Override
	public com.longtime.common.utils.ResultSet<ActivityInfo> listActivity(String domain,Page page ){
		
		if(StringUtils.isBlank(domain)){
			return com.longtime.common.utils.ResultSet.emptyResultSet();
		}
		if(null==page){
			page = new Page();
		}
		
		
		String sql_count= "select count(id) as totleSize from ixin_activity where domain=? and isDelete=0";
		
		int count = jdbcTemplate.queryForInt(sql_count, domain);
		
		page.setTotal_size(count);
		
		if(count<1){
			return  com.longtime.common.utils.ResultSet.emptyResultSet();
		}
		
		String sql = "select id, name, sponsor, address, createDate, startDate, endDate, "
					+ "lastApplyDate, picUrl, descript, content, domain, signinCode, findKeys,hasLimit,afterSignIn, isDelete ,apply,style,signin,mapShowInDetail,coordinate,startSignLocation,showTopic,isopen,showQuestion ,creator,creatorName,updater,updaterName,updatetime "
					+ "from ixin_activity where domain=? and isDelete=0  order by createDate desc limit ?,?";
		Object[] params = new Object[] { domain, page.getStart(), page.getPage_size() };
		List<ActivityInfo> list = jdbcTemplate.query(sql, params,
					new ActivityRowMapper());
			

		return 	 new com.longtime.common.utils.ResultSet<ActivityInfo>(list,page.getPage_size(),page.getCurrent_page(),count);
		
	}

}
