package com.longtime.app.ixin.utils;

import org.apache.commons.lang3.math.NumberUtils;

import java.io.StringReader;
import org.xml.sax.InputSource;
import java.io.InputStream;
import javax.xml.parsers.DocumentBuilderFactory;
import org.apache.commons.lang.StringUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import com.longtime.app.ixin.protocol.IMessage;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.Message;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageImage;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.protocol.ReplyMessageText;

public class XMLUtil implements IMessage {
	
	public Message parseMessage(InputStream in) throws Exception {
		Message message = null;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		Document document = factory.newDocumentBuilder().parse(in);
		Element root = document.getDocumentElement();
		//System.out.println(document);
		String type = (root.getElementsByTagName(TAG_MSGTYPE)).item(0).getTextContent();// filter CDATA... -- text/image/...
		if (type.equalsIgnoreCase(MESSAGE_TEXT)) {// put it first,because most of time is text
			message = parseMessageText(root);
		} else if (type.equalsIgnoreCase(MESSAGE_EVENT)) {// do subscribe event
			message = parseMessageEvent(root);
		} else if(type.equalsIgnoreCase(MESSAGE_IMAGE)){
			message = parseMessageImage(root);
		}
		
		if(null!=root.getElementsByTagName(TAG_MSGID) && null!=root.getElementsByTagName(TAG_MSGID).item(0)){
		    message.setMsgId(NumberUtils.toLong(root.getElementsByTagName(TAG_MSGID).item(0).getTextContent()));
		}
		in.close();
		return message;
	}
	
	public Message parseMessage(String data) throws Exception {
		Message message = null;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		StringReader sr = new StringReader(data);
		InputSource is = new InputSource(sr);
		Document document = factory.newDocumentBuilder().parse(is);
		Element root = document.getDocumentElement();
		//System.out.println(document);
		String type = (root.getElementsByTagName(TAG_MSGTYPE)).item(0).getTextContent();// filter CDATA... -- text/image/...
		if (type.equalsIgnoreCase(MESSAGE_TEXT)) {// put it first,because most of time is text
			message = parseMessageText(root);
		} else if (type.equalsIgnoreCase(MESSAGE_EVENT)) {// do subscribe event
			message = parseMessageEvent(root);
		} else if(type.equalsIgnoreCase(MESSAGE_IMAGE)){
			message = parseMessageImage(root);
		}
		message.setMsgId(NumberUtils.toLong(root.getElementsByTagName(TAG_MSGID).item(0).getTextContent()));
		return message;
	}
	
	
	private Message parseMessageImage(Element root) {
		MessageImage messageImage = new MessageImage();
		messageImage.setMsgType(root.getElementsByTagName(TAG_MSGTYPE).item(0).getTextContent());
		messageImage.setFromUserName((root.getElementsByTagName(TAG_FROMUSERNAME)).item(0).getTextContent());
		messageImage.setToUserName((root.getElementsByTagName(TAG_TOUSERNAME)).item(0).getTextContent());
		messageImage.setPicUrl(root.getElementsByTagName(TAG_PICURL).item(0).getTextContent());
		messageImage.setMediaId(root.getElementsByTagName(TAG_MEDIAID).item(0).getTextContent());
		return messageImage;
	}

	protected Message parseMessageText(Element root) {
		MessageText messageText = new MessageText();
		messageText.setMsgType(root.getElementsByTagName(TAG_MSGTYPE).item(0).getTextContent());
		messageText.setFromUserName((root.getElementsByTagName(TAG_FROMUSERNAME)).item(0).getTextContent());
		messageText.setToUserName((root.getElementsByTagName(TAG_TOUSERNAME)).item(0).getTextContent());
		messageText.setContent(StringUtils.trim(root.getElementsByTagName(TAG_CONTENT).item(0).getTextContent()));
		return messageText;
	}
	
