package com.longtime.app.ixin.mgr.vote.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.vote.dao.VoteOptionDao;
import com.longtime.app.ixin.mgr.vote.dao.VoteQuestionDao;
import com.longtime.app.ixin.mgr.vote.model.VoteOptionEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteQuestionEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteQuestionService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort.Order;


@Service("voteQuestionService")
public class VoteQuestionServiceImpl extends BaseService4HImpl<VoteQuestionEntity, String> implements VoteQuestionService{

	@Resource(name="voteQuestionDao")
	private VoteQuestionDao voteQuestionDao;
	
	@Resource(name = "voteOptionDao")
	private VoteOptionDao voteOptionDao;
	
	
	@Override
	public BaseDAO<VoteQuestionEntity, String> getDAO() {
		return voteQuestionDao;
	}
	
	@Override
	public List<VoteQuestionEntity> findByWeight(String id,String voteId,long weight) {
		QueryCondition query = new QueryCondition();
		query.addFilterEqual("voteId", voteId);
		query.addFilterNotEqual("id", id);
		query.addFilterNotEqual("type", 5);
		query.addFilter(QueryFilter.greaterOrEqual("weight", weight));
		query.addOrder("weight", Order.ASC);
		ResultSet<VoteQuestionEntity> rs = voteQuestionDao.list(query, new Page(1, Integer.MAX_VALUE));
		return rs.getItems();
	}
	
	
	@Override
	public boolean doSetRelations(String questionId, String relations) {
		VoteQuestionEntity question = voteQuestionDao.get(questionId);
		String[] arr = relations.split(";");
		boolean hasJump = false;
		for (String relation : arr) {
			String[] items = relation.split(":");
			String optionId = items[0];
			String jumpto = "";
			if(items.length == 2){
				jumpto = items[1];
			}
			VoteOptionEntity option = voteOptionDao.get(optionId);
			if(option == null){
				continue;
			}
			if(StringUtils.isNotBlank(jumpto)){
				hasJump = true;
			}
			option.setJumpto(jumpto);
			voteOptionDao.update(option);
		}
		question.setHasjump(hasJump ? 1 : 0);
		voteQuestionDao.update(question);
		return true;
	}
	
	@Override
	public List<VoteQuestionEntity> listByVoteId(String voteId) {
		QueryCondition conditions = new QueryCondition();
		conditions.addFilterEqual("voteId", voteId);
		conditions.addOrder("weight", Order.ASC);
		ResultSet<VoteQuestionEntity> rs = list(conditions, new Page(1, Integer.MAX_VALUE));
		return rs.getItems();
	}
}
