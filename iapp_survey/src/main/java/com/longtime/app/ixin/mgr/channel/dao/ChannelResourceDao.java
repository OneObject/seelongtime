package com.longtime.app.ixin.mgr.channel.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.model.ResourceVO;

public interface ChannelResourceDao
{
   int deleteByChannelid(String channelid);
   
   List<ChannelResourceEntity> getChannelResourceEntities(int restype,String channelid,int currentpage,int pagesize,String weight, String searchContent);
   
   /**
    * 
    * @param id 关联表的id
    * @return
    */
   int deleteById(String id);
   
   ChannelResourceEntity getChannelResourceEntity(String id);
   
   int batchinsert(String channelid, String[] resourceids,String[] titles,String[] covers,int restype);
   
   int gettotal(String channelid,int restype, String searchContent);
   
   List<ChannelResourceEntity> getlist(String resourceid,int restype);
	
   int update(ChannelResourceEntity channelResourceEntity);

   List<ChannelResourceEntity> getlist(String channelid);
   
   int deleteByresourceid(String resourceid);

boolean batchUpdate(List<ResourceVO> list);
}
