package com.longtime.app.base.controller.vo;

public class UserExcelVo {
    
    private String id;
    private int index;
    private String oid;
    private String jobLevelId;
    private String name;
    private String pass;
    private String email;
    private String mobile;
    private String department;
    private String username;
    private String joblevel;
    private Long  offertime;
    private Long boardtime;
    private int attentionstatus;
    private int gender;
    private String nickName;
    private Long effictivestart; //账号有效期开始时间 0和空表示不限制
    private Long effictiveend; //账号有效期结束时间 0和空表示不限制
    private Long birthday;
    private String labels;//标签
    
    public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Long getEffictivestart() {
		return effictivestart;
	}
	public void setEffictivestart(Long effictivestart) {
		this.effictivestart = effictivestart;
	}
	public Long getEffictiveend() {
		return effictiveend;
	}
	public void setEffictiveend(Long effictiveend) {
		this.effictiveend = effictiveend;
	}
    
    public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getJoblevel() {
		return joblevel;
	}
	public void setJoblevel(String joblevel) {
		this.joblevel = joblevel;
	}
	public Long getOffertime() {
		return offertime;
	}
	public void setOffertime(Long offertime) {
		this.offertime = offertime;
	}
	public Long getBoardtime() {
		return boardtime;
	}
	public void setBoardtime(Long boardtime) {
		this.boardtime = boardtime;
	}
	public int getAttentionstatus() {
		return attentionstatus;
	}
	public void setAttentionstatus(int attentionstatus) {
		this.attentionstatus = attentionstatus;
	}
	public Long getBirthday() {
		return birthday;
	}
	public void setBirthday(Long birthday) {
		this.birthday = birthday;
	}
    
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public int getIndex() {
        return index;
    }
    
    public void setIndex(int index) {
        this.index = index;
    }
    
    public String getOid() {
        return oid;
    }
    
    public void setOid(String oid) {
        this.oid = oid;
    }
    
    public String getJobLevelId() {
        return jobLevelId;
    }
    
    public void setJobLevelId(String jobLevelId) {
        this.jobLevelId = jobLevelId;
    }
	public String getLabels() {
		return labels;
	}
	public void setLabels(String labels) {
		this.labels = labels;
	}
	
}
