package com.longtime.app.base.dao.impl;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.FeedDao;
import com.longtime.app.base.model.Feed;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("feedDao")
public class FeedDaoImpl extends  BaseDAOImpl<Feed, Long> implements FeedDao{

}
