package com.longtime.app.track.repository.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.longtime.app.track.model.UserTrackModel;
import com.longtime.app.track.repository.UserTrackRepository;
import com.myctu.platform.repository.engine.domain.query.ExtQuery;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

@Repository("userTrackRepository")
public class UserTrackRepositoryImpl extends BaseMongoCRUDRepository<UserTrackModel, String> implements UserTrackRepository{

	@Override
	public long distinctCount(String field,Map<String, Object> query) {
		return this.getMongoTemplate().getCollection(getCollectionName()).distinct(field, ExtQuery.valueOf(query).getQueryObject()).size();
	}
}
