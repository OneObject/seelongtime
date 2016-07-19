package com.longtime.ajy.common.track.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.longtime.ajy.model.MapSerializable;

public class UserTrackModel implements MapSerializable{
	
	private static final long serialVersionUID = 7878701363564172034L;
	
	private String _id;

	private String uid;
	
	private String openId;
	
	private String domain;
	
	private String url;
	
	private long time;
	
	private String model;
	
	private String rid;
	
	private String agent;
	
	private String ip;
	
	private String request_method;
	
	private String sessionid;
	
	private Integer device;
	
	public UserTrackModel(){
		
	}
	
	public UserTrackModel(String uid, String openId, String domain, String url,long time,String agent,String ip, String request_method, String sessionid) {
		this.uid = uid;
		this.openId = openId;
		this.domain = domain;
		this.url = url;
		this.time = time;
		this.agent = agent;
		this.ip = ip;
		this.request_method = request_method;
		this.sessionid = sessionid;
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
	

	public String getIp() {
		return ip;
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

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public Map<String, Object> toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("_id", _id);
		map.put("uid", uid);
		if(StringUtils.isNotBlank(openId)){
			map.put("openId", openId);
		}
		map.put("domain", domain);
		map.put("url", url);
		map.put("time", time);
		map.put("model", model);
		map.put("rid", rid);
		map.put("agent", agent);
		map.put("ip", ip);
		map.put("request_method", request_method);
		map.put("sessionid", sessionid);
		map.put("device", device);
		return map;
	}

	
	@Override
	public String toString() {
		return String
				.format("UserTrackModel [_id=%s, uid=%s, openId=%s, domain=%s, url=%s, time=%s, model=%s, rid=%s, agent=%s, ip=%s, request_method=%s, sessionid=%s]",
						_id, uid, openId, domain, url, time, model, rid, agent,
						ip, request_method, sessionid);
	}

	@Override
	public void fromMap(Map<String, Object> in) {
		
	}
	

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
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

    
    public String getAgent() {
        return agent;
    }

    
    public void setAgent(String agent) {
        this.agent = agent;
    }

	public Integer getDevice() {
		return device;
	}

	public void setDevice(Integer device) {
		this.device = device;
	}
    
    

    
	
}
