package com.longtime.app.base.service;

import com.longtime.app.base.model.IndexModuleEntity;
import com.longtime.common.service.BaseService;

public interface DiyIndexModuleService extends BaseService<IndexModuleEntity, String>{

	void deleteByIndexId(String id);

}
