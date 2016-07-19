package com.longtime.app.ixin.service.handlers;

import com.longtime.app.ixin.protocol.IMessage;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageImage;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.service.IMessageHandler;
import com.longtime.app.ixin.utils.MessageSession;

public abstract class AbstartMessageHandler implements IMessageHandler{
	
	public ReplyMessage process(IMessage message) {
		if(message instanceof MessageText){
			MessageText messageText = (MessageText) message;
			return processText(messageText);
		}else if(message instanceof MessageEvent){
			MessageEvent messageEvent = (MessageEvent) message;
			return processEvent(messageEvent);
		} else if(message instanceof MessageImage){
			MessageImage messageImage = (MessageImage) message;
			return processImage(messageImage);
		}
		return null;
	}
	
	public abstract ReplyMessage processText(MessageText messageText);

	public abstract ReplyMessage processEvent(MessageEvent messageEvent);
	
	public ReplyMessage processImage(MessageImage messageImage){
		
		return null;
	}

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
