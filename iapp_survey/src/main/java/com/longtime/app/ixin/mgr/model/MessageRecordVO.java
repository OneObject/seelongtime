package com.longtime.app.ixin.mgr.model;

import java.util.List;

import com.longtime.app.ixin.mgr.fodder.model.FodderEntity;

public class MessageRecordVO {
	
	private String id;
	
	private Long sendTime;

	private String sendUid;
	
	private int contentType;
	
	private String fids;
	
	private String content;
	
	private String domain;
	
	private String[] ids;
	
	private List<FodderEntity> list;
	
	

	

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}


	public List<FodderEntity> getList() {
		return list;
	}

	public void setList(List<FodderEntity> list) {
		this.list = list;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getSendTime() {
		return sendTime;
	}

	public void setSendTime(Long sendTime) {
		this.sendTime = sendTime;
	}

	public String getSendUid() {
		return sendUid;
	}

	public void setSendUid(String sendUid) {
		this.sendUid = sendUid;
	}

	public String getFids() {
		return fids;
	}

	public void setFids(String fids) {
		this.fids = fids;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public int getContentType() {
		return contentType;
	}

	public void setContentType(int contentType) {
		this.contentType = contentType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
