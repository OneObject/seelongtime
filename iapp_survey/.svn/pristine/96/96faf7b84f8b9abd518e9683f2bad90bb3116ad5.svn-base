package com.longtime.app.admin.template.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "base_domain_template")
public class DomainTemplate extends BaseModel<String>{

	private static final long serialVersionUID = 9198445202313941237L;

	@Id
	@GeneratedValue(generator = "hibernate-uuid")
    @GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
    @Column(length = 40)
	private String id; //主键
	
	private String tid;//模版ID
	
	private String sid;//风格ID
	
	private String domain; //域
	
	private String mid; //模块ID，冗余字段，方便查询
	
	private String isdel="0";//0可用 1已删除
	
	
	public static int TYPE_MODULE = 0;//模版
	
	public static int TYPE_STYLE = 1;//风格

	
	@Override
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
	
}
