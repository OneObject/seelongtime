package com.longtime.ajy.student.service.impl;

import com.longtime.ajy.model.Account;
import com.longtime.ajy.model.User;
import com.longtime.ajy.session.LoginSession;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.ajy.student.service.LoginService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.common.dao.IdGenerator;
import javax.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name = "accountService")
	private AccountService accountService;
	
	@Resource(name="userService")
	private UserService  userService;

	@Override
	public LoginSession doLogin(LoginForm loginForm) throws LoginException {
	    
	    if (null == loginForm || !loginForm.validate()) {
            throw new LoginException(Code.empty);
        }
	    
	    if(loginForm.isCustomLogin()){
	        return doCustomLogin(loginForm);
	    }
	    
	    if(loginForm.isTimeExpire()){
		    	throw new LoginException(Code.timeexpire);
	    }
	    
	    return doBaseLogin(loginForm);
	    
	}

	private LoginSession doBaseLogin(LoginForm loginForm) throws LoginException {
		Account account = this.accountService.getAccount(
				loginForm.getUsername(), loginForm.getDomain());
		if (account == null) {
			throw new LoginException(Code.pwdfial);
		}

		if (account.getStatus() == Account.Status.disable.getCode()) {
			throw new LoginException(Code.disable);
		}
		
		
		
		String password = PasswordEncoder.decode(account.getPwd(),account.getDomainid());
		
		
		if(!loginForm.validatePwd(password)){
			throw new LoginException(Code.pwdfial);
		}
		
		/*
		password = MD5.encodeMd5(String.format("%s%d", password,loginForm.getTimestamp()));
		if (!password.equals(loginForm.getPassword())) {
			
		}
		 */
		
		if (StringUtils.isNotBlank(loginForm.getDomain())
				&& !"null".equals(loginForm.getDomain())) {
			if (!loginForm.getDomain().equals(account.getDomainid())) {
				throw new LoginException(Code.unequal_domain);
			}
		}
		this.accountService.updateLoginNum(account.getId()); //登录次数
		return createLoginSession(account.getUid(),account.getDomainid());
	}
	private LoginSession doCustomLogin(LoginForm loginForm) throws LoginException {
	    
	    User user = userService.getUser(loginForm.getCustom(), loginForm.getDomain());
	    if(null==user){
            throw new LoginException(Code.fail);
        }
	    if( user.getEnable()== User.ENABLE_NO){
	        throw new LoginException(Code.disable);
	    }
	    
	    accountService.updateLoginNum(user.getId(), Account.Type.username);
        return createLoginSession(user.getId(),user.getDomain());
	}
	
	private LoginSession  createLoginSession(String uid,String domain){
	    LoginSession session = new LoginSession();
        session.setSid(IdGenerator.uuid32().toString());
        session.setUid(uid);
        session.setDomain(domain);
        return session;
	}

	@Override
	public LoginSession doLogin(String username, String domain) throws LoginException{
		Account account = this.accountService.getAccount( username, domain);
		if (account == null) {
			throw new LoginException(Code.pwdfial);
		}

		if (account.getStatus() == Account.Status.disable.getCode()) {
			throw new LoginException(Code.disable);
		} 

		if (StringUtils.isNotBlank(domain)
				&& !"null".equals(domain)) {
			if (!domain.equals(account.getDomainid())) {
				throw new LoginException(Code.unequal_domain);
			}
		}

		this.accountService.updateLoginNum(account.getId());
		return createLoginSession(account.getUid(),account.getDomainid());
	}
}
