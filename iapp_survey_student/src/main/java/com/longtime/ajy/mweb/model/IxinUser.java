package com.longtime.ajy.mweb.model;

import com.longtime.ajy.model.User;

import com.longtime.common.dao.IdGenerator;
import com.longtime.common.model.Entity;


public class IxinUser implements Entity<String> {

    private static final long serialVersionUID = 2352476068901138026L;
    
    public IxinUser(){
        
    }
    
    public IxinUser(String openid,String uid,String domain,User user){
        this.id = IdGenerator.uuid32();
        this.openid = openid;
        this.base_id = uid;
        this.domain = domain;
        this.name = user.getName();
        this.mobile = user.getMobile();
    }

    private String id;
    
    private String domain;//
    
    private String base_id;//和用户id
    
    private String temp_uid;//该open ID关联的临时用户id
    
    private String openid; //对应爱加油服务号openid
    private String d_openid; //对应租户服务器openid
    
    private String name;
    private String mobile;
    private String company;//所在公司
    private long updatetime=System.currentTimeMillis(); //更新时间
    
    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    
    public String getDomain() {
        return domain;
    }

    
    public void setDomain(String domain) {
        this.domain = domain;
    }

    
    public String getBase_id() {
        return base_id;
    }

    
    public void setBase_id(String base_id) {
        this.base_id = base_id;
    }

    
    public String getTemp_uid() {
		return temp_uid;
	}

	public void setTemp_uid(String temp_uid) {
		this.temp_uid = temp_uid;
	}

	public String getOpenid() {
        return openid;
    }

    
    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getD_openid() {
        return d_openid;
    }
    
    public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setD_openid(String d_openid) {
        this.d_openid = d_openid;
    }

    
    public long getUpdatetime() {
        return updatetime;
    }

    
    public void setUpdatetime(long updatetime) {
        this.updatetime = updatetime;
    }

    
    public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name;
    }

    
    public String getMobile() {
        return mobile;
    }

    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }    

}
