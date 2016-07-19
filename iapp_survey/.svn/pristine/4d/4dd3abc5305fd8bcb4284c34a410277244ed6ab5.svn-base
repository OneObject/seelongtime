package com.longtime.app.ixin.mgr.vote.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.vote.dao.VoteOptionDao;
import com.longtime.app.ixin.mgr.vote.model.VoteOptionEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteOptionService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;


@Service("voteOptionService")
public class VoteOptionServiceImpl extends BaseService4HImpl<VoteOptionEntity, String> implements VoteOptionService{

	@Resource(name="voteOptionDao")
	private VoteOptionDao voteOptionDao;
	
	@Override
	public BaseDAO<VoteOptionEntity, String> getDAO() {
		return voteOptionDao;
	}
	
	
}
