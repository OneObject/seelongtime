package com.longtime.app.ixin.mgr.channel.dao;

import com.longtime.app.ixin.mgr.channel.model.ChannelEntity;
import java.util.List;
public interface ChannelDao {
	
	int save(ChannelEntity entity);
	
	List<ChannelEntity> getChannelList(String domain,int currentpage,int pagesize);
	
	int delete(String id);
	
	int getTotalNum(String domain);
	
	ChannelEntity getChannelEntity(String id);
	
	void update(ChannelEntity channelEntity);
}
