package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "iapp_base_module_config")
public class ModuleConfig extends BaseModel<String> {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 2560588328791656307L;
	
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	@Column(length = 40)
	private String id;			//标示ID
	private String domain;		//域名
	private String moduleid;	//模块id
	private boolean isopen;		//模块状态是否开放，false（0）为不开放，true（1）为开放
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
	public String getModuleid() {
		return moduleid;
	}
	public void setModuleid(String moduleid) {
		this.moduleid = moduleid;
	}
	public boolean isIsopen() {
		return isopen;
	}
	public void setIsopen(boolean isopen) {
		this.isopen = isopen;
	}
	
}
