package com.longtime.app.ixin.mgr.channel.monitor;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.model.RewardActivity;

/**
 * 使用aop对java bean进行拦截
 * 
 * @author fangxinyuan
 * @param <T>
 * 
 */
@Component
@Aspect
public class RewardAop {
	 public static final String cutPoint="execution(* com.longtime.app.ixin.mgr.service.IRewardService.modifyRewardFirstStep(..))";
	 
	 @Resource
	 private ChannelListener channelListener;
	 
	 @Resource
	 private ListenerSource listenerSource;

	@Around(cutPoint)  
    public Object after(ProceedingJoinPoint joinpoint ){
		listenerSource.removeListener(channelListener);
		listenerSource.addListener(channelListener);
		
		Object object=false;
		try {
			object=joinpoint.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		Object[] objects=joinpoint.getArgs();
		
		RewardActivity reward = (RewardActivity) objects[0];
		
		ListenEventVo listenEventVo=new ListenEventVo();
		
		if(reward!=null){
			listenEventVo.setListenname("ChannelListener");
			listenEventVo.setBody(reward.getId()+","+reward.getExplain1().getPicUrl()+","+reward.getExplain1().getTitle());
		}
		
		listenerSource.notifyEvent(listenEventVo,ChannelResourceEntity.REWARD_RESTYPE);
		return object;
    }  
}
