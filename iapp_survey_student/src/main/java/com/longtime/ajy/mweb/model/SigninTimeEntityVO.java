package com.longtime.ajy.mweb.model;


public class SigninTimeEntityVO  {
	


	private String id;
		
	private long startTime;
	
	private long endTime;
	
	private long signinTime;
	
	private int isSignin;
	 
	private String sign_time_code;
	


	public String getSign_time_code() {
		return sign_time_code;
	}

	public void setSign_time_code(String sign_time_code) {
		this.sign_time_code = sign_time_code;
	}

	public long getSigninTime() {
		return signinTime;
	}

	public void setSigninTime(long signinTime) {
		this.signinTime = signinTime;
	}

	public int getIsSignin() {
		return isSignin;
	}

	public void setIsSignin(int isSignin) {
		this.isSignin = isSignin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	public long getStartTime() {
		return startTime;
	}

	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}

	public long getEndTime() {
		return endTime;
	}

	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}

	@Override
	public String toString() {
		return String.format("SigninTimeEntityVO [id=%s, startTime=%s, endTime=%s, isSignin=%s]",
			id,
			startTime,
			endTime,
			isSignin);
	}

	
	
	
}
