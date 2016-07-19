package com.longtime.app.ixin.mgr.survey.model;

import java.util.Map;

public class SurveyResultDetail {

	private String id; //主键
	
	private String survey_id; //调研ID
	
	private String question_id; //问题ID
	
	private String answer; //答案
	
	private Map<String,String> exts; //扩展答案，如记录选择题中用户输入的答案，键是选项ID
	
	private Map<String, String> answers; //答案，一题有多个答案情况，如排序题，矩阵题，详细说明见：答案说明（下边的tip）
	
	private String sid; //参与调研对象ID
	
	private int type; //对象ID类型 0 用户ID 1openid
	
	private String domain; //域
	
	private Long create_time; //创建时间
	
	private int isdel; //是否删除 0未删除 1已删除
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSurvey_id() {
		return survey_id;
	}

	public void setSurvey_id(String survey_id) {
		this.survey_id = survey_id;
	}

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Map<String, String> getExts() {
		return exts;
	}

	public void setExts(Map<String, String> exts) {
		this.exts = exts;
	}

	public Map<String, String> getAnswers() {
		return answers;
	}

	public void setAnswers(Map<String, String> answers) {
		this.answers = answers;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Long getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Long create_time) {
		this.create_time = create_time;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	@Override
	public String toString() {
		return String
				.format("SurveyResultDetail [id=%s, survey_id=%s, question_id=%s, answer=%s, exts=%s, answers=%s, sid=%s, type=%s, domain=%s, create_time=%s, isdel=%s]",
						id, survey_id, question_id, answer, exts, answers, sid,
						type, domain, create_time, isdel);
	}
	
}
