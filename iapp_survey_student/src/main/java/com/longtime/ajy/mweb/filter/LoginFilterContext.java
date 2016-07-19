package com.longtime.ajy.mweb.filter;

import com.longtime.ajy.model.vo.TenantInfo;

public class LoginFilterContext{
	
	boolean isUrlOpen = false;
	String domain ;
	TenantInfo tenantInfo;
	String uid;
	public boolean isUrlOpen() {
		return isUrlOpen;
	}
	public String getDomain() {
		return domain;
	}
    public TenantInfo getTenantInfo() {
        return tenantInfo;
    }
    public String getUid() {
		return uid;
	}
	
	

}
