package com.longtime.app.ixin.mgr.vote.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.vote.dao.VoteQueueDao;
import com.longtime.app.ixin.mgr.vote.model.VoteQueueModel;
import com.longtime.app.ixin.mgr.vote.service.VoteQueueService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;


@Service("voteQueueService")
public class VoteQueueServiceImpl extends BaseService4HImpl<VoteQueueModel, String> implements VoteQueueService{

	@Resource(name="voteQueueDao")
	private VoteQueueDao voteQueueDao;
	
	@Override
	public BaseDAO<VoteQueueModel, String> getDAO() {
		return voteQueueDao;
	}
	
	
}
