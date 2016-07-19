package com.longtime.ajy.mweb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.mweb.model.VoteStatisticsOptionEntity;
import com.longtime.ajy.mweb.service.VoteStatisticsOptionService;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;

@Service("voteStatisticsOptionService")
public class VoteStatisticsOptionServiceImpl extends BaseServiceImpl<VoteStatisticsOptionEntity, String>  implements VoteStatisticsOptionService{
    
	@Resource(name = "voteStatisticsOptionRepository")
	private Repository<VoteStatisticsOptionEntity,String> voteStatisticsOptionRepository;
	
	@Override
	public Repository<VoteStatisticsOptionEntity, String> getRepository() {
		return this.voteStatisticsOptionRepository;
	}

	@Override
	public List<VoteStatisticsOptionEntity> getList(String id) {
		Search search = Search.newInstance();
		search.addEqualFilter("voteactivityid", id);
		search.addEqualFilter("isDel", 0);
		return voteStatisticsOptionRepository.list(search);
	}
	
	
}
