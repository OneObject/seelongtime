package com.longtime.ajy.mweb.model;

import com.longtime.common.model.BaseEntity;

public class SigninUserEntity extends BaseEntity<String> {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String sid;
	
	private String tid;
	
	private String uid;
	
	private String openId;
	
	private long signinDate;
	
	private String uname;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
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


	public long getSigninDate() {
		return signinDate;
	}

	public void setSigninDate(long signinDate) {
		this.signinDate = signinDate;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return String.format("SigninUserEntity [id=%s, sid=%s, tid=%s, uid=%s, openId=%s,  signinDate=%s, uname=%s]",
			id,
			sid,
			tid,
			uid,
			openId,
			signinDate,
			uname);
	}
	
}
