package com.longtime.ajy.mweb.model;

import com.longtime.common.dao.IdGenerator;
import com.longtime.common.model.BaseEntity;

public class ModuleConfig extends BaseEntity<String> {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 8095723693788488818L;
	
	public ModuleConfig() {
	}

	
	public ModuleConfig(String id, String domain, String moduleid, boolean isopen) {
		this.id = IdGenerator.uuid32();
		this.domain = domain;
		this.moduleid = moduleid;
		this.isopen = isopen;
	}


	private String id;			//标示ID
	private String domain;		//域名
	private String moduleid;	//模块id
	private boolean isopen;		//模块状态是否开放，false（0）为不开放，true（1）为开放
	
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
