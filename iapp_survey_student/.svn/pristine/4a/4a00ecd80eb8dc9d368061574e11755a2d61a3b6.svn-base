package com.longtime.ajy.mweb.model;


import com.longtime.common.model.BaseEntity;


public class Task extends BaseEntity<String> {
	 /**
	 * 
	 */
	private static final long serialVersionUID = -5032220019723074667L;

    private String id;
    
	private String title; // 作业标题

	private long begintime;// 开始时间

	private long endtime;// 结束时间

	private String taskrequire; // 作业要求

	private float score; // 作业通过 分数

	private int informtask=INFORMTASK_NO;// 是否可以提交作业 0否，1可以
	
	private String domain;
	
	private int isdel=ISDEL_NO;//是否删除  0否，1是
	
	private int isopen = OPEN_NO;//是否开放   0否，1是
	
	public static final int ISDEL_NO=0;
	
	public static final int ISDEL_YES=1;

	public static final int INFORMTASK_NO = 0;

	public static final int INFORMTASK_YES = 1;

	public static final int OPEN_NO = 0;
	
	public static final int OPEN_YES = 1;
	

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public long getBegintime() {
		return begintime;
	}

	public void setBegintime(long begintime) {
		this.begintime = begintime;
	}

	public long getEndtime() {
		return endtime;
	}

	public void setEndtime(long endtime) {
		this.endtime = endtime;
	}

	public String getTaskrequire() {
		return taskrequire;
	}

	public void setTaskrequire(String taskrequire) {
		this.taskrequire = taskrequire;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public int getInformtask() {
		return informtask;
	}

	public void setInformtask(int informtask) {
		this.informtask = informtask;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return this.id;
	}

	public int getIsopen() {
		return isopen;
	}

	public void setIsopen(int isopen) {
		this.isopen = isopen;
	}

}
