package com.longtime.app.track.service;

import java.util.Map;

import com.longtime.app.track.model.UserTrackModel;
import com.longtime.common.mongo.CommonService;

public interface UserTrackService extends CommonService<UserTrackModel, String>{

	public long distinctCount(String field,Map<String, Object> map);

	public void addUserTrack(UserTrackModel track);

	public long historycount(String rid, String from, String domain);
}
