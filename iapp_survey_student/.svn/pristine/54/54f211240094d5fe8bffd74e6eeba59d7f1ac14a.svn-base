package com.longtime.ajy.student.service.impl;

import com.google.common.collect.Maps;
import com.longtime.ajy.model.Account;
import com.longtime.ajy.model.Tenant;
import com.longtime.ajy.model.User;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.ajy.student.service.TenantService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.ajy.support.service.EmailSender;
import com.longtime.common.dao.Repository;
import com.longtime.common.model.search.Search;
import com.longtime.common.service.BaseServiceImpl;
import com.longtime.common.utils.FreemarkerUtils;
import com.longtime.common.utils.MaskUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account, Long> implements AccountService {

    @Resource(name="userService")
    private UserService userService;
    
    @Resource(name="tenantService")
    private  TenantService tenantService;
    
    @Resource(name="emailSender")
    private EmailSender  emailSender;

    @Resource(name = "accountRepository")
    private Repository<Account, Long> accountRepository;

    @Override
    public Repository<Account, Long> getRepository() {
        return accountRepository;
    }

    public Account getAccount(String account,String domain) {
        if (StringUtils.isBlank(account)) {
            return null;
        }
        account = StringUtils.lowerCase(account);
        Search search = Search.newInstance();
        search.addEqualFilter("account", account);
        if(StringUtils.isNotBlank(domain)){
            search.addEqualFilter("domainid", domain);
        }

        List<Account> accounts = this.list(search);

        return (null == accounts || accounts.isEmpty()) ? null : accounts.get(0);

    }

    public void updateLoginNum(Long id) {

        String sql = "update base_account set loginnum=loginnum+1, lastlogintime=:lastlogintime where id=:id";
        // 更新用户最后登录时间和次数
        Map<String, Long> paramMap = Maps.newHashMap();
        paramMap.put("lastlogintime", System.currentTimeMillis());
        paramMap.put("id", id);
        getRepository().update(sql, paramMap);
    }
    
    @Override
    public void updateLoginNum(String uid,Account.Type type){
        if(StringUtils.isBlank(uid)){
            return;
        }
        String sql = "update base_account set loginnum=loginnum+1, lastlogintime=:lastlogintime where uid=:uid and type=:type";
        // 更新用户最后登录时间和次数
        Map<String, Object> paramMap = Maps.newHashMap();
        paramMap.put("lastlogintime", System.currentTimeMillis());
        paramMap.put("uid", uid);
        if(null==type){
            type = Account.Type.username;
        }
        paramMap.put("type", type.code);
        getRepository().update(sql, paramMap);
    }

	@Override
	public List<Account> getAccountByid(String uid) {
		 if (StringUtils.isBlank(uid)) {
	            return null;
	        }
	        Search search = Search.newInstance();
	        search.addEqualFilter("uid", uid);

	        List<Account> accounts = this.list(search);
	        return accounts;
	}

	@Override
	public void updatePass(Account account) {
		String sql="update base_account set pwd=:pwd where id=:id";
		Map<String,Object> map=Maps.newHashMap();
		map.put("pwd",account.getPwd());
		map.put("id", account.getId());
		getRepository().update(sql, map);
	}
	
	
	/* 
     * 0：正常 1: 用户不存在 2：邮箱没设置  99：参数错误  100：未知错误
     */
    @Override
    public int findPassword(String account,String domain){
        if(StringUtils.isBlank(account) || StringUtils.isBlank(domain)){
            return 99;
        }
        Account accountObj = this.getAccount(account, domain);
        if(null==accountObj){
            return 1;
        }
        String uid = accountObj.getUid();
        String pwd = accountObj.getPwd();
        
        User user = userService.getUserById(uid, domain);
        
        if(user == null){
            return 1;
        }
        if( StringUtils.isBlank(user.getEmail())){
            return 2;
        }
        
        Tenant tenant =  tenantService.findOne(domain);
        String title = StringUtils.EMPTY;
        if(null!=tenant && StringUtils.isNotBlank(tenant.getName())){
            title = String.format("%s-", tenant.getName());
        }
        String originalPwd = PasswordEncoder.decode(pwd, domain);
        //String text = String.format("您好 %s: 您账号密码为 %s", StringUtils.isBlank(user.getName())?MaskUtils.mask(user.getUsername(),3,3):user.getName(),originalPwd);
        Map<String,Object> context = Maps.newHashMap();
        context.put("name", user.getName());
        context.put("loginname", MaskUtils.mask(user.getUsername(), 3, 2));
        context.put("pwd", originalPwd);
        String text = FreemarkerUtils.toString("findpwd.ftl", context);
        emailSender.sendAsyn(user.getEmail(), String.format("[服务邮件]%s密码找回",title), text, true);
        
        return 0;
    }

    @Override
    public void updateLastLoginTime(String uid,long lastLoginTime) {
        if(StringUtils.isBlank(uid)){
            return;
        }
    	String sql="update base_account set lastlogintime=:lastlogintime where uid=:uid";
		Map<String,Object> map=Maps.newHashMap();
		map.put("lastlogintime",lastLoginTime);
		map.put("uid",uid);
		getRepository().update(sql, map);
    }

    @Override
    public boolean deleteAccunt(String uid) {
        if(StringUtils.isBlank(uid)){
            return false;
        }
        String sql="delete from base_account where uid=:uid";
        Map<String,Object> map=Maps.newHashMap();
        map.put("uid", uid);
        getRepository().update(sql, map);
        return true;
    }
}
