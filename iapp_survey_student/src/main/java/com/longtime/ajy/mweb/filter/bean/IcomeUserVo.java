package com.longtime.ajy.mweb.filter.bean;


import com.alibaba.fastjson.JSON;
import com.longtime.ajy.student.config.Constant;
import com.myctu.platform.HttpHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IcomeUserVo {

    private static Logger logger = LoggerFactory.getLogger(IcomeUserVo.class);

    String appid; //轻应用ID,
    String eid; //企业ID,
    String openid; //用户ID（值为oId值）,
    String username; //用户姓名,
    String xtid;//讯通用户Id,
    String userid;//微博用户Id（一般情况下，xtid与userid相等）,
    String realOpenId;//真实openId,
    String mobile;//新奥itcode,
    String email;//邮箱,
    String workphone1;//办公电话1,
    String workphone2;//新奥员工编号,
    String departOrgName;//用户所属组织长名,
    String cloudpassport;// 云通行证

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getXtid() {
        return xtid;
    }

    public void setXtid(String xtid) {
        this.xtid = xtid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRealOpenId() {
        return realOpenId;
    }

    public void setRealOpenId(String realOpenId) {
        this.realOpenId = realOpenId;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWorkphone1() {
        return workphone1;
    }

    public void setWorkphone1(String workphone1) {
        this.workphone1 = workphone1;
    }

    public String getWorkphone2() {
        return workphone2;
    }

    public void setWorkphone2(String workphone2) {
        this.workphone2 = workphone2;
    }

    public String getDepartOrgName() {
        return departOrgName;
    }

    public void setDepartOrgName(String departOrgName) {
        this.departOrgName = departOrgName;
    }

    public String getCloudpassport() {
        return cloudpassport;
    }

    public void setCloudpassport(String cloudpassport) {
        this.cloudpassport = cloudpassport;
    }


    public static IcomeUserVo getIcomeUserVo(String ticket) {

        String ticketjson = HttpHelper.get().doGet(Constant.ICOME_ACCESS_TOKEN);
        logger.debug("Icome login ticekt = [{}]",ticket);
        logger.debug("Icome login access_tokenjson = [{}]",ticketjson);

        Token token = JSON.parseObject(ticketjson, Token.class);

        StringBuffer userInfoUrl = new StringBuffer(Constant.ICOME_USER_INFO);
        userInfoUrl.append("?ticket=%s&access_token=%s");
        String userinfojson = HttpHelper.get().doGet(String.format(userInfoUrl.toString(), ticket, token.getAccess_token()));
        logger.debug("Icome login userinfojson = [{}]",userinfojson);

        IcomeUserVo entity = JSON.parseObject(userinfojson, IcomeUserVo.class);
        logger.debug("Icome login ticekt = [{}],access_token = [{}],IcomeUserVo info [{}]", ticket, token.getAccess_token(), entity.toString());

        return entity;
    }

    @Override
    public String toString() {
        return "IcomeUserVo{" +
                "appid='" + appid + '\'' +
                ", eid='" + eid + '\'' +
                ", openid='" + openid + '\'' +
                ", username='" + username + '\'' +
                ", xtid='" + xtid + '\'' +
                ", userid='" + userid + '\'' +
                ", realOpenId='" + realOpenId + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", workphone1='" + workphone1 + '\'' +
                ", workphone2='" + workphone2 + '\'' +
                ", departOrgName='" + departOrgName + '\'' +
                ", cloudpassport='" + cloudpassport + '\'' +
                '}';
    }
}



class Token{
    String access_token;
    long expires_in;

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public long getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(long expires_in) {
        this.expires_in = expires_in;
    }
}
