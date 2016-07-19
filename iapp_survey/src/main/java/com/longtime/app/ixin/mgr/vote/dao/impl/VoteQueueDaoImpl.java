package com.longtime.app.ixin.mgr.vote.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.vote.dao.VoteQueueDao;
import com.longtime.app.ixin.mgr.vote.model.VoteQueueModel;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("voteQueueDao")
public class VoteQueueDaoImpl extends BaseDAOImpl<VoteQueueModel, String> implements VoteQueueDao{

	
}
