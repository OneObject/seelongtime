/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-8-26 - 下午1:48:48
 */
package com.longtime.ajy.model;

import java.io.Serializable;
import java.util.List;

import com.longtime.ajy.mweb.model.TestQuestionModel;

/**
 * @since 2013-8-26
 * @author yangwk
 * 
 */
public class TesteePaperVo implements Serializable{
	
	private static final long serialVersionUID = 1545332256701883707L;

	private String uid; //用户id
	
	private String test_id; //考试id
	
	private long start_time; //参加考试时间
	
	private long end_time; //结束考试时间
	
	List<TestQuestionModel> questions; //答题结果
	
	private int num; //试卷份数
	

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getTest_id() {
		return test_id;
	}

	public void setTest_id(String test_id) {
		this.test_id = test_id;
	}

	public long getStart_time() {
		return start_time;
	}

	public void setStart_time(long start_time) {
		this.start_time = start_time;
	}

	public long getEnd_time() {
		return end_time;
	}

	public void setEnd_time(long end_time) {
		this.end_time = end_time;
	}

	public List<TestQuestionModel> getQuestions() {
		return questions;
	}

	public void setQuestions(List<TestQuestionModel> questions) {
		this.questions = questions;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
}
