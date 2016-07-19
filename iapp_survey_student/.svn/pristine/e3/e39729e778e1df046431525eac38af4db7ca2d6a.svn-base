/**
 * project : iask
 * user created : yangwk
 * date created : 2013-7-12 - 下午2:03:57
 */
package com.longtime.ajy.student.service.impl;

import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.longtime.ajy.model.TagEntity;
import com.longtime.ajy.student.service.TagService;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;


/**
 * @since 2013-7-12
 * @author yangwk
 * 
 */
@Service("tagService")
public class TagServiceImpl extends BaseServiceImpl<TagEntity,String>implements TagService{
	
	private static Logger logger = LoggerFactory.getLogger(TagServiceImpl.class);

	private static ExecutorService executorService = Executors.newFixedThreadPool(1);
	
	private static BlockingQueue<List<String>> queue = new LinkedBlockingQueue<List<String>>();
	
	private boolean running = true;
	
	@Resource
	private Repository<TagEntity,String> tagRepository;
	
	@Override
	public Repository<TagEntity, String> getRepository() {
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
					addTags(tags);
				}
			}
		});
	}
	
	@Override
	public void addTags(List<String> tags) {
		if(CollectionUtils.isEmpty(tags)){
			return;
		}
		for(String tag : tags){
			long count = count(tag);
			if(count == 0){
				TagEntity tagEntity = new TagEntity();
				tagEntity.setName(tag);
				this.tagRepository.insert(tagEntity);
			}
		}
		
	}

	/**
	 * 检查这个tag在数据库内的数量
	 * @param tag
	 * @return
	 */
	public  long count(String tag) {
		Search search=Search.newInstance();
		search.addEqualFilter("name",tag);
		return this.tagRepository.count(search);
	}

}
