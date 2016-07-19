package com.longtime.ajy.model;



public class NoticeVisitTimelineEntity {
	
	private String id;

	private String uid;

	private String model;
	
	private long timestamp;
	
	
	private String resourcetype;  //如果model没有办法标示,使用该字段值去区分
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public String getResourcetype() {
		return resourcetype;
	}

	public void setResourcetype(String resourcetype) {
		this.resourcetype = resourcetype;
	}

	

	
	
}
