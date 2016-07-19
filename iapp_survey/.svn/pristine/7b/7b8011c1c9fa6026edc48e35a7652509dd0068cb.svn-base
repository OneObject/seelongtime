package com.longtime.common.comet;


import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import javax.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MsgNotifer {
	
	private static Logger logger = LoggerFactory.getLogger(MsgNotifer.class);
	
	private BlockingQueue<Message> queue = new LinkedBlockingQueue<Message>();
	
	private static ExecutorService executorService = Executors.newFixedThreadPool(1);

	
	private Set<IMessageListener> listeners;

	private boolean running = true;
	
	@PostConstruct
	public void init() {
		running = true;
		executorService.execute(new Runnable() {
			@Override
			public void run() {
				try {
					while (running) {

						Message data = null;
						try {
							data = queue.take();
						} catch (InterruptedException e) {
							logger.info("get data from queue take data due to fail.", e);
						}

						if (data == null) {
							continue;
						}

						consume(data);
						
					}
				} finally {
					logger.error("operation notifier thread is exit!!!!");
				}
			}
		});
	}
	
	
	public void send(Message msg){
		try {
			queue.put(msg);
		} catch (InterruptedException e) {
			logger.info("put data to queue due to fail.", e);
		}
	}
	private void consume(Message event){
		if(null==event){
			return ;
		}
		for (IMessageListener listener : listeners) {
			try {
				listener.process(event);
			} catch (Throwable e) {
				logger.error("event consume due to fail.", e);
			}
		}
	}

	public void setListeners(Set<IMessageListener> listeners) {
		this.listeners = listeners;
	}
	
	

}
