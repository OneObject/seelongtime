package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class UserCourse extends BaseEntity<String> {

	private static final long serialVersionUID = 6897484706183675725L;

	private String uid; //用户ID
    
    private String cid; //课程ID
    
    private String domain; //所属的域
    
    private Long expiretime; //过期时间，－1表示永久有效
   
    public static Long EXPIRE_TIME_PERMANENT = -1L;

	@Override
	public String getId() {
		return this.id;
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

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Long getExpiretime() {
		return expiretime;
	}

	public void setExpiretime(Long expiretime) {
		this.expiretime = expiretime;
	}

}
