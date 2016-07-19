/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-2 - 下午5:05:17
 */
package com.longtime.ajy.model;

import org.jongo.marshall.jackson.oid.Id;



/**
 * @since 2013-9-2
 * @author yangwk
 * 
 */
public class PaperQuestionModel {

	
	@Id
	private String _id;
	
	private String paper_id;//试卷id
	
	private String question_id; //试题id
	
	private float score; //试题分数
	
	private int weight; //排序
	
	private int num; //考卷可能有多份，该字段为份数
	
	private String tid; //考试id，为了区分一个试卷用于多个考试时考试和试题的关联关系
    
    private String domain;
    
    
	

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public String getPaper_id() {
		return paper_id;
	}

	public void setPaper_id(String paper_id) {
		this.paper_id = paper_id;
	}

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }
}
