package com.longtime.ajy.mweb.model;

import com.longtime.common.model.BaseEntity;

public class SigninEntity extends BaseEntity<String>{
     
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String name;
	
	private String remark;
	
	private String signinCode;
	
	private int num = 0;//重复想到次数      0：不可以重复签到
	
	private int type ;
	
	private String domain;
	
	private long createTime;
	
	
	public static final int UNCOMPLETE = 0;
	
	public static final int COMPLETE = 1;

	
	
	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSigninCode() {
		return signinCode;
	}

	public void setSigninCode(String signinCode) {
		this.signinCode = signinCode;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return String.format("SigninEntity [id=%s, name=%s, remark=%s, signinCode=%s, num=%s, type=%s, domain=%s, createTime=%s]",
			id,
			name,
			remark,
			signinCode,
			num,
			type,
			domain,
			createTime);
	}
	
	
}
	