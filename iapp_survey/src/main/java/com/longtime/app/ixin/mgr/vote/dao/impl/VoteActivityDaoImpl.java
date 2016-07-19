package com.longtime.app.ixin.mgr.vote.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.vote.dao.VoteActivityDao;
import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("voteActivityDao")
public class VoteActivityDaoImpl extends BaseDAOImpl<VoteActivityEntity, String> implements VoteActivityDao{

	
}
