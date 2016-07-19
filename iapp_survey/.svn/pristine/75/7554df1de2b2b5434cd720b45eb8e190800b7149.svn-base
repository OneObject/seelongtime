package com.longtime.app.ixin.mgr.vote.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.vote.dao.VoteActionDetailDao;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteActionDetailService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;


@Service("voteActionDetailService")
public class VoteActionDetailServiceImpl extends BaseService4HImpl<VoteActionDetailEntity, String> implements VoteActionDetailService{

	@Resource(name="voteActionDetailDao")
	private VoteActionDetailDao voteActionDetailDao;
	
	@Override
	public BaseDAO<VoteActionDetailEntity, String> getDAO() {
		return voteActionDetailDao;
	}
	
	@Override
	public List<VoteActionDetailEntity> listAskAndFillIn(String id, String domain) {
		return voteActionDetailDao.listAskAndFillIn(id,domain);
	}
	
	@Override
	public List<VoteActionDetailEntity> listByActivityId(String id) {
		QueryCondition conditions = new QueryCondition();
		conditions.addFilterEqual("voteactivityid", id);
		conditions.addFilterEqual("isDel", 0);
		ResultSet<VoteActionDetailEntity> rs = voteActionDetailDao.list(conditions, new Page(1, Integer.MAX_VALUE));
		return rs.getItems();
	}
}
