package com.longtime.app.ixin.mgr.service.impl;

import com.longtime.app.ixin.mgr.dao.IActivityItemDao;
import com.longtime.app.ixin.mgr.model.ActivityItem;
import com.longtime.app.ixin.mgr.model.ActivityItem.Restype;
import com.longtime.app.ixin.mgr.service.IActivityItemService;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("activityItemService")
public class ActivityItemServiceImpl implements IActivityItemService {
	
	@Resource(name="activityItemDao")
	private IActivityItemDao activityItemDao;

	@Override
	public void insert(ActivityItem item) {
		if(item.getCreatetime()<1){
			item.setCreatetime(System.currentTimeMillis());
		}
		activityItemDao.insert(item);
	}

	@Override
	public void delete(long id) {
		activityItemDao.delete(id);
	}

	@Override
	public void deleteByAid(String aid) {
		activityItemDao.deleteByAid(aid);
	}
	
	@Override
	public 	ResultSet<ActivityItem>  list(String aid,Restype type ,Page page){
		return activityItemDao.list(aid,type,page);
	}
	
	@Override
	public 	List<ActivityItem>  list(String aid,Restype type){
		return activityItemDao.list(aid,type);
	}

	@Override
	public List<ActivityItem> listBySid(String sid) {
		return activityItemDao.listBySid(sid);
	}

	@Override
	public ActivityItem getActivityItem(String aid, int restype, String resid) {
		return activityItemDao.getaActivityItem(aid, restype, resid);
	}

	@Override
	public List<ActivityItem> list(String aid) {
		return activityItemDao.list(aid);
	}

	@Override
	public int delActivityItemByAidAndResid(String resid) {
		// TODO Auto-generated method stub
		return activityItemDao.delActivityItemByAidAndResid(resid);
	}
}