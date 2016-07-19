package com.longtime.app.ixin.mgr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.dao.StudyDao;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.protocol.ReplyMessageText;
import com.longtime.app.ixin.service.handlers.AbstartMessageHandler;

@Service("noticeService")
public class NoticeServiceImpl extends AbstartMessageHandler{

	@Resource(name="studyDao")
	private StudyDao studyDao;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String suffix;
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String qiniuImageBasePath;
	
	@Value("${com.longtime.ixin.matterdetail_basepath}")
	private String matterDetailBasePath;

	@Override
	public ReplyMessage processText(MessageText messageText) {
		MessageEvent messageEvent = new MessageEvent();
		messageEvent.setDomain(messageText.getDomain());
		return processEvent(messageEvent);
	}

	@Override
	public ReplyMessage processEvent(MessageEvent messageEvent) {
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		int itemNum = 5;
		List<ItemArticle> articleItems = studyDao.queryItemArticleList(itemNum,qiniuImageBasePath,suffix,matterDetailBasePath,messageEvent.getDomain(),"ixinnotice");
		if(articleItems == null || articleItems.size()<=0){
			ReplyMessageText text = new ReplyMessageText();
			text.setContent("没有找到相关信息");
			text.setCreateTime(System.currentTimeMillis());
			text.setDomain(messageEvent.getDomain());
			text.setMsgId(111);
			text.setMsgType(ReplyMessage.MESSAGE_TEXT);
			return text;
		}
		replyMessage.setDomain(messageEvent.getDomain());
		replyMessage.setCreateTime(System.currentTimeMillis());
		replyMessage.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
		replyMessage.setCount(articleItems.size());
		replyMessage.setArticleItems(articleItems);
		
		return replyMessage;
	}

}
