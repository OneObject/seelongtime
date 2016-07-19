package com.longtime.app.track.task;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.app.track.model.UserTrackModel;
import com.longtime.app.track.service.UserTrackService;
import com.longtime.common.spring.SpringContextUtil;

public class UserTrackTask {

	private static Logger logger = LoggerFactory.getLogger(UserTrackTask.class);
	
	private static AtomicBoolean init = new AtomicBoolean(false);
	
	private static AtomicBoolean running = new AtomicBoolean(false);
	
	private static ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	private static BlockingQueue<UserTrackModel> queue = new LinkedBlockingQueue<UserTrackModel>();
	
	private static UserTrackService userTrackService;
	
	private static void init(){
		if(init.get()){
			return;
		}
		synchronized (init) {
			if(init.get()){
				return;
			}
			if(userTrackService == null){
				userTrackService = SpringContextUtil.getBean(UserTrackService.class);
			}
			if(!running.get()){
				start();
			}
			init.set(true);
		}
	}
	
	private static void start(){
		if(running.get()){
			return;
		}
		running.set(true);
		executorService.execute(new Runnable() {
			
			@Override
			public void run() {
				try {
					while (running.get()) {
						UserTrackModel track = null;
						try {
							track = queue.take();
							if(track == null){
								continue;
							}
							userTrackService.addUserTrack(track);
						} catch (Exception e) {
							logger.error("add user track due to error",e);
						}
					}
				} catch (Exception e) {
					logger.error("proccess creditlog thread is exit!!!!");
				}
			}
		});
	}
	
	@Deprecated
	public static void save(String uid,String openId,String domain,String url,long time,String agent,String request_method, String sessionid){
		if(StringUtils.isBlank(openId)){
			openId = null;
		}
		UserTrackModel track = new UserTrackModel(uid,openId,domain,url,time,agent,request_method,sessionid);
		boolean bool = offer(track);
		if(!bool){
			logger.error("put creditlog queue due to fail. createlog=[{},{},{},{},{},{}]",uid,openId,domain,url,time,agent);
		}
	}
	
	public static void save(UserTrackModel track){
		if(null==track){
			return;
		}
		boolean bool = offer(track);
		if(!bool){
			logger.error("put creditlog queue due to fail. createlog=[{}]",track);
		}
		
	}

	private static boolean offer(UserTrackModel track) {
		if(!init.get()){
			init();
		}
		return queue.offer(track);
	}
}
