package com.longtime.app.ixin.protocol;

/**
 * message text
 * 
 * @author hujiawei
 * 
 */
public class MessageText extends Message {

	protected String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return String.format("MessageText=[%s]  [content=%s]",super.toString(), content);
	}
	
	

}
