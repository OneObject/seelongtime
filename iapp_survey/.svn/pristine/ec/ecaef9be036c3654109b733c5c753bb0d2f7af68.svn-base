package com.longtime.app.ixin.mgr.service.impl;

import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.service.IActivityService;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;

import org.springframework.stereotype.Service;

@Service("activitySignService")
public class ActivitySignServiceImpl extends ActivityServiceImpl implements IActivityService {
	@Override
	protected String getURL( ActivityInfo info) {
		return getActivityBasePath() + "id=" + info.getId()  + "&fdomain="+info.getDomain() + "&code=sign";
	}
	
}
