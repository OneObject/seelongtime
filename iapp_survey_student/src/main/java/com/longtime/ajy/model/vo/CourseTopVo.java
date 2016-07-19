package com.longtime.ajy.model.vo;

import com.longtime.ajy.model.Course;
import com.longtime.common.utils.DateUtils;

public class CourseTopVo extends Course {
	
	private int top;//这门课程的点赞数量
	private String time;
	
	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public String getTime() {
		return time;
	}

	public void setTime(Long l) {
		if (l>=0) {
			this.time = DateUtils.longToString(l);
		}
	}
	

}
