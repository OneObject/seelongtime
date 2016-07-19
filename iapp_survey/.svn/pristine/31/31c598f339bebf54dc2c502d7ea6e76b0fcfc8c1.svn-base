package com.longtime.app.base.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.FeedBackDao;
import com.longtime.app.base.model.Feed;
import com.longtime.app.base.model.FeedBack;
import com.longtime.app.base.service.FeedBackService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("feedBackService")
public class FeedBackServiceImpl extends BaseService4HImpl<FeedBack, String> implements FeedBackService{
    
    @Resource
    private FeedBackDao feedBackDao;

	@Override
	public BaseDAO<FeedBack, String> getDAO() {
		// TODO Auto-generated method stub
		return feedBackDao;
	}
    
	@Override
	public List<FeedBack> getfeedList(String domain,long start,long end) {
		return this.feedBackDao.getfeedList( domain,start, end);
		
	}

}
