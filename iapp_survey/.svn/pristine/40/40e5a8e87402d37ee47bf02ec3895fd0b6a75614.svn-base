package com.longtime.app.ixin.mgr.dao;

import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

import com.longtime.app.base.model.ActivityPersonVO;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecord;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecordVO;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import java.util.List;

public interface IActivityDao {
	
	public boolean addActivity(ActivityInfo activityInfo);
	
	public List<ActivityInfo> query(String domain, int page, int pageSize);
	
	public List<ActivityInfo> queryByDate(String domain, long nowDate);
	
	public List<ActivityInfo> queryByDate(String domain,long nowDate,int currentpage,int pagesize);
	
	public ActivityInfo queryById(String id);
	
	public ActivityApplyRecord querySpecifiedApplyRecord(String activityId, String userId);
	
	public List<ActivityApplyRecordVO> queryApplyRecord(String activityId, int page, int pageSize);
	/**
	 * 查询该用户签到记录，为SML沙龙用
	 * @param userId
	 * @return
	 */
	public List<ActivityApplyRecord> queruAllRecordByUid(String userId);
	
	public int queryActivityCount(String domain);
	
	public int queryActivityCount(String domain,long nowDate);
	
	public boolean applyActivity(ActivityApplyRecord record);
	
	public boolean signin(String activityId, String openid, long signinDate,String baseuid);
	
	public int queryApplyCount(String activityId);
	
	public ActivityInfo queryByKeys(String keys, String string);
	
	public boolean deleteActivity(String activityId);
	
	public boolean updateActivity(ActivityInfo info);

	public List<ActivityInfo> queryHasKey(String domain, int page, int pageSize);

	public int queryActivityCountHasKey(String domain);
	
	@Deprecated
	public List<ActivityApplyRecordVO> queryApplyRecord(String domain,String activityId, int page, int pageSize);
	
	
	public List<ActivityApplyRecordVO> queryApplyRecord2(String domain,String activityId, int page, int pageSize);
	
	public List<ActivityPersonVO> queryPersonRecord(String domain,String activityId, int page, int pageSize, String status);
	
	
	@Deprecated
	public int queryApplyCount(String domain,String activityId);
	
	
	public int queryApplyCount2(String domain,String activityId);
	
	public int queryPersonCount(String domain,String activityId, String status);
	
	//不进行分页对活动报名记录的查询
	public List<ActivityApplyRecordVO> queryApplyRecord(String domain,String activityId);
	
	
	ResultSet<ActivityInfo> listActivity(String domain,Page page );
	
	
}
