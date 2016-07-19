package com.longtime.app.track.repository;

import java.util.Map;

import com.longtime.app.track.model.UserTrackModel;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

public interface UserTrackRepository extends MongoRepository<UserTrackModel, String>{

	long distinctCount(String field, Map<String, Object> query);

}
