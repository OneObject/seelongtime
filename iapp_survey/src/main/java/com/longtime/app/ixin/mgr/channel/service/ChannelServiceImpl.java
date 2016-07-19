package com.longtime.app.ixin.mgr.channel.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.channel.dao.ChannelDao;
import com.longtime.app.ixin.mgr.channel.model.ChannelEntity;

@Service(value="channelService")
public class ChannelServiceImpl implements ChannelService {
    
	@Resource
	private ChannelDao channelDao;
	
	@Override
	public List<ChannelEntity> getChannelList(String domain,int currentpage, int pagesize) {
		return this.channelDao.getChannelList(domain,currentpage, pagesize);
	}

	@Override
	public int save(ChannelEntity entity)
	{
		return this.channelDao.save(entity);
	}

	@Override
	public int delete(String id)
	{
		return this.channelDao.delete(id);
	}

	@Override
	public int getTotalNum(String domain) {
		return this.channelDao.getTotalNum(domain);
	}

	@Override
	public ChannelEntity getChannelEntity(String id) {
		return this.channelDao.getChannelEntity(id);
	}

	@Override
	public void update(ChannelEntity channelEntity) {
		this.channelDao.update(channelEntity);
	}



}
