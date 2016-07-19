package com.longtime.app.ixin.mgr.channel.monitor;

import javax.annotation.Resource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import com.longtime.app.ixin.mgr.channel.model.ChannelResourceEntity;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;

/**
 * 使用aop对java bean进行拦截
 * 
 * @author fangxinyuan
 * @param <T>
 * 
 */
@Component
@Aspect
public class FodderAop {
	//素材
	 public static final String cutPoint="execution(* com.longtime.app.ixin.mgr.fodder.service.FodderService.updateFodder(..))";
	 
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
		
		FodderVO fodderVO=(FodderVO) objects[0];
		
		ListenEventVo listenEventVo=new ListenEventVo();
		
		if(fodderVO!=null){
			listenEventVo.setListenname("ChannelListener");
			listenEventVo.setBody(fodderVO.getBaseId()+","+fodderVO.getCoverPath()+","+fodderVO.getTitle());
		}
		
		listenerSource.notifyEvent(listenEventVo,ChannelResourceEntity.SUCAI_RESTYPE);
    }  
}
