package com.longtime.app.ixin.service;

import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.service.handlers.SimpleMessageHandler;
import com.longtime.app.ixin.utils.DefaultMessageUtil;
import com.longtime.app.ixin.utils.MessageSession;

public class TextMessageHandler {
	
	public ReplyMessage process(MessageText realMsg){
		
		if(StringUtils.isBlank(realMsg.getContent())){
			return DefaultMessageUtil.getDefaultMessage(realMsg.getDomain());
		}
		ReplyMessage reply;

		boolean isInContext = isInContext(realMsg);//上下文环境
		if(isInContext){
			String hKey = (String) MessageSession.get(realMsg.getFromUserName());
			reply = handlers.get(hKey).process(realMsg);
			reply = installReply(reply, realMsg); //由最上层进行封装？？？
			return reply;
		}
		
		String key = getOperationKey(realMsg);//需要业务处理的
		if(StringUtils.isNotBlank(key)){
			reply = handlers.get(key).process(realMsg);
			reply = installReply(reply, realMsg);
			return reply;
		}
		
		key = getComplexKey(realMsg); //关键字＋变量
		if(StringUtils.isNotBlank(key)){
			reply = handlers.get(key).process(realMsg);
			reply = installReply(reply, realMsg);
			return reply;
		}
		
		reply = simpleMessageHandler.process(realMsg);
		if(reply != null){
			return reply;
		}
		
		return DefaultMessageUtil.getDefaultMessage(realMsg.getDomain());
	}
	
	private String getOperationKey(MessageText realMsg) {
		String uKey = realMsg.getContent();
		for(Entry<String, IMessageHandler> entry : handlers.entrySet()){
			//要把规则的key分开匹配
			if(uKey.equalsIgnoreCase(entry.getKey())){
				return entry.getKey();
			}
		}
		return null;
	}


	//是否是关键字＋变量模式
	private String getComplexKey(MessageText realMsg) {
		String uKey = realMsg.getContent().toLowerCase();
		for(Entry<String, IMessageHandler> entry : handlers.entrySet()){
			if(uKey.startsWith(entry.getKey().toLowerCase())){
				return entry.getKey();
			}
		}
		return null;
	}

	private boolean isInContext(MessageText realMsg) {
		String key = (String) MessageSession.get(realMsg.getFromUserName());
		if(StringUtils.isNotBlank(key)){
			return true;
		}
		return false;
	}

	private ReplyMessage installReply(ReplyMessage reply, MessageText realMsg) {
		reply.setFromUserName(realMsg.getToUserName());
		reply.setToUserName(realMsg.getFromUserName());
		reply.setMsgId(realMsg.getMsgId());
		reply.setCreateTime(System.currentTimeMillis());
		return reply;
	}

	
	private Map<String, IMessageHandler> handlers;

	@Resource(name = "simpleMessageHandler")
	private SimpleMessageHandler simpleMessageHandler;

	public Map<String, IMessageHandler> getHandlers() {
		return handlers;
	}

	public void setHandlers(Map<String, IMessageHandler> handlers) {
		this.handlers = handlers;
	}
	
}
