package com.zw.bean;

/**
 * 功能：视频包装类，用来对视频数据进行封装 
 * 版本：1.0 
 * 日期：2010-12-21 
 * 作者：chu
 */
public class Video {

	private String id;	//视频id
	private String videoName;	//视频名
	private long playTime;	//播放时长
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getVideoName() {
		return videoName;
	}
	
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	
	public long getPlayTime() {
		return playTime;
	}
	
	public void setPlayTime(long playTime) {
		this.playTime = playTime;
	}

}
