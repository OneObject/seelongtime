package com.longtime.app.mobile.model;

import java.io.Serializable;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * 移动端版本控制实体
 * @author chenkf
 *
 */
public class Mobile extends BaseEntity<String> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 584934846216184479L;
	
	
	private String device;//设备[android.]
	
	private String version;//版本
	
	private String canUser;//是否可以使用
	
	private String downloadPath;//下载地址
	
	private String domain;//域

	private String versionInfo;//版本信息
	
	
	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getCanUser() {
		return canUser;
	}

	public void setCanUser(String canUser) {
		this.canUser = canUser;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getDownloadPath() {
		return downloadPath;
	}

	public void setDownloadPath(String downloadPath) {
		this.downloadPath = downloadPath;
	}

	@Override
	public String toString() {
		return String
				.format("Mobile [device=%s, version=%s, canUser=%s, downloadPath=%s, domain=%s, id=%s, entityMetaInfo=%s]",
						device, version, canUser, downloadPath, domain, id,
						entityMetaInfo);
	}

	public String getVersionInfo() {
		return versionInfo;
	}

	public void setVersionInfo(String versionInfo) {
		this.versionInfo = versionInfo;
	}

	
}
