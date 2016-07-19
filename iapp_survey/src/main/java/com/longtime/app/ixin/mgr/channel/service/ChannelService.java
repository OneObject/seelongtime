package com.longtime.app.ixin.mgr.channel.service;

import java.util.List;

import com.longtime.app.ixin.mgr.channel.model.ChannelEntity;

public interface ChannelService {
	List<ChannelEntity> getChannelList(String domain,int currentpage,int pagesize);
	
	int save(ChannelEntity entity);
	
	int delete(String id);
	
	int getTotalNum(String domain);
	
	ChannelEntity getChannelEntity(String id);
	
	void update(ChannelEntity channelEntity);
	
}
