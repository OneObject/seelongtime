package com.longtime.ajy.mweb.filter.adapter;

import com.longtime.ajy.model.Account;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.filter.LoginFilterContext;
import com.longtime.ajy.mweb.filter.bean.IcomeUserVo;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.common.spring.SpringContextUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IComeAutoLoginAdapter implements AutoLoginAdapter {


    private static Logger logger = LoggerFactory.getLogger(IComeAutoLoginAdapter.class);

    private UserService userService = null;

    private AccountService accountService;


    private final static String SUPPORT_DOMAIN = "ennapp";

    public IComeAutoLoginAdapter(){
        userService = (UserService) SpringContextUtil.getBean("userService");
        accountService = (AccountService) SpringContextUtil.getBean("accountService");
    }


    @Override
    public String proccess(LoginFilterContext context, HttpServletRequest request, HttpServletResponse response, FilterChain chain) {

        String currrentDomain = context.getDomain();
        logger.debug("in ennapp App adapter.doamin=[{}]", currrentDomain);
        if (!isDomainSupport(currrentDomain)) {
            logger.debug("in ennapp App adapter.doamin=[{}]  domain not support[must is {}]. to  login page.", currrentDomain, SUPPORT_DOMAIN);
            loginFowarder.fowardToLogin(request, response);
            return null;
        }

        String ticket = request.getParameter("ticket");
        IcomeUserVo info = IcomeUserVo.getIcomeUserVo(ticket);

        User user = getUser(info.getWorkphone2(), currrentDomain);

        logger.debug("in ennapp App adapter.get user=[{}]", user);


        if (null == user) {

            if(null != info && StringUtils.isNotBlank(info.getUsername())&& StringUtils.isNotBlank(info.getWorkphone2())){
                user = insertUserFromIcome(info);
                logger.debug("in ennapp App adapter. public user is not exist.isnert user ,id = [{id}] goto active page.",user.getId());
            }

            return null;
        }

        String uid = user.getId();

        storeSession(request, response, currrentDomain, uid);
        return uid;
    }



    @Override
    public boolean isSupport(HttpServletRequest request) {
        String User_Agent = request.getHeader("User-Agent");
        String ticket = request.getParameter("ticket");
        return (StringUtils.isNotBlank(User_Agent) && User_Agent.indexOf("Qing") != -1) && isDomainSupport(MwebHelper.getCurrentDomain()) && StringUtils.isNotBlank(ticket);
    }

    private void storeSession(HttpServletRequest request, HttpServletResponse response,String currrentDomain, String uid) {
        Helper.storeSession(request, response, currrentDomain, uid);
    }


    public boolean isDomainSupport(String domain) {
        return SUPPORT_DOMAIN.equalsIgnoreCase(domain);
    }

    private User getUser(String username, String domain) {
        User user = userService.getUserByUserName(username, domain);
        if (null == user) {
            return null;
        }
        return user.getEnable() == User.ENABLE_NO ? null : user;
    }


    public User insertUserFromIcome(IcomeUserVo info ){
        User user = new User();
        user.setCategory("3"); //创建人员信息为达人
        user.setName(info.getUsername());
        user.setUsername(info.getWorkphone2());
        user.setDomain(SUPPORT_DOMAIN);
        user.setUnitinfo("fromIcome");

        String id = userService.insert(user);
        User entity = userService.findOne(id);
        addAccount(entity);
        return entity;
    }


    private void addAccount(User entity) {
        if (null == entity) {
            return;
        }

        String domain = entity.getDomain();
        String mobile = entity.getMobile();
        String email = entity.getEmail();
        String username = entity.getUsername();

        String pwd_encode = PasswordEncoder.encode(Account.DEFAULT_PWD, String.valueOf(domain));


        if (StringUtils.isNotBlank(username)) {
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


}
