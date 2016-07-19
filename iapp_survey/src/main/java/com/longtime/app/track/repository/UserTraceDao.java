package com.longtime.app.track.repository;

import com.longtime.app.track.model.UserTrackEntity;
import com.longtime.common.dao.BaseDAO;

public interface UserTraceDao extends BaseDAO<UserTrackEntity, String>{


    long countPV(long dayStart, long dayEnd, String rid, String model,  String domain);
    long countUV(long dayStart, long dayEnd, String rid, String model,  String domain);

}
