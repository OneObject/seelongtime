package com.longtime.ajy.mweb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.mweb.model.VoteStatisticsQuestionEntity;
import com.longtime.ajy.mweb.service.VoteStatisticsQuestionService;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;

@Service("voteStatisticsQuestionService")
public class VoteStatisticsQuestionServiceImpl extends BaseServiceImpl<VoteStatisticsQuestionEntity, String>  implements VoteStatisticsQuestionService{
    
	@Resource(name = "voteStatisticsQuestionRepository")
	private Repository<VoteStatisticsQuestionEntity,String> voteStatisticsQuestionRepository;
	
	@Override
	public Repository<VoteStatisticsQuestionEntity, String> getRepository() {
		return this.voteStatisticsQuestionRepository;
	}


	@Override
	public List<VoteStatisticsQuestionEntity> getList(String id) {
		Search search = Search.newInstance();
		search.addEqualFilter("voteactivityid", id);
		search.addEqualFilter("isDel", 0);
		return voteStatisticsQuestionRepository.list(search);
	}
	
}
