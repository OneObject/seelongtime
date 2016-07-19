/**
 * project : iapp
 * user created : lxl
 * date created : 20131025
 */
package com.longtime.app.base.model;


public class UserCreditVO {

	private String id;
    
    /**
     * 用户名
     */
    private String username;
   
    private String status; 

    /** 商户 */
    private String domain;
    
    /**
     * 真实姓名
     */
    private String name;
    
    /**
     * 昵称 （唯一）
     */
    private String nickName;
    
    private String avatar; //头像
    
    private String oid;
    
    /**
     * 邮箱
     */
    private String email;

    /**
     * 是否可用
     */
    private int enable ; 
    
    /**
     * 用户类别
     */
    private int type ;
    
    /**
     * 手机
     */
    private String mobile;
    
    private long credit;//
    
    private long experience;
    
    /**
     * 删除标记
     */
    private int isDel;
    

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public long getCredit() {
		return credit;
	}

	public void setCredit(long credit) {
		this.credit = credit;
	}

	public long getExperience() {
		return experience;
	}

	public void setExperience(long experience) {
		this.experience = experience;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

}