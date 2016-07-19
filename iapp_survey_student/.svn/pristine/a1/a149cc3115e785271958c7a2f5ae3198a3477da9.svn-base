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
public class TesteeModel implements Comparable<TesteeModel>{
	
	@Id
	private String _id;
	
	private String uid; //用户id
	
	private String loginname;//用户名
	
	private String name;//用户姓名
	
	private String test_id; //考试id
	
	private String score; // 考试得分
	
	private int status; //考试状态
	
	private int test_times;//参加考试的次数
	
	private int total_times;//此考试总共可以参加的次数
	
	private String domain;
	
	private String dept;
	
	private boolean hasRead = false;//是否查看了答案
	
	
	private EntityMetaInfo entityMetaInfo = new EntityMetaInfo();
	
	
    public EntityMetaInfo getEntityMetaInfo() {
        return entityMetaInfo;
    }

    
    public void setEntityMetaInfo(EntityMetaInfo entityMetaInfo) {
        this.entityMetaInfo = entityMetaInfo;
    }

    public boolean getHasRead() {
		return hasRead;
	}

	public void setHasRead(boolean hasRead) {
		this.hasRead = hasRead;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
	



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

	public void setScore(String score) {
		this.score = score;
	}

	public String getScore() {
		return score;

	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTest_times() {
		return test_times;
	}

	public void setTest_times(int test_times) {
		this.test_times = test_times;
	}

    public int getTotal_times() {
        return total_times;
    }

    public void setTotal_times(int total_times) {
        this.total_times = total_times;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

	@Override
	public int compareTo(TesteeModel o) {
		
		double doub = Double.valueOf(o.getScore())-Double.valueOf(this.getScore());
		if (doub>0) {
			return 1;
		}else if (doub<0) {
			return -1;
		}else {
			return 0;
		}
	}

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}



    
}
