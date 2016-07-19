package com.longtime.app.base.dao;

import java.util.List;

import com.longtime.app.base.model.Feed;
import com.longtime.app.base.model.FeedBack;
import com.longtime.common.dao.BaseDAO;

public interface FeedBackDao extends BaseDAO<FeedBack, String>{
	List<FeedBack> getfeedList(String doamin,long start,long end);
}
