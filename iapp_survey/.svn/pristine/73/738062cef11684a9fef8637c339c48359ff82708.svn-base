package com.longtime.app.ixin.mgr.topic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.topic.dao.TopicDao;
import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicStudentEntity;
import com.longtime.app.ixin.mgr.topic.service.TopicService;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.service.handlers.AbstartMessageHandler;
import com.longtime.app.util.HTMLUtils;
import com.longtime.app.util.IdGenerator;

@Service(value = "topicService")
public class TopicServiceImpl extends AbstartMessageHandler implements TopicService {
	@Resource(name="topicDao")
	private TopicDao topicDao;
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String coverBasePath;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String suffix;
	
	@Override
	public String saveOrUpdate(TopicEntity entity) {
		if(StringUtils.isBlank(entity.getId())){
			entity.setId((String)IdGenerator.nextId32());
		}
		topicDao.saveOrUpdate(entity);
		return entity.getId();
	}

	@Override
	public int getTopicTotalSize(String domain) {
		
		return topicDao.getTopicTotalSize(domain);
	}

	@Override
	public List<TopicEntity> queryTopicEntityList(int pageSize, int currPage,
			String domain) {
		List<TopicEntity> list = topicDao.queryTopicEntityList(pageSize,currPage,domain);
		for (TopicEntity topicEntity : list) {
			topicEntity.setCoverPath(coverBasePath+topicEntity.getCoverPath()+suffix);
			topicEntity.setSummary(HTMLUtils.html2Text(topicEntity.getSummary()));
		}
		return list;
	}

	@Override
	public TopicEntity getTopicEntityById(String id) {
		
		return topicDao.getTopicEntityById(id);
	}

	@Override
	public void del(String id) {
		topicDao.del(id);
	}

	@Override
	public ReplyMessage processText(MessageText messageText) {
		MessageEvent messageEvent = new MessageEvent();
		messageEvent.setDomain(messageText.getDomain());
		return processEvent(messageEvent);
	}

	@Override
	public ReplyMessage processEvent(MessageEvent messageEvent) {
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		//TODO..
		return replyMessage;
	}

	@Override
	public List<TopicStudentEntity> getTopicEntities(String searchval,String activityid, String domain,int pagesize,int currpage) {
		return this.topicDao.getTopicEntities(searchval,activityid, domain,pagesize,currpage);
	}

	@Override
	public int getTopicStudentCount(String searchval,String actitityid, String domain) {
		return this.topicDao.getTopicStudentCount(searchval,actitityid, domain);
	}
	
	
	

	@Override
	public void delstudenttopic(String id) {
           this.topicDao.delstudenttopic(id);		
	}

	@Override
	public TopicStudentEntity getTopicStudentEntity(String id) {
		return this.topicDao.getTopicStudentEntity(id);
	}



	@Override
	public List<TopicStudentEntity> getTopicStudentEntities(String searchval,
			String domain, int pagesize, int currpage) {
		
		return this.topicDao.getTopicStudentEntities(searchval, domain, pagesize, currpage);
	}

	@Override
	public int getTopicStudentCount(String searchval, String domain) {
		
		return this.topicDao.getTopicStudentCount(searchval, domain);
	}

	

	@Override
	public void batchtopicstudentdel(String[] ids) {
		this.topicDao.batchtopicstudentdel(ids);
	}

	
	@Override
	public void recommendtopicstudent(String id) {
		this.topicDao.recommendtopicstudent(id);
	}

	@Override
	public void topstudenttopic(String id) {
		this.topicDao.topstudenttopic(id);
	}

	@Override
	public List<TopicStudentEntity> getTopicEntities(String searchval,
			String domain, int pagesize, int currpage) {
		return this.topicDao.getTopicEntities(searchval, domain, pagesize, currpage);
	}

	@Override
	public int getTopicStudentCounts(String searchval, String domain) {
		return this.topicDao.getTopicStudentCounts(searchval, domain);
	}

	@Override
	public void cancelrecommendtopic(String id) {
        this.topicDao.cancelrecommendtopic(id);		
	}

	@Override
	public void canceltoptopic(String id) {
		this.topicDao.canceltoptopic(id);
	}

	@Override
	public boolean shield(String id, String shield)
	{
		return this.topicDao.shield(id,shield) == 1 ;
	}
	
	

}
