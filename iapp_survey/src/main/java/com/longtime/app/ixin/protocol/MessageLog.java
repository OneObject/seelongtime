package com.longtime.app.ixin.protocol;

import com.longtime.app.util.IdGenerator;

public class MessageLog implements IMessage{
	
	private String _id;
	
	private long megid;
	
	private String msgtype;
	
	private String msg;
	
	private String msg_ext;
	
	private long createtime;
	
	private String tousername;
	
	private String fromusername;
	
	private String domain;

	
	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public long getMegid() {
		return megid;
	}

	public void setMegid(long megid) {
		this.megid = megid;
	}

	public String getMsgtype() {
		return msgtype;
	}

	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}


	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}
	


	public long getCreatetime() {
		return createtime;
	}

	public String getTousername() {
		return tousername;
	}

	public void setTousername(String tousername) {
		this.tousername = tousername;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	
	
	public String getFromusername() {
		return fromusername;
	}

	public void setFromusername(String fromusername) {
		this.fromusername = fromusername;
	}


	public String getMsg_ext() {
		return msg_ext;
	}

	public void setMsg_ext(String msg_ext) {
		this.msg_ext = msg_ext;
	}



	public static class Builder{
		
		public static MessageLog build(Message message) {
				
			if(null==message){
				return null;
			}
			  
			MessageLog entity = new MessageLog();
			
			//获取不同消息类型的内容
			if(message instanceof MessageEvent){
				
				MessageEvent realMsg = (MessageEvent) message;
				entity.setMsg(realMsg.getEvent());
				entity.setMsg_ext(realMsg.getEventKey());
				
			}else if(message instanceof MessageText){
				
				MessageText realMsg = (MessageText) message;
				entity.setMsg(realMsg.getContent());
				
			} else if(message instanceof MessageImage){
				
				MessageImage realMsg = (MessageImage) message;
				entity.setMsg(realMsg.getPicUrl());
				
			}
			
			entity.setMegid(message.getMsgId());
			entity.set_id(IdGenerator.nextId32().toString());
			entity.setCreatetime(System.currentTimeMillis());
			entity.setDomain(message.getDomain());
			entity.setFromusername(message.getFromUserName());
			entity.setTousername(message.getToUserName());
			entity.setMsgtype(message.getMsgType());
			
				
			
			return entity;
		}

	}
	
}
