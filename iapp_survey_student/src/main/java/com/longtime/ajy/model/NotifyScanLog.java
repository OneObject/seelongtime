package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class NotifyScanLog extends BaseEntity<String>{

	private static final long serialVersionUID = 3657162738697516703L;

	private String id;
	
	private String uid;//用户ID
	
	private String nid; //提醒记录ID
	
	/**{@link NotifyMode}*/
	private int mode = 0;//该消息发送类型{@link}
	
	private int device = CODE_MOBILE;//访问设备类型 0pc 1mobile
	
	private long readtime;//创建时间
	
	private String domain;
	
	
	public static int CODE_MOBILE = 1;
	
	public static int CODE_PC = 0;

	@Override
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public int getMode() {
		return mode;
	}

	public void setMode(int mode) {
		this.mode = mode;
	}

	public int getDevice() {
		return device;
	}

	public void setDevice(int device) {
		this.device = device;
	}

	public long getReadtime() {
		return readtime;
	}

	public void setReadtime(long readtime) {
		this.readtime = readtime;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Override
	public String toString() {
		return String
				.format("NotifyScanLog [id=%s, uid=%s, nid=%s, mode=%s, device=%s, readtime=%s, domain=%s]",
						id, uid, nid, mode, device, readtime, domain);
	}
	
	
}
