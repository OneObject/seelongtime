package com.longtime.app.base.service;


import java.util.List;

import com.longtime.app.base.model.Feed;
import com.longtime.app.base.model.FeedBack;
import com.longtime.common.service.BaseService;

public interface FeedBackService extends BaseService<FeedBack, String>{
	public List<FeedBack> getfeedList(String doamin,long start,long end);
}
