/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:57
 */
package com.longtime.app.iask.service.impl;

import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.longtime.app.iask.model.TagEntity;
import com.longtime.app.iask.repository.TagRepository;
import com.longtime.app.iask.service.TagService;
import com.longtime.common.mongo.AbstractService;
import com.myctu.platform.repository.engine.storage.mongo.repository.MongoRepository;

/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
@Service("tagService")
public class TagServiceImpl extends AbstractService<TagEntity, String> implements TagService{
	
	private static Logger logger = LoggerFactory.getLogger(TagServiceImpl.class);

	private static ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	private static BlockingQueue<List<String>> queue = new LinkedBlockingQueue<List<String>>();
	
	private boolean running = true;
	
	@Resource(name = "tagRepository")
	private TagRepository tagRepository;
	
	@Override
	public MongoRepository<TagEntity, String> getMongoRepository() {
		return this.tagRepository;
	}

	@Override
	public void putQueue(List<String> tags) {
		queue.offer(tags);
	}
	
	@PostConstruct
	public void init(){
		running = true;
		executorService.execute(new Runnable() {
			@Override
			public void run() {
				while(running){
					List<String> tags = null;
					try {
						tags = queue.poll(1, TimeUnit.SECONDS);
					} catch (InterruptedException e) {
						logger.error(String.format("poll tags due to error!,the message is %s",e));
					}
					if(tags == null){
						continue;
					}
					tagRepository.addTags(tags);
				}
			}
		});
	}

}
