package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class Funtag extends BaseEntity<Long>{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2976254933864958481L;
	private long id;
	private String uid;
	private String tagid;
	private long timestamp;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTagid() {
		return tagid;
	}
	public void setTagid(String tagid) {
		this.tagid = tagid;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
	
}
