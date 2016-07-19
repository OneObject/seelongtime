package com.longtime.app.ixin.mgr.channel.monitor;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;

/**
 * 使用aop对java bean进行拦截
 * 
 * @author fangxinyuan
 * @param <T>
 * 
 */
//@Component
//@Aspect
public class VoteAop {
	 public static final String cutPoint="execution(* com.longtime.app.ixin.mgr.vote.service.VoteService.saveOrUpdateStep1(..))";
	 
	 @Resource
	 private ChannelListener channelListener;
	 
	 @Resource
	 private ListenerSource listenerSource;
	 
	@Around(cutPoint)  
    public void after(ProceedingJoinPoint joinpoint ){
		listenerSource.removeListener(channelListener);
		listenerSource.addListener(channelListener);
		
		try {
			joinpoint.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		Object[] objects=joinpoint.getArgs();
		
		VoteEntity voteEntity=(VoteEntity) objects[0];
		
		ListenEventVo listenEventVo=new ListenEventVo();
		
		if(voteEntity!=null){
			listenEventVo.setListenname("ChannelListener");
			listenEventVo.setBody(voteEntity.getId()+","+voteEntity.getCoverPath()+","+voteEntity.getTitle());
		}
		if(voteEntity.getSurveyOrvote()==VoteEntity.SURVEY){
		listenerSource.notifyEvent(listenEventVo,ChannelResourceEntity.SURVEY_RESTYPE);
		}else{
			listenerSource.notifyEvent(listenEventVo,ChannelResourceEntity.VOTE_RESTYPE);
		}
    }  
}
