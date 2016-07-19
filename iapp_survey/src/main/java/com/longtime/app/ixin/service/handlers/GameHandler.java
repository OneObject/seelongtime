package com.longtime.app.ixin.service.handlers;


import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageText;
import com.longtime.app.ixin.service.IMessageHandler;
import com.longtime.app.ixin.utils.DefaultMessageUtil;

@Service("gameHandler")
public class GameHandler extends AbstartMessageHandler implements IMessageHandler {

	public ReplyMessage processEvent(MessageEvent messageEvent) {
		ReplyMessageText reply = getStartMessage(messageEvent.getFromUserName());
		return reply;
	}
	
	public ReplyMessage processText(MessageText messageText) {
		String contextFlag = (String) this.getAttribute(messageText.getFromUserName());
		if(StringUtils.isBlank(contextFlag)){
			ReplyMessageText reply = getStartMessage(messageText.getFromUserName());
			return reply;
		}
		
		//也要考虑开启标记，考虑是第几次进入
		if("1".equals(messageText.getContent())){
			ReplyMessageText reply = new ReplyMessageText();
			reply.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
			reply.setContent("测试游戏。");
			return reply;
		} else if("0".equals(messageText.getContent())){
			this.removeAttribute(messageText.getFromUserName());
			ReplyMessageText reply = new ReplyMessageText();
			reply.setContent("已退出游戏。");
			reply.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
			return reply;
		}
		return DefaultMessageUtil.getDefaultMessage(messageText.getDomain());
	}

	private ReplyMessageText getStartMessage(String fromUserName) {
		this.setAttribute(fromUserName, "game");
		ReplyMessageText reply = new ReplyMessageText();
		reply.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
		reply.setContent("1 游戏信息  0 退出");
		return reply;
	}

}
