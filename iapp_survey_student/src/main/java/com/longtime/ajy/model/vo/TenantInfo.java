package com.longtime.ajy.model.vo;

import java.io.Serializable;


public class TenantInfo implements Serializable{

	private static final long serialVersionUID = 8973008376103707952L;
	
	private String id;
    private String name;
    private String logo;
    private Boolean enable;
    private String logincover;//登录页背景图片
    private boolean isopen = false;//是否全站开放
    private boolean openregister = false;//开放注册
    private boolean shownavigation   = false;               //微信端是否显示头部导航
    private String setting; //配置信息 json字符串
    private String color; //系统色调
    
    private String login_prompt; //  登录绑定页提示信息：    

    private boolean issingle = false; //    是否允许一个帐号同时登录    
    
    
    private boolean isfoddershare = false;//素材是否可以分享
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Boolean getEnable() {
		return enable;
	}
	public void setEnable(Boolean enable) {
		this.enable = enable;
	}
	public String getLogincover() {
		return logincover;
	}
	public void setLogincover(String logincover) {
		this.logincover = logincover;
	}
	public boolean isIsopen() {
		return isopen;
	}
	public void setIsopen(boolean isopen) {
		this.isopen = isopen;
	}
	public boolean isOpenregister() {
		return openregister;
	}
	public void setOpenregister(boolean openregister) {
		this.openregister = openregister;
	}
	public String getSetting() {
		return setting;
	}
	public void setSetting(String setting) {
		this.setting = setting;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public boolean isShownavigation() {
		return shownavigation;
	}
	public void setShownavigation(boolean shownavigation) {
		this.shownavigation = shownavigation;
	}
	
	public boolean isIsfoddershare() {
		return isfoddershare;
	}
	public void setIsfoddershare(boolean isfoddershare) {
		this.isfoddershare = isfoddershare;
	}
	
	
    public String getLogin_prompt() {
        return login_prompt;
    }
    
    public void setLogin_prompt(String login_prompt) {
        this.login_prompt = login_prompt;
    }
    
    public boolean isIssingle() {
        return issingle;
    }
    
    public void setIssingle(boolean issingle) {
        this.issingle = issingle;
    }
    @Override
    public String toString() {
        return String.format("TenantInfo [id=%s, name=%s, logo=%s, enable=%s, logincover=%s, isopen=%s, openregister=%s, shownavigation=%s, setting=%s, color=%s, login_prompt=%s, issingle=%s, isfoddershare=%s]",
                             id, name, logo, enable, logincover, isopen, openregister, shownavigation, setting, color,
                             login_prompt, issingle, isfoddershare);
    }
}
