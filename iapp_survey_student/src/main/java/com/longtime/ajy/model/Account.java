package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class Account extends BaseEntity<Long> {

    private static final long serialVersionUID = -8305032256500147748L;
    private Long   id;
    private String account;
    private String pwd;                        // 密文
    private short  type   = Type.email.code;   // 0:邮箱 1：手机 3：xxx
    private String uid;
    private String domainid;
    private short  status = Status.normal.code; // 0可用 1禁用
    private Long lastlogintime = 0L; //最后登录时间
    private Long loginnum =0L;//
    
    public static String ILLEGAL_ARGUMENTS = "10"; //参数错误
    public static String UNKNOWN_ACCOUNT = "11"; //账号不存在
    public static String ERROR_PWD = "12"; //密码错误
    public static String DEFAULT_PWD = "888888"; //默认密码
    

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public short getType() {
        return type;
    }

    public void setType(short type) {
        this.type = type;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getDomainid() {
        return domainid;
    }

    public void setDomainid(String domainid) {
        this.domainid = domainid;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    
    public Long getLastlogintime() {
        return lastlogintime;
    }

    
    public void setLastlogintime(Long lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    
    public Long getLoginnum() {
        return loginnum;
    }

    
    public void setLoginnum(Long loginnum) {
        this.loginnum = loginnum;
    }

    @Override
    public String toString() {
        return String.format("Account [id=%s, account=%s, pwd=%s, type=%s, uid=%s, domainid=%s, status=%s, lastlogintime=%s, loginnum=%s]",
                             id, account, pwd, type, uid, domainid, status, lastlogintime, loginnum);
    }

    public static enum Type {
        email((short) 0), phone((short) 1),username((short)2),other((short)10);

        public short code;

        Type(short code){
            this.code = code;
        }

        public short getCode() {
            return code;
        }
    }

    public static enum Status {
        normal((short) 0), disable((short) 1);

        private short code;

        Status(short code){
            this.code = code;
        }

        public short getCode() {
            return code;
        }
    }

}
