package com.longtime.app.ixin.utils;

import java.io.InputStream;

import com.longtime.app.ixin.protocol.Message;
import com.longtime.app.ixin.protocol.ReplyMessage;

public class MessageHandler {
	private static XMLUtil xmlUtil = new XMLUtil();
	
	public static Message parseMessageByInputStream(InputStream in) throws Exception {
		return xmlUtil.parseMessage(in);
	}
	
	public static Message parseMessage(String data) throws Exception {
		return xmlUtil.parseMessage(data);
	}
	
	public static String buildXmlByMessage(ReplyMessage message) {
		return xmlUtil.buildReplyMessage(message);
	}
}
