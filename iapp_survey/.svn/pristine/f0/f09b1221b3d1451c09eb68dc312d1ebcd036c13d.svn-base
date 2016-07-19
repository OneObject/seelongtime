package com.longtime.app.ixin.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageText;

public class EventMessageHandler {
	
	private static Logger logger = LoggerFactory.getLogger(EventMessageHandler.class);
	
	//系统内处理事件的bean，通过配置注入
	private Map<String, IMessageHandler> handlers;

	public ReplyMessage process(MessageEvent realMsg){
		if(handlers.containsKey(realMsg.getEventKey())){
			ReplyMessage reply = handlers.get(realMsg.getEventKey()).process(realMsg);
			reply = installReply(reply,realMsg);
			return reply;
		} else {
			logger.error(String.format("unsupport event %s",realMsg.getEventKey()));
			return getDefaultReply();
		}
	}

	private ReplyMessage installReply(ReplyMessage reply, MessageEvent realMsg) {
		reply.setFromUserName(realMsg.getToUserName());
		reply.setToUserName(realMsg.getFromUserName());
		reply.setMsgId(realMsg.getMsgId());
		reply.setCreateTime(System.currentTimeMillis());
		return reply;
	}

	private ReplyMessage getDefaultReply() {
		ReplyMessageText reply = new ReplyMessageText();
		reply.setContent("测试文本输入：test_text；测试多图文输入：test_rich。");
		return reply;
	}

	public Map<String, IMessageHandler> getHandlers() {
		return handlers;
	}

	public void setHandlers(Map<String, IMessageHandler> handlers) {
		this.handlers = handlers;
	}
	
}
