package com.longtime.app.ixin.service.handlers;

import com.longtime.app.ixin.protocol.IMessage;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.utils.MessageSession;

public abstract class AbstartContextMessageHandler{
	
	public ReplyMessage process(IMessage message) {
		if(message instanceof MessageEvent){
			MessageEvent messageEvent = (MessageEvent) message;
			return processEvent(messageEvent);
		}
		MessageText messageText = (MessageText) message;
		return processText(messageText);
	}
	
	abstract ReplyMessage processText(MessageText messageText);

	abstract ReplyMessage processEvent(MessageEvent messageEvent);
	
	public void setAttribute(String key,Object value){
		MessageSession.set(key, value);
	}
	
	public Object getAttribute(String key){
		return MessageSession.get(key);
	}
	
	public void removeAttribute(String key){
		MessageSession.remove(key);
	}
}
