package com.longtime.app.base.model;

import javax.persistence.Entity;

import com.longtime.common.model.BaseModel;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "iapp_base_tenant")
public class Tenant extends BaseModel<String> {

	private static final long serialVersionUID = -2541548116615328073L;

	@Id
	@Column(length = 36)
	private String id; // 商户标示

	private String name; // 名称
	
	private String logo;//logo

	@Column(name="admin_account")
	private String adminAccount;// 管理员账号

	@Column(name="admin_pwd")
	private String adminPwd;// 管理员账号密码 （明文）

	private boolean enable;// 是否可用

	private String creater;

	@Column(name = "create_time")
	private Long createTime;

	private String updater;

	@Column(name = "update_time")
	private Long updateTime;
	
	@Column(name = "isdel",columnDefinition ="int default 0")
	private int isDel;
	
	private String logincover;//登录页背景图片
	
	public static String DOMAIN_SERVICE_OPERATOR = "-1";
    
	
	 /**
     * 未删除
     */
    public static int ISDEL_NO = 0;
    
    /**
     * 已删除
     */
    public static int ISDEL_YES = 1;
	
	@Override
	public String getId() {
		return id;
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

	public String getAdminAccount() {
		return adminAccount;
	}

	public void setAdminAccount(String adminAccount) {
		this.adminAccount = adminAccount;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Long updateTime) {
		this.updateTime = updateTime;
	}

	public String getLogincover() {
		return logincover;
	}

	public void setLogincover(String logincover) {
		this.logincover = logincover;
	}
	
	

}
