package com.longtime.app.ixin.mgr.vote.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.vote.dao.VoteStatisticsOptionDao;
import com.longtime.app.ixin.mgr.vote.model.VoteStatisticsOptionEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteStatisticsOptionService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;


@Service("voteStatisticsOptionService")
public class VoteStatisticsOptionServiceImpl extends BaseService4HImpl<VoteStatisticsOptionEntity, String> implements VoteStatisticsOptionService{

	@Resource(name="voteStatisticsOptionDao")
	private VoteStatisticsOptionDao voteStatisticsOptionDao;
	
	@Override
	public BaseDAO<VoteStatisticsOptionEntity, String> getDAO() {
		return voteStatisticsOptionDao;
	}
	
	@Override
	public List<VoteStatisticsOptionEntity> getList(String id) {
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("voteactivityid", id);
		query.addFilterEqual("isDel", 0);
		ResultSet<VoteStatisticsOptionEntity> rs = voteStatisticsOptionDao.list(query, new Page(1,Integer.MAX_VALUE));
		return rs.getItems();
	}
}
