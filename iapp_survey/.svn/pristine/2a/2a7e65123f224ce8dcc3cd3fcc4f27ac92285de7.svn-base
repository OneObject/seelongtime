package com.longtime.app.ixin.mgr.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.model.ActivityItem.Restype;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;
import com.longtime.app.ixin.mgr.model.ActivityItem;


public interface IActivityItemDao {
	
	void insert(ActivityItem item);
	
	void delete(long id);
	
	void deleteByAid(String aid);
	
	ResultSet<ActivityItem>  list(String aid,Restype type ,Page page);
	
	List<ActivityItem>  list(String aid,Restype type);
	
	List<ActivityItem> list(String aid);

	List<ActivityItem> listBySid(String sid);
	
	ActivityItem getaActivityItem(String aid,int restype,String resid);
	
	/**
	 * 根据活动资源id删除活动项
	 * @return
	 */
	public int delActivityItemByAidAndResid(String resid);
}
