package com.longtime.app.remind.repository.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.remind.model.RefreshRecode;
import com.longtime.app.remind.repository.RefreshRecodeRepository;
import com.myctu.platform.repository.engine.storage.mongo.repository.BaseMongoCRUDRepository;

@Repository(value="refreshRecodeRepository")
public class RefreshRecodeRepositoryImpl extends BaseMongoCRUDRepository<RefreshRecode, String> implements RefreshRecodeRepository{

}
