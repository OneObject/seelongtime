package com.longtime.ajy.model.vo;

import java.util.HashMap;
import java.util.Map;

import com.longtime.ajy.model.Examination;
import com.longtime.common.utils.DateUtils;



public class ExaminationVO extends Examination {

	private static final long serialVersionUID = 5703648178551415468L;

	private String score; // 考试得分
	
	private Integer testStatus; //考试状态
	
	private Double totalScore; //考试总分
	
	private Long attendTime;//参加考试时间
	
	private String month; //月份
	
	private String day; //日期
	
	private String time;//时分时间
	
	private Integer test_times;//已考试次数
	
	private Integer total_times;//总考试次数

	public static Map<String, String> monthMap = new HashMap<String, String>();
	static {
		monthMap.put("01", "一");
		monthMap.put("02", "二");
		monthMap.put("03", "三");
		monthMap.put("04", "四");
		monthMap.put("05", "五");
		monthMap.put("06", "六");
		monthMap.put("07", "七");
		monthMap.put("08", "八");
		monthMap.put("09", "九");
		monthMap.put("10", "十");
		monthMap.put("11", "十一");
		monthMap.put("12", "十二");
		
	}
	
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}

	public Integer getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(Integer testStatus) {
		this.testStatus = testStatus;
	}

	public Double getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Double totalScore) {
		this.totalScore = totalScore;
	}

	public Long getAttendTime() {
		return attendTime;
	}

	public void setAttendTime(Long attendTime) {
		this.attendTime = attendTime;
	}

	public String getMonth() {
		this.month = DateUtils.getMonth(super.getStartTime());
		return month;
	}

	public String getDay() {
		this.day = DateUtils.getDay(super.getStartTime());
		return day;
	}

	public String getTime() {
		this.time = DateUtils.getTime(super.getStartTime());
		return time;
	}

	

	public Integer getTest_times() {
		return test_times;
	}

	public void setTest_times(Integer test_times) {
		this.test_times = test_times;
	}

	public Integer getTotal_times() {
		return total_times;
	}

	public void setTotal_times(Integer total_times) {
		this.total_times = total_times;
	}

	@Override
	public String toString() {
		return String.format("ExaminationVO [score=%s, testStatus=%s, totalScore=%s, attendTime=%s, month=%s, day=%s, time=%s, test_times=%s, total_times=%s]",
			score,
			testStatus,
			totalScore,
			attendTime,
			month,
			day,
			time,
			test_times,
			total_times);
	}
	
	// 1：进行中 2未开始   3:结束
	public int getSortStatus(){
		
		long now = System.currentTimeMillis();
		
		if(this.getStartTime()>now){
			return 2;
		}else if(this.getEndTime()<now){
			return 3;
		}else{
			return 1;
		}
		
	}
	
	
}
