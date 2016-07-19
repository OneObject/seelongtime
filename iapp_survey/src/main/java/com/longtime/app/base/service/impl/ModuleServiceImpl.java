package com.longtime.app.base.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.ModuleDao;
import com.longtime.app.base.model.ModuleEntity;

import com.longtime.app.base.service.ModuleService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("moduleService")
public class ModuleServiceImpl extends BaseService4HImpl<ModuleEntity, String> implements ModuleService {

    @Resource
    private ModuleDao moduleDao;
    
    @Override
    public BaseDAO<ModuleEntity, String> getDAO() {
        return moduleDao;
    }

}
