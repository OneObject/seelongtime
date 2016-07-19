package com.longtime.ajy.mweb.model;

public class Mobile{
	
	private String device;//设备[android.]
	
	private String version;//版本
	
	private String canUser;//是否可以使用
	
	private String downloadPath;//下载地址
	
	private String domain;//域

	private String versionInfo;
	
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

	public String getDownloadPath() {
		return downloadPath;
	}

	public void setDownloadPath(String downloadPath) {
		this.downloadPath = downloadPath;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getVersionInfo() {
		return versionInfo;
	}

	public void setVersionInfo(String versionInfo) {
		this.versionInfo = versionInfo;
	}

	
}
