package com.longtime.app.ixin.protocol;

/**
 * message image
 * 
 * @author hujiawei
 * 
 */
public class MessageImage extends Message {

	protected String picUrl;
	
	protected String mediaId;

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

    
    public String getMediaId() {
        return mediaId;
    }

    
    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }

    @Override
    public String toString() {
        return String.format("MessageImage [%s picUrl=%s, mediaId=%s]",super.toString(), picUrl, mediaId);
    }
    
	

}
