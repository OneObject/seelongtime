package com.longtime.ajy.common.track.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Maps;
import com.longtime.ajy.common.track.model.UserTrackEntity;
import com.longtime.ajy.common.track.model.UserTrackModel;
import com.longtime.ajy.common.track.service.UserTrackService;
import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.common.dao.IdGenerator;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.mongodb.DBCollection;

@Service("userTrackService")
public class UserTrackServiceImpl implements UserTrackService{
	
	@Resource(name = "mongo.db.collection.usertrack")
	private DBCollection usertrack_collection;
	
	@Resource(name="userTrackRepository")
    private Repository<UserTrackEntity, String> userTrackRepository;
	
	@Resource(name = "accountService")
	private AccountService accountService;
	
	@Resource
	private SpecialRepository specialRepository;

	@Override
	public void add(UserTrackModel track) {
		if(StringUtils.isBlank(track.get_id())){
			track.set_id(IdGenerator.uuid32());
		}
		
		//访问统计保存到mongo
//		BasicDBObject dbObject = new BasicDBObject(track.toMap());
//		usertrack_collection.insert(dbObject);

		//访问统计保存到mysql
		UserTrackEntity entity = new UserTrackEntity(track);
		userTrackRepository.insert(entity);
		
		accountService.updateLastLoginTime(track.getUid(),track.getTime());
	}
	
	@Override
	public void add(List<UserTrackModel> tracks){
		if(null==tracks || tracks.isEmpty()){
			return;
		}
		
		List<UserTrackEntity> list = new ArrayList<UserTrackEntity>(tracks.size());
		for(UserTrackModel track:tracks){
//			if(StringUtils.isBlank(track.get_id())){
//				track.set_id(IdGenerator.uuid32());
//			}
//			
//			//访问统计保存到mongo
//			BasicDBObject dbObject = new BasicDBObject(track.toMap());
//			usertrack_collection.insert(dbObject);
			list.add(new UserTrackEntity(track));
			
			
		}
		userTrackRepository.insert(list);	
		
		
		Map<String,Long> mergeUserLastAccessTime = mergeUserLastAccessTime(tracks);
		
		for (Map.Entry<String, Long> entry: mergeUserLastAccessTime.entrySet()) {
			accountService.updateLastLoginTime(entry.getKey(),entry.getValue());
		}
		
		
		
		
	}
	
	
	private Map<String,Long> mergeUserLastAccessTime(List<UserTrackModel> tracks){
		
		Map<String,Long> map = Maps.newConcurrentMap();
		
		for(UserTrackModel track:tracks){
			map.put(track.getUid(), track.getTime());
		}
		return map;
		
	}
	

	@Override
	public long countVisit(String rid, String domain) {
		Search search = new Search();
		search.addEqualFilter("rid",rid);
		search.addEqualFilter("domain", domain);
		long count = userTrackRepository.count(search);
		return count;
	}

	@Override
	public List<Map<String, Object>> countCourseVisitRand(String domain, int top) {
		return specialRepository.countCourseVisitRand(domain,top);
	}
	
}
