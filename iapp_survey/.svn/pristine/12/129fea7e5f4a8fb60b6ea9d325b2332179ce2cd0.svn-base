package com.longtime.app.ixin.mgr.channel.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.channel.dao.ChannelResourceDao;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ResourceVO;

@Service(value="channelResourceService")
public class ChannelResourceServiceImpl implements ChannelResourceService
{
    @Resource
    private ChannelResourceDao channelResourceDao;
	
	
	@Override
	public int deleteByChannelid(String channelid) {
		return this.channelResourceDao.deleteByChannelid(channelid);
	}


	@Override
	public List<ChannelResourceEntity> getChannelResourceEntities(int restype,String channelid,int currentpage, int pagesize, String weight,String searchContent) {
		return this.channelResourceDao.getChannelResourceEntities(restype,channelid,currentpage, pagesize, weight,searchContent);
	}


	@Override
	public int deleteById(String id) {
		return this.channelResourceDao.deleteById(id);
	}


	@Override
	public int batchinsert(String channelid, String[] resourceids,String[] titles,String[] covers,int restype) {
		return this.channelResourceDao.batchinsert(channelid,resourceids,titles,covers,restype);
	}


	@Override
	public int gettotal(String channelid, int restype,String searchContent) {
		return this.channelResourceDao.gettotal(channelid, restype,searchContent);
	}


	@Override
	public List<ChannelResourceEntity> getlist(String resourceid, int restype) {
		return this.channelResourceDao.getlist(resourceid, restype);
	}

	@Override
	public List<ChannelResourceEntity> getlist(String channelid) {
		return this.channelResourceDao.getlist(channelid);
	}

	@Override
	public int update(ChannelResourceEntity channelResourceEntity) {
		return this.channelResourceDao.update(channelResourceEntity);
	}

	@Override
	public int deleteByresourceid(String resourceid){
		return this.channelResourceDao.deleteByresourceid(resourceid);
	}


	@Override
	public boolean batchUpdate(List<ResourceVO> list) {
		
		return this.channelResourceDao.batchUpdate(list);
	}



}
