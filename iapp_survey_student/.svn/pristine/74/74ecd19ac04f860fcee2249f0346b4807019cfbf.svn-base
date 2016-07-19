<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.longtime.ajy.ext.yunmart.OauthHelper" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.longtime.ajy.student.service.UserService" %>
<%@ page import="com.longtime.common.spring.SpringContextUtil" %>
<%@ page import="com.longtime.ajy.model.User" %>
<%@ page import="com.longtime.common.dao.IdGenerator" %>
<%@ page import="com.longtime.ajy.support.PasswordEncoder" %>
<%@ page import="com.longtime.ajy.model.Account" %>
<%@ page import="com.longtime.ajy.mweb.filter.adapter.AutoLoginAdapter" %>
<%@ page import="com.longtime.ajy.student.service.AccountService" %>
<%!
    static Logger logger = LoggerFactory.getLogger("com.longtime.api.yunmart.jsp");
    static  String oauthUrl = OauthHelper.oauthURL();

    static UserService userService = (UserService) SpringContextUtil.getBean("userService");
    static  AccountService accountService = (AccountService) SpringContextUtil.getBean("accountService");
    public static void redirectToOauth(HttpServletResponse  response,String url){
        try {
            logger.debug("yunmart redirect url=[{}]", url);
            response.sendRedirect(url);
        } catch (IOException e) {
            logger.error("yunmart redirect due to error.",e);
        }
    }

    public static User  addUser(OauthHelper.User userInfo){
        User user = new User();
        user.setId(IdGenerator.uuid32());
        user.setUsername(userInfo.getUsername());
        user.setName(userInfo.getName());
        user.setEmail(userInfo.getEmail());
        int gender = 3;

        user.setGender(gender);
        user.setDomain(OauthHelper.domain);
        user.setOid(String.format("domain_%s", OauthHelper.domain));
        userService.insert(user);

        addAccount(user);
        return user;
    }
    public static void addAccount(User entity) {
        if (null == entity) {
            return;
        }

        String domain = entity.getDomain();
        String mobile = entity.getMobile();
        String email = entity.getEmail();
        String username = entity.getUsername();

        String pwd_encode = PasswordEncoder.encode(Account.DEFAULT_PWD, String.valueOf(domain));

        if (StringUtils.isNotBlank(mobile)) {
            Account account = new Account();
            account.setAccount(mobile.toLowerCase());
            account.setType(Account.Type.phone.getCode());
            account.setDomainid(domain);
            account.setPwd(pwd_encode);
            account.setStatus(Account.Status.normal.getCode());
            account.setUid(entity.getId());
            account.setCreatetime(System.currentTimeMillis());
            accountService.insert(account);
        }

        if (StringUtils.isNotBlank(email)) {
            Account account = new Account();
            account.setAccount(email.toLowerCase());
            account.setType(Account.Type.email.getCode());
            account.setDomainid(domain);
            account.setPwd(pwd_encode);
            account.setStatus(Account.Status.normal.getCode());
            account.setUid(entity.getId());
            account.setCreatetime(System.currentTimeMillis());
            accountService.insert(account);
        }

        if (StringUtils.isNotBlank(username)
                && !username.equalsIgnoreCase(email)) {
            Account account = new Account();
            account.setAccount(username.toLowerCase());
            account.setType(Account.Type.username.getCode());
            account.setDomainid(domain);
            account.setPwd(pwd_encode);
            account.setStatus(Account.Status.normal.getCode());
            account.setUid(entity.getId());
            account.setCreatetime(System.currentTimeMillis());
            accountService.insert(account);

        }
    }

    public static void storeSession(HttpServletRequest request, HttpServletResponse response, String openId,
                              String currrentDomain, String uid) {
//        LoginSession loginSession = new LoginSession();
//        loginSession.setSid(IdGenerator.uuid32());
//        loginSession.setUid(uid);
//        loginSession.setDomain(currrentDomain);
//        SessionHelper.storeSession(request, response, loginSession, openId);
        AutoLoginAdapter.Helper.storeSession(request, response, currrentDomain, uid, openId);
    }

%>
<%


    String code = request.getParameter("code");

    if(StringUtils.isBlank(code)){
        redirectToOauth(response,oauthUrl);
        return;
    }

    OauthHelper.User userInfo = OauthHelper.getUserInfo(code);

    if(null==userInfo || StringUtils.isBlank(userInfo.getUsername())){
        redirectToOauth(response,OauthHelper.ajy_index);
        return;
    }

    //找对用户
    String username = userInfo.getUsername();
    String domain = OauthHelper.domain;

    User user = userService.getUserByUserName(username,domain);

    if(null==user){
        // 创建用户
        user = addUser(userInfo);
    }

    if(null==user){
        redirectToOauth(response,OauthHelper.ajy_index);
        return;
    }


    // 模拟登录
    logger.debug("yunmart get user  user=[{}]", user);
    storeSession(request, response, "", domain, user.getId());


    redirectToOauth(response,OauthHelper.ajy_index);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>yunmart sso</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
</head>
<body>

<p>
redirect
<p>
</body>
</html>