package com.longtime.app.ixin.service.impl;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.jongo.Jongo;
import org.jongo.MongoCollection;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.protocol.MessageLog;
import com.longtime.app.ixin.service.MessageLogService;
import com.longtime.app.util.Constant;

@Service("messageLogService")
public class MessageLogServiceImpl implements MessageLogService{
	
	 @Resource(name = "jongo")
	 private Jongo jongo ;
	 
	 private static MongoCollection coll;
	 
	 @PostConstruct
	 private void init(){
		 coll =  jongo.getCollection(Constant.COLLECTION_MESSAGE_LOG);
	 }

	@Override
	public void add(MessageLog ml) {
		coll.insert(ml);
		
	}
	
	@Override
	public MessageLog findById(String id,String domain) {
		
		MessageLog messageLog = coll.findOne("{_id:#,domain:#}",id,domain).as(MessageLog.class);
		
		return messageLog;
	}

	@Override
	public long getKeywordTimes(String keyword,String domain) {
		long count = coll.count("{msg:#,domain:#}",keyword,domain);
		return count;
	}
	
	@Override
	public long getKeywordUsers(String keyword,String domain) {
		long count = coll.distinct("fromusername").query("{msg:#,domain:#}",keyword,domain).as(String.class).size();
		return count;
	}

}
