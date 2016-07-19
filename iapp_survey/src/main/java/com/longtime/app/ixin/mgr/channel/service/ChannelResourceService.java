package com.longtime.app.ixin.mgr.channel.service;

import java.util.List;

import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ResourceVO;

public interface ChannelResourceService
{
	int deleteByChannelid(String channelid);
    /**
     * 
     * @param restype  资源类型 为-1 查询所有
     * @param currentpage
     * @param pagesize
     * @param weight 权重 为空时不排序
     * @param searchContent 
     * @return
     */
	List<ChannelResourceEntity> getChannelResourceEntities(int restype,String channelid,int currentpage,int pagesize,String weight, String searchContent);
	
	int deleteById(String id);
	
	int batchinsert(String channelid, String[] resourceids,String[] titles,String[] covers,int restype);
	
	int gettotal(String channelid, int restype, String searchContent);
	
	List<ChannelResourceEntity> getlist(String resourceid,int restype);
	
	List<ChannelResourceEntity> getlist(String channelid);
	
	int update(ChannelResourceEntity channelResourceEntity);
	
	public int deleteByresourceid(String resourceid);
	
	boolean batchUpdate(List<ResourceVO> list);
}
