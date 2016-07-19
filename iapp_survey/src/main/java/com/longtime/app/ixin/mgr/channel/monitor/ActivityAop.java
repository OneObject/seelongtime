package com.longtime.app.ixin.mgr.channel.monitor;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
@Component
@Aspect
public class ActivityAop
{
	//活动
	public static final String cutPoint="execution(* com.longtime.app.ixin.mgr.service.IActivityService.modifyActivity(..))";
	 @Resource
	 private ChannelListener channelListener;
	 
	 @Resource
	 private ListenerSource listenerSource;

	@Around(cutPoint)  
    public Object around(ProceedingJoinPoint joinpoint ){
		listenerSource.removeListener(channelListener);
		listenerSource.addListener(channelListener);
		Object rsObject = false;
		try {
			rsObject =  joinpoint.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		Object[] objects=joinpoint.getArgs();
		
		ActivityInfo activityInfo=(ActivityInfo) objects[0];
		
		ListenEventVo listenEventVo=new ListenEventVo();
		
		if(activityInfo!=null){
			listenEventVo.setListenname("ChannelListener");
			listenEventVo.setBody(activityInfo.getId()+","+activityInfo.getPicUrl()+","+activityInfo.getName());
		}
		
		listenerSource.notifyEvent(listenEventVo,ChannelResourceEntity.COURSE_RESTYPE);
		
		return rsObject;
    }  

}
