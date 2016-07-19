package com.longtime.app.ixin.protocol;

/**
 * all message parent is Message!
 * 
 * @author hujiawei
 * 
 */
public class Message implements IMessage {

	private String msgType;
	private String fromUserName;
	private String toUserName;
	// attention! class MessageHandlerHelper its method parseMessage
	// I do not parse msgId and createtime,because it seems to be meaningless
	private long msgId;// 64bits for message result and event message, this field is useless
	private long createTime;// 32bits the time is Unix timestamp
	private String domain;
	
	private int wxType = 0; // 微信类型  0：公众号    1：企业号

	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}

	public String getFromUserName() {
		return fromUserName;
	}

	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public long getMsgId() {
		return msgId;
	}

	public void setMsgId(long msgId) {
		this.msgId = msgId;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	

	public void setWxQYType() {
		this.wxType = 10;
	}

	public boolean isWxQY(){
		return 10==this.wxType;
	}
	
	@Override
	public String toString() {
		return String.format("Message [msgType=%s, fromUserName=%s, toUserName=%s, msgId=%s, createTime=%s, domain=%s, wxType=%s]",
			msgType,
			fromUserName,
			toUserName,
			msgId,
			createTime,
			domain,
			wxType);
	}

}
