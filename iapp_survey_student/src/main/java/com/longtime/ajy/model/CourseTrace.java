/* Copyright © 2010 www.myctu.cn. All rights reserved. */
package com.longtime.ajy.model;

import java.math.BigDecimal;
import com.longtime.common.model.BaseEntity;

/**
 * 学习进度实体
 * 
 * @author songsp 2008-10-23 16:29:38
 */
public class CourseTrace extends BaseEntity<String>{

	private static final long serialVersionUID = 5586535530234801369L;
	
	public static final String ID = "_id";
	public static final String USERID = "user_id";
	public static final String COURSEID = "course_id";
	public static final String CHAPTERID = "chapter_id";
	public static final String PERCENT = "percent";
	public static final String CHAPTER_TRACES = "chapter_traces";

	private String id;// id

	/**
	 * 用户id
	 */
	private String user_id;

	/**
	 * 课程id
	 */
	private String course_id;

	private String percent;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return user_id;
	}

	public void setUserId(String userId) {
		this.user_id = userId;
	}

	public String getCourseId() {
		return course_id;
	}

	public void setCourseId(String courseId) {
		this.course_id = courseId;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}


	@Override
    public String toString() {
        return String.format("CourseTrace [id=%s, user_id=%s, course_id=%s, percent=%s, domain=%s, study_total_time=%s, total_time_sec=%s, start_date=%s, end_date=%s, test_score=%s, last_score=%s, max_score=%s, exit=%s, suspend_data=%s, lesson_status=%s, lesson_mode=%s]",
                             id, user_id, course_id, percent, domain, study_total_time, total_time_sec, start_date,
                             end_date, test_score, last_score, max_score, exit, suspend_data, lesson_status,
                             lesson_mode);
    }

	
	private String domain;
	/**
	 * 学习总时间 记录该用户每次学习该课程的累加时间，单位（分钟） 格式 hhhh：mm：ss，如0001：22：44表示1小时22分钟44秒。
	 */
	private String study_total_time = "0000:00:00";
	
	
	private Long  total_time_sec = 0L;  //学习时长，秒

	
	/**
	 * 开始学习时间 用户第一次开始该课程学习时间
	 */
	private Long start_date= System.currentTimeMillis();

	/**
	 * 结束学习时间 用户最近一次该课程学习的结束时间.
	 */
	private Long end_date;

	/**
	 * 课前测试成绩
	 * 
	 */
	private BigDecimal test_score = new BigDecimal(0);//

	/**
	 * 课程最近一次分数 初始化时设置为0。记录最近一次学习的课程分数。
	 */
	private BigDecimal last_score = new BigDecimal(0);;//

	/**
	 * 最高分数 课程学习过程中的最高分数，初始化时设置为0。
	 * 对应于SCORM1.2标准中的cmi.core.score.max.每次更新该记录时，用last_score和上一个max_score比较，取大者更新该字段
	 */
	private BigDecimal max_score = new BigDecimal(0);// 最高分数

	/**
	 * exit状态 取值： "time-out", "suspend", "logout", "" //空字符串
	 */
	private String exit = EXIT_STATUS_DEFAULT;

	public static final String EXIT_STATUS_TIMEOUT = "time-out";

	public static final String EXIT_STATUS_SUSPEND = "suspend";

	public static final String EXIT_STATUS_LOGOUT = "logout";

	public static final String EXIT_STATUS_DEFAULT = "";
	
	/**
	 * Suspend_data 用于记录再学习过程中的上下文数据。在本表格中记录的是最近一次学习的suspend_data
	 */
	private String suspend_data = "";

	/**
	 * 课程状态 对应于SCORM1.2标准中的cmi.core.lesson_status属性 取值： passed completed failed
	 * incomplete browsed not attempted
	 */
	private String lesson_status = LESSON_STATUS_NOT_ATTEMPTED;

	public static final String LESSON_STATUS_PASSED = "passed";

	public static final String LESSON_STATUS_COMPLETED = "completed";

	public static final String LESSON_STATUS_FAILED = "failed";

	public static final String LESSON_STATUS_INCOMPLETE = "incomplete";

	public static final String LESSON_STATUS_BROWSED = "browsed";

	public static final String LESSON_STATUS_NOT_ATTEMPTED = "not attempted";
	
	/**
	 * 上课模式 对应SCORM1.2中的cmi.core.lesson_mode,取值： "browse" "normal" "review"
	 * 改值在数据初始化时设置为”normal”
	 */
	private String lesson_mode = "normal";

	public static final String LESSON_MODE_BROWSE = "browse";

	public static final String LESSON_MODE_NORMAL = "normal";

	public static final String LESSON_MODE_REVIEW = "review";

	public String getStudy_total_time() {
		return study_total_time;
	}

	public void setStudy_total_time(String study_total_time) {
		this.study_total_time = study_total_time;
	}

	public Long getStart_date() {
		return start_date;
	}

	public void setStart_date(Long start_date) {
		this.start_date = start_date;
	}

	public Long getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Long end_date) {
		this.end_date = end_date;
	}

	public BigDecimal getTest_score() {
		return test_score;
	}

	public void setTest_score(BigDecimal test_score) {
		this.test_score = test_score;
	}

	public BigDecimal getLast_score() {
		return last_score;
	}

	public void setLast_score(BigDecimal last_score) {
		this.last_score = last_score;
	}

	public BigDecimal getMax_score() {
		return max_score;
	}

	public void setMax_score(BigDecimal max_score) {
		this.max_score = max_score;
	}

	public String getExit() {
		return exit;
	}

	public void setExit(String exit) {
		this.exit = exit;
	}

	public String getSuspend_data() {
		return suspend_data;
	}

	public void setSuspend_data(String suspend_data) {
		this.suspend_data = suspend_data;
	}

	public String getLesson_status() {
		return lesson_status;
	}

	public void setLesson_status(String lesson_status) {
		this.lesson_status = lesson_status;
	}

	public String getLesson_mode() {
		return lesson_mode;
	}

	public void setLesson_mode(String lesson_mode) {
		this.lesson_mode = lesson_mode;
	}

	
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	

	public Long getTotal_time_sec() {
		return total_time_sec;
	}

	public void setTotal_time_sec(Long total_time_sec) {
		this.total_time_sec = total_time_sec;
	}
	
	
}
