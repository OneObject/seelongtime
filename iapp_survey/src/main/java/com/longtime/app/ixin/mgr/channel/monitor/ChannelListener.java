package com.longtime.app.ixin.mgr.channel.monitor;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.channel.service.ChannelResourceService;

/**
 * 栏目监听实现类
 * @author fangxinyuan
 *使用aop切面方式
 */
@Service
public class ChannelListener implements Listener{
	
	@Resource
	private ChannelResourceService channelResourceService;
	
	@Override
	public void handleEvent(ListenerEvent listenerEvent,ListenEventVo listenEventVo,int restype) {
		if(listenEventVo!=null){
			
			String body=listenEventVo.getBody();
			
			String[] str=body.split(",");
			
            List<ChannelResourceEntity> list=this.channelResourceService.getlist(str[0],restype);
            
            if(list!=null && list.size()>0){
            	for(ChannelResourceEntity channelResourceEntity:list){
            		channelResourceEntity.setRescover(str[1]);
            		channelResourceEntity.setResname(str[2]);
            		this.channelResourceService.update(channelResourceEntity);
            	}
            }
			
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
//	public static void main(String args[]){
//		MonitorSource monitorSource=new MonitorSource();
//		
//		ChannelListener channelListener=new ChannelListener();
//		//注册监听器
//		monitorSource.addListener(channelListener);
//		
//		monitorSource.notifyEvent();
//	}
}
