package com.longtime.ajy.session;

import org.apache.commons.lang3.StringUtils;


public class LocalSession {
    
    private String sid;
    private String domain;
    private String openId;
    private String ext;
    private LoginSession   loginSession;
    
    public String getSid() {
        return sid;
    }
    
    public void setSid(String sid) {
        this.sid = sid;
    }
    
    public String getDomain() {
        return domain;
    }
    
    public void setDomain(String domain) {
        this.domain = domain;
    }
    
    public String getOpenId() {
        return openId;
    }
    
    public void setOpenId(String openId) {
        this.openId = openId;
    }
    
    public LoginSession getLoginSession() {
        return loginSession;
    }
    
    public void setLoginSession(LoginSession loginSession) {
        this.loginSession = loginSession;
    }
    
    public  String getUid(){
        return (null==loginSession)? StringUtils.EMPTY: StringUtils.trimToEmpty(loginSession.getUid());
    }
    
    public String getUname(){
        return (null==loginSession)? StringUtils.EMPTY: StringUtils.trimToEmpty(loginSession.getUname());
    }

    @Override
    public String toString() {
        return String.format("LocalSession [sid=%s, domain=%s, openId=%s, ext=%s, loginSession=%s]", sid, domain,
                             openId, ext, loginSession);
    }

    
    public String getExt() {
        return ext;
    }

    
    public void setExt(String ext) {
        this.ext = ext;
    }
    
    

}
