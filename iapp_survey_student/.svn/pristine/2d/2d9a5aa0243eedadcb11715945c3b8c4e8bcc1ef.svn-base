package com.longtime.ajy.mweb.web;

import com.longtime.ajy.mweb.MwebHelper;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public abstract class MBaseController {
    

    private static Logger      logger                = LoggerFactory.getLogger(MBaseController.class);

    public static MwebHelper mwebHelper = new MwebHelper();
    
    public String getCurrentUid(HttpServletRequest request){
        String uid =  MwebHelper.getCurrentUid();
        logger.debug("uid=[{}]", uid);  
        return uid;
    }

    public String getCurrentDomain(HttpServletRequest request){
        
        String domain = MwebHelper.getCurrentDomain();
        
        logger.debug("domain=[{}]", domain);
        return domain;
    }
    
    
}
