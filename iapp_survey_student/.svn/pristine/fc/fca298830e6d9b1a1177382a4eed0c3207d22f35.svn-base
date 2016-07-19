package com.longtime.ajy.student.service.impl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.longtime.ajy.model.Account;
import com.longtime.ajy.model.User;
import com.longtime.ajy.student.service.AccountService;
import com.longtime.ajy.student.service.RegisterService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.PasswordEncoder;
import com.longtime.common.dao.IdGenerator;

@Service("registerService")
public class RegisterServiceImpl implements RegisterService {

	private static Logger logger = LoggerFactory
			.getLogger(RegisterServiceImpl.class);

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "accountService")
	private AccountService accountService;

	/*
	 * @Override public User doRegister(RegisterForm registerForm) throws
	 * RegisterException {
	 * 
	 * if (null == registerForm || !registerForm.validate()) { throw new
	 * RegisterException(Code.empty); } if
	 * (StringUtils.isNotBlank(registerForm.getEmail())) { boolean isExist =
	 * userService.checkUsernameIsExist(registerForm .getEmail()); if (isExist)
	 * { throw new RegisterException(Code.exist); } }
	 * 
	 * if (StringUtils.isNotBlank(registerForm.getMobile())) { boolean isExist =
	 * userService.checkUsernameIsExist(registerForm .getMobile()); if (isExist)
	 * { throw new RegisterException(Code.exist); } } User user = new User();
	 * user.setEmail(registerForm.getEmail());
	 * user.setMobile(registerForm.getMobile());
	 * user.setName(registerForm.getName());
	 * user.setUnitinfo(registerForm.getOrg());
	 * user.setDomain(registerForm.getDomain());
	 * user.setId(IdGenerator.uuid32());
	 * user.setCreatetime(System.currentTimeMillis()); userService.insert(user);
	 * 
	 * // 添加账号 if (StringUtils.isNotBlank(user.getEmail())) { Account account =
	 * new Account(); account.setAccount(user.getEmail().toLowerCase());
	 * account.setType(Account.Type.email.code); account.setUid(user.getId());
	 * account.setDomainid(user.getDomain());
	 * account.setPwd(PasswordEncoder.encode(registerForm.getPassword(),
	 * user.getDomain())); account.setCreatetime(System.currentTimeMillis());
	 * accountService.insert(account); }
	 * 
	 * if (StringUtils.isNotBlank(user.getMobile())) { Account account = new
	 * Account(); account.setAccount(user.getMobile().toLowerCase());
	 * account.setType(Account.Type.phone.code); account.setUid(user.getId());
	 * account.setDomainid(user.getDomain());
	 * account.setPwd(PasswordEncoder.encode(registerForm.getPassword(),
	 * user.getDomain())); account.setCreatetime(System.currentTimeMillis());
	 * accountService.insert(account); } registerForm.setUid(user.getId());
	 * 
	 * return user;
	 * 
	 * }
	 */

	public User doRegister(RegisterForm registerForm) throws RegisterException {

		if (null == registerForm || !registerForm.isBlank()) {//
			throw new RegisterException(Code.empty);
		}
		
		
		if (StringUtils.isNotBlank(registerForm.getUsername())) {
			
			Pattern p = Pattern.compile("[^0-9A-Za-z@\\-_.]+|[\u4e00-\u9fa5]+|\\s+");
			Matcher m = p.matcher(registerForm.getUsername());
			if(m.find() || registerForm.getUsername().toCharArray().length > 32){
				throw new RegisterException(Code.illegal);
			}
				
			boolean isExist = userService.checkUsernameIsExistByUsername(
					registerForm.getUsername(), registerForm.getDomain());
			if (isExist) {
				throw new RegisterException(Code.exist);
			}
			
		}

		if (StringUtils.isNotBlank(registerForm.getMobile())) {
			boolean isExist = userService.checkUsernameIsExistByMobile(
					registerForm.getMobile(), registerForm.getDomain());
			if (isExist) {
				throw new RegisterException(Code.exist);
			}
		}

		User user = new User();
		user.setMobile(registerForm.getMobile());
		user.setUsername(registerForm.getUsername());
		user.setName(registerForm.getName());
		user.setNickname(registerForm.getNickname());
		user.setDomain(registerForm.getDomain());
		user.setOid(registerForm.getOid());
		user.setId(IdGenerator.uuid32());
		user.setCreatetime(System.currentTimeMillis());
		
		if(registerForm.isDisable()){
		    user.setEnable(User.ENABLE_NO);
		}
		
		userService.insert(user);

		// 添加账号
		if (StringUtils.isNotBlank(user.getUsername())) {
			Account account = new Account();
			account.setAccount(user.getUsername().toLowerCase());
			account.setType(Account.Type.username.code);
			account.setUid(user.getId());
			account.setDomainid(user.getDomain());
			account.setPwd(PasswordEncoder.encode("888888",
					registerForm.getDomain()));
			account.setCreatetime(System.currentTimeMillis());

			if(registerForm.isDisable()){
			    account.setStatus(Account.Status.disable.getCode());
	        }
			
			accountService.insert(account);
		}

		if (StringUtils.isNotBlank(user.getMobile())) {
			Account account = new Account();
			account.setAccount(user.getMobile().toLowerCase());
			account.setType(Account.Type.phone.code);
			account.setUid(user.getId());
			account.setDomainid(user.getDomain());
			account.setPwd(PasswordEncoder.encode("888888",
					registerForm.getDomain()));
			account.setCreatetime(System.currentTimeMillis());
            if(registerForm.isDisable()){
                account.setStatus(Account.Status.disable.getCode());
            }
            
			accountService.insert(account);
		}
		registerForm.setUid(user.getId());
		return user;
	}

}
