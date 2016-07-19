package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "base_notify_config")
public class NotifyConfig extends BaseModel<String>{

	private static final long serialVersionUID = -1935530403254178156L;

	@Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 36)
	private String id;
	
	private String type;
	
	@Column(name="open",columnDefinition ="boolean default false")
	private boolean open=false;
	
	@Column(name="remaindperiod",columnDefinition ="int default 7")
	private int remaindperiod = 7; //几天未访问网站进行签到提醒
	
	@Column(name="upperlimit",columnDefinition ="int default 0")
	private int upperlimit=0; //发送上限
	
	private String domain;

	@Override
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public int getRemaindperiod() {
		return remaindperiod;
	}

	public void setRemaindperiod(int remaindperiod) {
		this.remaindperiod = remaindperiod;
	}

	public int getUpperlimit() {
		return upperlimit;
	}

	public void setUpperlimit(int upperlimit) {
		this.upperlimit = upperlimit;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	
	
}
