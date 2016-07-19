package com.longtime.app.ixin.mgr.service;

import com.longtime.app.base.model.ActivityPersonVO;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecord;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecordVO;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;
import java.util.List;

public interface IActivityService {
	public boolean addActivity(ActivityInfo info);
	
	public List<ActivityInfo> getActivityList(String domain, int page);
	
	public List<ActivityInfo> getUnclosedActivityList(String domain);
	
	public List<ActivityInfo> getUnclosedActivityList(String domain,int currentpage,int pagesize);
	
	public int getActivityCount(String domain);
	
	public int getActivityCount(String domain,long nowDate);
	
	public ActivityInfo getActivityById(String id);
	
	public int applyActivity(String activityId, String openid,String baseuid) ;
	
	public boolean signin(String activityId, String openid, String code,String baseuid);
	
	public ActivityApplyRecord getSpecifiedApplyRecord(String activityId, String userId);
	
	public List<ActivityApplyRecordVO> getApplyRecordByActivity(String activityId, int page);
	
	public List<ActivityApplyRecord> getAllRecordByUid(String uid);
	
	public int getApplyCount(String activityId);
	
	public boolean deleteActivityById(String id); 
	
	public boolean modifyActivity(ActivityInfo activity);

	public List<ActivityInfo> getActivityListHasKey(String domain, int currPage, int pageSize);

	public int getActivityCountHasKey(String domain);
	
	public List<ActivityApplyRecordVO> getApplyRecordByActivity(String domain,String activityId, int page);
	
	public List<ActivityPersonVO> getPersonByActivity(String domain,String activityId, int page, String status);
	
	public int getApplyCount(String domain,String activityId);
	
	public int getPersonCount(String domain,String activityId, String status);
	
	public List<ActivityApplyRecordVO> getApplyRecordByActivity(String domain,String activityId);
	
	
	ResultSet<ActivityInfo> listActivity(String domain,Page page );
	
	

}
