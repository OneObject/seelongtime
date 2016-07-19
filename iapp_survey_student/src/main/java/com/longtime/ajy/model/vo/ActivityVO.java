package com.longtime.ajy.model.vo;

import java.util.List;

import com.longtime.ajy.model.Feed.ACTION;

public class ActivityVO {
	private String dayTime;//如3月20日
	private String weekTime;//如：周一
	
	private List<TimeActivityVO> list;
	
	public static String[] week = {"周一","周二","周三","周四","周五","周六","周日"};
	

	public String getDayTime() {
		return dayTime;
	}

	public void setDayTime(String dayTime) {
		this.dayTime = dayTime;
	}

	public String getWeekTime() {
		return weekTime;
	}

	public void setWeekTime(String weekTime) {
		this.weekTime = weekTime;
	}

	public List<TimeActivityVO> getList() {
		return list;
	}

	public void setList(List<TimeActivityVO> list) {
		this.list = list;
	}
	
}
