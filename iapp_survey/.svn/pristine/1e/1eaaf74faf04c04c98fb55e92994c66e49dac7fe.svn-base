package com.longtime.app.util;

public class VideoClipRule {
	public static VideoClipRule videoClipRule = new VideoClipRule();
	
	private VideoClipRule(){}
	
	public static VideoClipRule getInstence(){
		return videoClipRule;
	}
	
	public long getBeginTime(long timepoint){
		if(timepoint == 0 || timepoint-15<=0){
			return 0L;
		}
		return timepoint-15;
	}
	
	/**
	 * 
	 * @param timepoint 截屏时间点
	 * @param videoduration 视频时长
	 * @return
	 */
	public long getEndTime(long timepoint,long videoduration){
		if(timepoint+15>=videoduration){
			return videoduration;
		}
		return timepoint+15;
	}
	
}
