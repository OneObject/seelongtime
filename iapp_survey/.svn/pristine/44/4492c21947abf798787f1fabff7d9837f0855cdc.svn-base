package com.longtime.app.track.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.longtime.app.track.model.UserTrackEntity;
import com.longtime.app.track.model.UserTrackModel;
import com.longtime.app.track.repository.UserTraceDao;
import com.longtime.app.track.repository.UserTrackRepository;
import com.longtime.app.track.service.UserTrackService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

@Service("userTrackService")
public class UserTrackServiceImpl extends AbstractService<UserTrackModel, String> implements UserTrackService{

	@Resource(name = "userTrackRepository")
	private UserTrackRepository userTrackRepository;
	
	@Resource
	private UserTraceDao userTraceDao;
	
	
	@Override
	public MongoRepository<UserTrackModel, String> getMongoRepository() {
		return this.userTrackRepository;
	}

	@Override
	public long distinctCount(String field,Map<String, Object> map) {
		return userTrackRepository.distinctCount(field,map);
	}

	@Override
	public void addUserTrack(UserTrackModel track) {
		
		//访问记录保存到mongo
//		this.userTrackRepository.save(track);
		
		
		//访问记录保存到mysql
		UserTrackEntity entity = new UserTrackEntity(track);
		this.userTraceDao.insert(entity);
		
	}

	@Override
	public long historycount(String rid, String from, String domain) {
		Search search = new Search();
		search.addFilter(Filter.equal("rid", rid));
		search.addFilter(Filter.equal("model", from));
		search.addFilter(Filter.equal("domain", domain));
		long count = this.userTraceDao.count(search);
		return count;
	}

	

}
