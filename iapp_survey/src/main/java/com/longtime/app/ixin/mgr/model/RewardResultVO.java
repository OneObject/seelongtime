package com.longtime.app.ixin.mgr.model;

public class RewardResultVO {
	private String userId;
	private String title;
	private String content;
	private String phone;
	private String sncode;
	private String name;
	private long applyDate;
	private String baseUid;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSncode() {
		return sncode;
	}

	public void setSncode(String sncode) {
		this.sncode = sncode;
	}

	public long getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(long applyDate) {
		this.applyDate = applyDate;
	}

	public String getBaseUid() {
		return baseUid;
	}

	public void setBaseUid(String baseUid) {
		this.baseUid = baseUid;
	}

}
