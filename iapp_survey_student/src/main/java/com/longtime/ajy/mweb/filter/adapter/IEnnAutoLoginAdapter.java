package com.longtime.ajy.mweb.filter.adapter;

import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.filter.LoginFilterContext;
import com.longtime.ajy.student.service.UserService;
import com.longtime.common.spring.SpringContextUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * i新奥 app集成 自动登录。  通过user-agent：Qing 区分
 */
public class IEnnAutoLoginAdapter implements AutoLoginAdapter {

    private static Logger logger = LoggerFactory.getLogger(IEnnAutoLoginAdapter.class);
    private UserService userService = null;

    private final static String public_username = "iennpublicuser";

    private final static String SUPPORT_DOMAIN = "ENN";


    public IEnnAutoLoginAdapter() {
        userService = (UserService) SpringContextUtil.getBean("userService");
    }

    @Override
    public String proccess(LoginFilterContext context, HttpServletRequest request, HttpServletResponse response,
                           FilterChain chain) {


        String currrentDomain = context.getDomain();
        logger.debug("in iENN App adapter.doamin=[{}]", currrentDomain);
        if (!isDomainSupport(currrentDomain)) {
            logger.debug("in iENN App adapter.doamin=[{}]  domain not support[must is {}]. to  login page.", currrentDomain, SUPPORT_DOMAIN);
            loginFowarder.fowardToLogin(request, response);
            return null;
        }

        User user = getUser(public_username, currrentDomain);

        logger.debug("in iENN App adapter.get user=[{}]", user);


        if (user == null) {
            logger.debug("in iENN App adapter. public user is not exist. goto login page.");
            loginFowarder.fowardToLogin(request, response);
            return null;
        }

        String uid = user.getId();

        storeSession(request, response, currrentDomain, uid);
        return uid;
    }

    @Override
    public boolean isSupport(HttpServletRequest request) {
        String User_Agent = request.getHeader("User-Agent");
        return (StringUtils.isNotBlank(User_Agent) && User_Agent.indexOf("Qing") != -1) && isDomainSupport(MwebHelper.getCurrentDomain());

    }

    public boolean isDomainSupport(String domain) {
        return SUPPORT_DOMAIN.equalsIgnoreCase(domain);
    }

    private void storeSession(HttpServletRequest request, HttpServletResponse response,
                              String currrentDomain, String uid) {
//        LoginSession loginSession = new LoginSession();
//        loginSession.setSid(IdGenerator.uuid32());
//        loginSession.setUid(uid);
//        loginSession.setDomain(currrentDomain);
//        SessionHelper.storeSession(request, response, loginSession);
        Helper.storeSession(request, response, currrentDomain, uid);
    }


    private User getUser(String username, String domain) {
        User user = userService.getUserByUserName(username, domain);
        if (null == user) {
            return null;
        }

        return user.getIsdel() == User.ISDEL_YES || user.getEnable() == User.ENABLE_NO ? null : user;

    }

}
