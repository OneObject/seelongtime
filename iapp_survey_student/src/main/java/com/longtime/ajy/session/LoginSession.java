package com.longtime.ajy.session;

public class LoginSession {

    private String sid;
    private String uid;
    private String uname;
    private String domain;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    @Override
    public String toString() {
        return String.format("LoginSession [sid=%s, uid=%s, uname=%s, domain=%s]", sid, uid, uname, domain);
    }

}
