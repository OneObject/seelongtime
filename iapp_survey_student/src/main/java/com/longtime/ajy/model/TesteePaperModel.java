/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-4 - 下午2:03:46
 */
package com.longtime.ajy.model;

import org.jongo.marshall.jackson.oid.Id;




/**
 * @since 2013-9-4
 * @author yangwk
 * 
 */
public class TesteePaperModel {

	@Id
	private String _id ;
	
	private String uid; //用户id
	
	private String loginname;//用户名
	
	private String name;//用户姓名
	
	private String test_id; //考试id
	
	private String score; // 考试得分
	
	private long start_time; //参加考试时间
	
	private long end_time; //结束考试时间
	
	private int status; //是否通过考试
	
	private int num; //试卷num
	
	private String domain;
	
	private String dept;
	
	/**
	 * 阅卷中
	 */
	public static int STATUS_CHECK_PAPER = 2;
	
	/**
	 * 通过
	 */
	public static int STATUS_PASS = 1;
	
	/**
	 * 未通过
	 */
	public static int STATUS_UNPASS = 0;
	

	
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTest_id() {
		return test_id;
	}

	public void setTest_id(String test_id) {
		this.test_id = test_id;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public long getStart_time() {
		return start_time;
	}

	public void setStart_time(long start_time) {
		this.start_time = start_time;
	}
	
	

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public long getEnd_time() {
		return end_time;
	}

	public void setEnd_time(long end_time) {
		this.end_time = end_time;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

public String getDomain() {
    return domain;
}

public void setDomain(String domain) {
    this.domain = domain;
}
}
