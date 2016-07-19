package com.longtime.ajy.student.service.impl;

import java.util.UUID;

import org.springframework.stereotype.Service;

import com.longtime.ajy.session.LoginSession;
import com.longtime.ajy.student.service.LoginService;

@Service("vmLoginService")
public class VMLoginServiceImpl implements LoginService {

    @Override
    public LoginSession doLogin(LoginForm loginForm)  throws LoginException{
        
        if(!loginForm.validate()){
            throw new LoginException(Code.empty);
        }
        
        
        return mock(loginForm);
    }
    
    private LoginSession  mock(LoginForm loginForm){
        
        LoginSession session = new LoginSession();
        
        session.setSid(UUID.randomUUID().toString());
        
        session.setUid("100");
        session.setUname(loginForm.getUsername());
        session.setDomain("ajy");
        
        return session;
        
    }

    @Override
    public LoginSession doLogin(String username, String string)
    		throws LoginException {
    	// TODO Auto-generated method stub
    	return null;
    }
}
