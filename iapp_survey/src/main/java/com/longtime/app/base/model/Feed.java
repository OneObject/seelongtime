package com.longtime.app.base.model;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name="base_feed")
public class Feed extends BaseModel<Long> {

	private static final long serialVersionUID = 5859920246851319957L;

	@Id
	@GenericGenerator(name = "idGenerator", strategy = "identity")
	@GeneratedValue(generator = "idGenerator")
	private Long   id;
	
    private String appid; //应用ID
    
    private String restype; //资源类型 如课程，评论等
    
    private String resid; //资源ID 如课程ID
    
    private String resname; //资源名称 如课程名称
    
    private String action; //动作类型 如评论，赞等动作
    
    private String uid; //产生动态的用户ID
    
    private String uname; //产生动态的用户姓名
    
    private String title; //用于展示时存放动态标题

    @Column(columnDefinition="text")
    private String body; //动态内容 如评论内容（截取）
    
    private String domain; // 域
    
    private String ext; //扩展字段
    
    private String creator; //创建的人的ID
	
	private Long createtime;

	private String updater; //更新的人的ID
 
	private Long updatetime; //更新的时间

	@Override
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	

	public String getRestype() {
		return restype;
	}

	public void setRestype(String restype) {
		this.restype = restype;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public String getResname() {
		return resname;
	}

	public void setResname(String resname) {
		this.resname = resname;
	}


	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public Long getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
	}
}