	protected Message parseMessageEvent(Element root) {
		MessageEvent messageEvent = new MessageEvent();
		messageEvent.setMsgType(root.getElementsByTagName(TAG_MSGTYPE).item(0).getTextContent());
		messageEvent.setFromUserName((root.getElementsByTagName(TAG_FROMUSERNAME)).item(0).getTextContent());
		messageEvent.setToUserName((root.getElementsByTagName(TAG_TOUSERNAME)).item(0).getTextContent());
		messageEvent.setEvent(StringUtils.trim(root.getElementsByTagName(TAG_EVENT).item(0).getTextContent()));
		messageEvent.setEventKey(StringUtils.trim(root.getElementsByTagName(TAG_EVENTKEY).item(0).getTextContent()));
		return messageEvent;
	}
	
	public String buildReplyMessage(ReplyMessage message) {
		String doc = "";
		if(message.getMsgType().equals(REPLY_MESSAGE_TEXT)) {
			doc =  buildReplyMessageText(message);
		} else if(message.getMsgType().equals(REPLY_MESSAGE_NEWS)) {
			doc =  buildReplyMessageNews(message);
		}
		return doc;
	}
	
	protected String buildReplyMessageText(ReplyMessage message) {
		ReplyMessageText replyMessage = (ReplyMessageText) message;
		StringBuffer buffer = new StringBuffer();
		buffer.append(wrapperContent(TAG_TOUSERNAME, replyMessage.getToUserName(), true))
				.append(wrapperContent(TAG_FROMUSERNAME, replyMessage.getFromUserName(), true))
				.append(wrapperContent(TAG_CREATETIME, replyMessage.getCreateTime() + "", false))
				.append(wrapperContent(TAG_MSGTYPE, replyMessage.getMsgType(), true))
				.append(wrapperContent(TAG_CONTENT, replyMessage.getContent(), true));
		return wrapperXmlContent(buffer.toString());
	}
	
	protected String buildReplyMessageNews(ReplyMessage message) {
		ReplyMessageNews replyMessageNews = (ReplyMessageNews) message;
		StringBuffer buffer = new StringBuffer();
		StringBuffer items = new StringBuffer();
		StringBuffer item = new StringBuffer();
		ItemArticle itemArticle = null;
		for (int i = 0; i < replyMessageNews.getCount(); i++) {
			item = new StringBuffer();// important!easy to miss
			itemArticle = replyMessageNews.getArticleItems().get(i);
			item.append(wrapperContent(TAG_TITLE, itemArticle.getTitle(), true))
					.append(wrapperContent(TAG_DESCRIPTION, itemArticle.getDescription(), true))
					.append(wrapperContent(TAG_PICURL, itemArticle.getPicUrl(), true))
					.append(wrapperContent(TAG_URL, itemArticle.getUrl(), true));
			items.append(wrapperContent(TAG_ITEM, item.toString(), false));
		}
		String articles = wrapperContent(TAG_ARTICLES, items.toString(), false);
		buffer.append(wrapperContent(TAG_TOUSERNAME, replyMessageNews.getToUserName(), true))
				.append(wrapperContent(TAG_FROMUSERNAME, replyMessageNews.getFromUserName(), true))
				.append(wrapperContent(TAG_CREATETIME, replyMessageNews.getCreateTime() + "", false))
				.append(wrapperContent(TAG_MSGTYPE, replyMessageNews.getMsgType(), true))
				.append(wrapperContent(TAG_ARTICLECOUNT, replyMessageNews.getCount() + "", false)).append(articles);
		return wrapperXmlContent(buffer.toString());
	}
	
	// wrap the content by tag & content & whether CDATA used
	public String wrapperContent(String tag, String content, boolean isCdata) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<" + tag + ">");
		if (isCdata) {
			buffer.append("<![CDATA[");
		}
		buffer.append(content);
		if (isCdata) {
			buffer.append("]]>");
		}
		buffer.append("</" + tag + ">");
		return buffer.toString();
	}

	// wrap the root tag xml
	public String wrapperXmlContent(String content) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<" + TAG_XML + ">");
		buffer.append(content);
		buffer.append("</" + TAG_XML + ">");
		return buffer.toString();
	}
}
