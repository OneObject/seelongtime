package com.longtime.app.ixin.mgr.service;

import java.util.List;

import com.longtime.app.ixin.mgr.model.ActivityItem;
import com.longtime.app.ixin.mgr.model.ActivityItem.Restype;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

public interface IActivityItemService {
	void insert(ActivityItem item);
	
	void delete(long id);
	
	void deleteByAid(String aid);
	
	ResultSet<ActivityItem>  list(String aid,Restype type ,Page page);
	
	List<ActivityItem>  list(String aid,Restype type);
	
	List<ActivityItem> list(String aid);
	
	ActivityItem getActivityItem(String aid,int restype,String resid);

	List<ActivityItem> listBySid(String sid);
	
	/**
	 * 根据活动资源id删除活动项
	 * @return
	 */
	public int delActivityItemByAidAndResid(String resid);
}
