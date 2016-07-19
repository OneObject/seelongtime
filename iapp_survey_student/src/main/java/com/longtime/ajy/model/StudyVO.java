package com.longtime.ajy.model;

public class StudyVO {
	private String lesson_status;
	private String showunit;
	private String show;
	private String finalStatus;
	private long sec;
	private String rid;
	private String uid;
	private long end_date;
	
	private String score;
	
	private Boolean exampass = true;//默认考试通过
	
	
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	
	public Boolean getExampass() {
		return exampass;
	}
	public void setExampass(Boolean exampass) {
		this.exampass = exampass;
	}
	public boolean isExamPass(){
		return getExampass();
	}
	
	public boolean isCouresPass(){
		return "已完成".equals(getFinalStatus());
	}
	
	//课程 和考试是否都通过了
	public boolean isAllPass(){
		return isExamPass()&& isCouresPass();
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getLesson_status() {
		return lesson_status;
	}
	public void setLesson_status(String lesson_status) {
		this.lesson_status = lesson_status;
	}
	public String getShowunit() {
		return showunit;
	}
	public void setShowunit(String showunit) {
		this.showunit = showunit;
	}
	public String getFinalStatus() {
		return finalStatus;
	}
	public void setFinalStatus(String finalStatus) {
		this.finalStatus = finalStatus;
	}
	public long getSec() {
		return sec;
	}
	public void setSec(long sec) {
		this.sec = sec;
	}
	public long getEnd_date() {
		return end_date;
	}
	public void setEnd_date(long end_date) {
		this.end_date = end_date;
	}
	
	
	
}
