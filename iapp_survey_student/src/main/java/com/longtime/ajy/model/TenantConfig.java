package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class TenantConfig extends BaseEntity<String> {

	private static final long serialVersionUID = -2541548116615328073L;

	private String id; // 商户标示

	private boolean isopen = false; // 是否全站开放

	private boolean openregister = false; // 开放注册

	private boolean shownavigation = false; //微信端是否显示头部导航

	private String setting; // 配置信息 json字符串

	private String color; //系统色调

	private String login_prompt; //  登录绑定页提示信息：    

	private boolean issingle = false; // 	是否允许一个帐号同时登录	

	private boolean isfoddershare = false; //素材是否可以分享

	@Override
	public String getId() {
		return id;
	}

	public boolean isIsopen() {
		return isopen;
	}

	public void setIsopen(boolean isopen) {
		this.isopen = isopen;
	}

	public void setId(String id) {
		this.id = id;
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

	public boolean isIsfoddershare() {
		return isfoddershare;
	}

	public void setIsfoddershare(boolean isfoddershare) {
		this.isfoddershare = isfoddershare;
	}

	@Override
	public String toString() {
		return String.format("TenantConfig [id=%s, isopen=%s, openregister=%s, shownavigation=%s, setting=%s, color=%s, login_prompt=%s, issingle=%s, isfoddershare=%s]",
			id,
			isopen,
			openregister,
			shownavigation,
			setting,
			color,
			login_prompt,
			issingle,
			isfoddershare);
	}
}
