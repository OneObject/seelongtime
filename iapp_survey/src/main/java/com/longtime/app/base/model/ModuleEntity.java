package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;
@Entity
@Table(name = "iapp_base_module")
public class ModuleEntity extends BaseModel<String> {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 217121032760613000L;
	
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	@Column(length = 40)
	private String id;			//模块标示
	private String modulename;	//模块名称
	private String urls;		//url资源
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getModulename() {
		return modulename;
	}
	public void setModulename(String modulename) {
		this.modulename = modulename;
	}
	public String getUrls() {
		return urls;
	}
	public void setUrls(String urls) {
		this.urls = urls;
	}
	

}
