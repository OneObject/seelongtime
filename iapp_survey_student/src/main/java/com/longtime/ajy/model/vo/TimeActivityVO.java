package com.longtime.ajy.model.vo;

public class TimeActivityVO {
	
	private String activityId;//关联活动ID
	
	private String rid;//资源ID

	private String title;//标题
	
	private String descript; //描述
	
	private String prepareTitle;//预热标题for抽奖
	
	private String prepareDescript;//预热描述for抽奖
	
	private int type;//类型－枚举Restype内
	
	private long startTime;//开始时间
	
	private long endTime;//结束时间
	
	private int allDay=0;//活动时间是否全天有效
	
	//如果不是当天开始，是当天结束，则开始时间显示结束时间，结束时间显示“结束”
	//如果是今天开始，不是今天结束，则结束时间显示“开始”
	private String startTimeInDay;//开始时间（一天内的某个时间点如：11:30）
	private String endTimeInDay;//结束时间（一天内的某个时间点如：12:30）
	
	private int itemNum;//关联的每类资源的数量
	
	private int status;//活动状态
	
	private String icon;//图标
	
	public static int STATUS_UNSTART = 0;//未开始
	public static int STATUS_UNDERWAY = 1;//进行中
	public static int STATUS_END = 2;//已结束
	
	public static String END = "结束";
	public static String START = "开始";
	

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getPrepareTitle() {
		return prepareTitle;
	}

	public void setPrepareTitle(String prepareTitle) {
		this.prepareTitle = prepareTitle;
	}

	public String getPrepareDescript() {
		return prepareDescript;
	}

	public void setPrepareDescript(String prepareDescript) {
		this.prepareDescript = prepareDescript;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public int getAllDay() {
		return allDay;
	}

	public void setAllDay(int allDay) {
		this.allDay = allDay;
	}

	public String getStartTimeInDay() {
		return startTimeInDay;
	}

	public void setStartTimeInDay(String startTimeInDay) {
		this.startTimeInDay = startTimeInDay;
	}

	public String getEndTimeInDay() {
		return endTimeInDay;
	}

	public void setEndTimeInDay(String endTimeInDay) {
		this.endTimeInDay = endTimeInDay;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
}
