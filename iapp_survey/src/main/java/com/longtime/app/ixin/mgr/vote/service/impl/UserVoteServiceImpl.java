package com.longtime.app.ixin.mgr.vote.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.vote.dao.UserVoteDao;
import com.longtime.app.ixin.mgr.vote.model.UserVoteEntity;
import com.longtime.app.ixin.mgr.vote.service.UserVoteService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;


@Service("userVoteService")
public class UserVoteServiceImpl extends BaseService4HImpl<UserVoteEntity, String> implements UserVoteService{

	@Resource(name="userVoteDao")
	private UserVoteDao userVoteDao;
	
	@Override
	public BaseDAO<UserVoteEntity, String> getDAO() {
		return userVoteDao;
	}
	
	@Override
	public List<UserVoteEntity> listByActivityId(String id) {
		QueryCondition conditions = new QueryCondition();
		conditions.addFilterEqual("activityId", id);
		conditions.addFilterEqual("isDel", 0);
		ResultSet<UserVoteEntity> rs = userVoteDao.list(conditions, new Page(1,Integer.MAX_VALUE));
		return rs.getItems();
	}
	
}
