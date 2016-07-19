package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.SignDao;
import com.longtime.app.base.model.DailySign;
import com.longtime.app.base.service.SignService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service(value="signService")
public class SignServiceImpl extends BaseService4HImpl<DailySign, Long> implements SignService {
	
	@Resource
    private SignDao signDao;
    
	@Override
	public BaseDAO<DailySign, Long> getDAO() {
		return signDao;
	}

}
