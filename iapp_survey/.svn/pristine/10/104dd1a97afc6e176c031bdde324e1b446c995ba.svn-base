package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.dao.FeedDao;
import com.longtime.app.base.model.Feed;
import com.longtime.app.base.service.FeedService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("feedService")
public class FeedServiceImpl extends BaseService4HImpl<Feed, Long> implements FeedService{
    
    @Resource
    private FeedDao feedDao;
    
    @Override
    public BaseDAO<Feed, Long> getDAO() {
        return feedDao;
    }

}
