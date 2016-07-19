package com.longtime.ajy.common.track.model;

import com.longtime.common.model.Entity;

public class UserTrackEntity implements Entity<String>{

	private static final long serialVersionUID = 1L;

	private String id;
	
	private String uid;
	
	private String openId;
	
	private String domain;
	
	private String url;
	
	private long time;
	
	private String model;
	
	private String rid;
	
	private String agent;
	
	
	private String request_method;
	
	private String sessionid;
	
	private int device;
	
	private String ip;
	
	public static int CODE_MOBILE = 1;
	
	public static int CODE_PC = 0;
	
	public UserTrackEntity(){
		
	}
	



	public UserTrackEntity(UserTrackModel track) {
		this.agent = track.getAgent();
		this.device = track.getDevice()==null?CODE_MOBILE:track.getDevice();
		this.domain = track.getDomain();
		this.id = track.get_id();
		this.model = track.getModel();
		this.openId = track.getOpenId();
		this.request_method = track.getRequest_method();
		this.rid = track.getRid();
		this.sessionid = track.getSessionid();
		this.time = track.getTime();
		this.uid = track.getUid();
		this.url = track.getUrl();
		this.ip = track.getIp();
	}




	public int getDevice() {
		return device;
	}




	public void setDevice(int device) {
		this.device = device;
	}




	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}
	


	public String getRequest_method() {
		return request_method;
	}

	public void setRequest_method(String request_method) {
		this.request_method = request_method;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return String.format("UserTrackEntity [id=%s, uid=%s, openId=%s, domain=%s, url=%s, time=%s, model=%s, rid=%s, agent=%s,  request_method=%s, sessionid=%s, device=%s, ip=%s]",
			id,
			uid,
			openId,
			domain,
			url,
			time,
			model,
			rid,
			agent,
			request_method,
			sessionid,
			device,
			ip);
	}


	
	
	
	
	
}
