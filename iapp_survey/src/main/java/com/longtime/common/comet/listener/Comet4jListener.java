package com.longtime.common.comet.listener;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import javax.annotation.PostConstruct;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Comet4jListener implements ServletContextListener {
	
	private static Logger logger = LoggerFactory.getLogger(Comet4jListener.class);
	
	private static String CHANNEL = "";
	
	private BlockingQueue<Object> queue = new LinkedBlockingQueue<Object>();

	private static ExecutorService executorService = Executors.newFixedThreadPool(1);

	
	private boolean running = true;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		CometContext cc = CometContext.getInstance();

		cc.registChannel(CHANNEL);//注册应用的channel

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		running = false;
	}
	
	

	@PostConstruct
	public void init() {
		running = true;
		executorService.execute(new Runnable() {
			@Override
			public void run() {
				try {
					while (running) {

						Object data = null;
						try {
							data = queue.take();
						} catch (InterruptedException e) {
							logger.info("comet4j from queue take data due to fail.", e);
						}

						if (data == null) {
							continue;
						}

						
						CometEngine engine = CometContext.getInstance().getEngine();
                        engine.sendToAll(CHANNEL, data);

                        
						
					}
				} finally {
					logger.error("operation notifier thread is exit!!!!");
				}
			}
		});
	}
	
	

}
