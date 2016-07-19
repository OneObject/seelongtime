package com.longtime.ajy.mweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.longtime.ajy.mweb.model.UserVoteEntity;
import com.longtime.ajy.mweb.model.VoteActivityEntity;
import com.longtime.ajy.mweb.service.UserVoteService;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Filter;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;

@Service("userVoteService")
public class UserVoteServiceImpl extends BaseServiceImpl<UserVoteEntity, String>  implements UserVoteService{
    
	@Resource(name = "userVoteRepository")
	private Repository<UserVoteEntity,String> userVoteRepository;
	
	@Override
	public Repository<UserVoteEntity, String> getRepository() {
		return this.userVoteRepository;
	}

	@Override
	public List<String> getActivityIds(List<VoteActivityEntity> list, String uid) {
		if(CollectionUtils.isEmpty(list)){
			return Lists.newArrayList();
		}
		List<String> ids = new ArrayList<String>(list.size());
		for(VoteActivityEntity entity : list){
			ids.add(entity.getId());
		}
		Search search = Search.newInstance();
		search.addEqualFilter("base_uid", uid);
		search.addFilter(Filter.in("activityId", ids));
		ResultSet<UserVoteEntity> rs = listAndCount(search, new Pageable(Integer.MAX_VALUE));
		
		ids = new ArrayList<String>(list.size());
		for(UserVoteEntity entity : rs.getData()){
			ids.add(entity.getActivityId());
		}
		return ids;
	}
	
	@Override
	public List<UserVoteEntity> getUserVotes(List<VoteActivityEntity> list, String uid) {
		if(CollectionUtils.isEmpty(list)){
			return Lists.newArrayList();
		}
		List<String> ids = new ArrayList<String>(list.size());
		for(VoteActivityEntity entity : list){
			ids.add(entity.getId());
		}
		Search search = Search.newInstance();
		search.addEqualFilter("base_uid", uid);
		search.addFilter(Filter.in("activityId", ids));
		ResultSet<UserVoteEntity> rs = listAndCount(search, new Pageable(Integer.MAX_VALUE));
		return rs.getData();
	}
	
	@Override
	public boolean checkUserIsParticipate(String id, String uid) {
		Search search = Search.newInstance();
		search.addEqualFilter("base_uid", uid);
		search.addEqualFilter("activityId", id);
		long count = count(search);
		return count>0;
	}

}
