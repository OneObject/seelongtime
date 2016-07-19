package com.longtime.app.base.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.longtime.app.base.dao.ActivityPersonDao;
import com.longtime.app.base.model.ActivityPersonEntity;
import com.longtime.app.base.service.ActivityPersonService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service
public class ActivityPersonServiceImpl extends BaseService4HImpl<ActivityPersonEntity, String> implements ActivityPersonService{
    
    @Resource
    private ActivityPersonDao activityPersonDao;
    
    @Override
    public BaseDAO<ActivityPersonEntity, String> getDAO() {
        return activityPersonDao;
    }

	


}
