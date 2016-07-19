package com.longtime.ajy.mweb.model;

import com.longtime.common.dao.IdGenerator;
import com.longtime.common.model.BaseEntity;

public class ModuleEntity extends BaseEntity<String> {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 8353174499772738324L;
	

	public ModuleEntity(String id, String modulename, String urls) {
		this.id = IdGenerator.uuid32();
		this.modulename = modulename;
		this.urls = urls;
	}
	public ModuleEntity() {
	}
	
	private String id;			//模块标示
	private String modulename;	//模块名称
	private String urls;		//url资源
	
	@Override
	public String getId() {
		return id;
	}
	@Override
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
