package com.longtime.app.ixin.mgr.survey.model;

import java.util.Map;

public class SurveyResult {
	
	private String id; //主键
	
	private String survey_id; //调研ID
	
	private String question_id; //问题ID
	
	private int answer_num ; //回答本题的人数
	
	private Map<String, Integer> option_num_map; //键是optionid，或者打分题的分数（如果是矩阵题，则键是Y轴，X轴选项ID的拼接），值是选中该选项的次数
	
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

	public int getAnswer_num() {
		return answer_num;
	}

	public void setAnswer_num(int answer_num) {
		this.answer_num = answer_num;
	}

	public Map<String, Integer> getOption_num_map() {
		return option_num_map;
	}

	public void setOption_num_map(Map<String, Integer> option_num_map) {
		this.option_num_map = option_num_map;
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
				.format("SurveyResult [id=%s, survey_id=%s, question_id=%s, answer_num=%s, option_num_map=%s, domain=%s, create_time=%s, isdel=%s]",
						id, survey_id, question_id, answer_num, option_num_map,
						domain, create_time, isdel);
	}
	
}
