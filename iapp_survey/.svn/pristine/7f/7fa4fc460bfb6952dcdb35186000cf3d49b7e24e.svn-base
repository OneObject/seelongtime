package com.longtime.app.ixin.mgr.vote.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.longtime.app.ixin.mgr.vote.dao.VoteActionDetailDao;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("voteActionDetailDao")
public class VoteActionDetailDaoImpl extends BaseDAOImpl<VoteActionDetailEntity, String> implements VoteActionDetailDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<VoteActionDetailEntity> listAskAndFillIn(String id, String domain) {
		String sql = "select detail.* from ixin_vote_action_detail detail inner join ixin_vote_question question on detail.questionid = question.id where detail.voteactivityid=? and question.type in(3,6) and detail.isDel=0";
		SQLQuery query = getSession().createSQLQuery(sql);
		query.setParameter(0, id);
		query.addEntity(VoteActionDetailEntity.class);
		return query.list();
	}
	
}
