package com.longtime.app.remind.model;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * 刷新纪录，根据用户Id存放该用户最后刷新的时间
 * @author chenkf
 *
 */
public class RefreshRecode extends BaseEntity<String>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2325286496470559724L;

	private String uid;
	private long dateline;
	private String domain;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public long getDateline() {
		return dateline;
	}
	public void setDateline(long dateline) {
		this.dateline = dateline;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
}
