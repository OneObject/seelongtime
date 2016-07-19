package com.longtime.app.ixin.mgr.model;

public class ActivityApplyRecord {

	private String id;
	private String userId; //openid
	private String activityId;
	private String userName;
	private long applyDate;
	private int isSignin;
	private long signinDate;
	private String baseuid;//系统uid
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(long applyDate) {
		this.applyDate = applyDate;
	}
	public int getIsSignin() {
		return isSignin;
	}
	public void setIsSignin(int isSignin) {
		this.isSignin = isSignin;
	}
	public long getSigninDate() {
		return signinDate;
	}
	public void setSigninDate(long signinDate) {
		this.signinDate = signinDate;
	}
	public String getBaseuid() {
		return baseuid;
	}
	public void setBaseuid(String baseuid) {
		this.baseuid = baseuid;
	}
	
	
}
