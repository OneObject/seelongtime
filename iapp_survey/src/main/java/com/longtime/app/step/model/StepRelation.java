package com.longtime.app.step.model;

public class StepRelation {
	private String id;
	private int step; //资源创建步骤状态
	private String sid; //关联资源ID
	private String domain;//域
	private int type = TYPE_UNKNOWN;//类别
	
	public static int TYPE_EXAM = 1; //考试
	public static int TYPE_COURESE = 2;//课程
	public static int TYPE_ACTIVITY = 3;//活动
	public static int TYPE_EXT_RESOURCE = 4;//扩展资源
	
	public static int TYPE_UNKNOWN = 0;//未定义
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
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
}
