package com.longtime.ajy.student.filter.handler;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.longtime.ajy.model.TenantConfig;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.service.SiteOpenConfigService;
import com.longtime.ajy.student.service.TenantConfigService;
import com.longtime.ajy.support.SpringContextUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



/**
 * 
 * 站点是否开放
 * @project iapp_student
 * @date    2014年3月21日-下午4:12:47
 * @author  songsp
 */
public class SiteOpenConfigHandler implements FilterOperationHandler {
    private static Logger logger = LoggerFactory.getLogger(SiteOpenConfigHandler.class);
    
    private static SiteOpenConfigService siteOpenConfigService;
    
    @Override
    public boolean handle(HttpServletRequest request, HttpServletResponse response) throws ServletException {
    	
        String domain = SessionHelper.getCurrentDomain(); 
       // logger.debug("domain =[{}]",domain);
    	String url = request.getServletPath();
        if(StringUtils.isBlank(domain)){ //进入一个处理逻辑
            return false;
        }
        
        boolean pass =  getSiteOpenConfigService().checkDomainURLOpenSetting(domain, url);
        
        
        //logger.debug("check url  is open. domain=[{}] pass=[{}] url=[{}] ", domain, pass,url);
        
        return pass;
        
        
        /*
        
        logger.debug("filter site is open ? ");
        
        String domain = SessionHelper.getCurrentDomain();
        
        if(StringUtils.isBlank(domain)){ //进入一个处理逻辑
            return false;
        }
        //获取domain 的config
        boolean  isOpen = isOpen(domain, request);
        logger.debug("filter site is open. domain=[{}] result=[{}]",domain,isOpen);
        
        
        if(isOpen){
            return true;
        }
        
        boolean pass = checkDomainURLOpenSetting(domain,request);
        
        return pass ;
		*/
    }

    private SiteOpenConfigService getSiteOpenConfigService() {
        if(siteOpenConfigService==null){
        	siteOpenConfigService = (SiteOpenConfigService) SpringContextUtil.getBean("siteOpenConfigService");
        }
        
        return siteOpenConfigService;
    }
    
    
    
    
    private String[] urls = new String []{"/m/ixin/*"};
    private boolean  checkDomainURLOpenSetting(String domain,HttpServletRequest request){
        
        
        // TODO  临时添加
        if("xinfuyangfan".equals(domain)){
            
            return false;
        }
        if("guoyao".equals(domain)){
            return false;
        }
        if("jinjiang".equals(domain)){
            return false;
        }
        
        String url = request.getServletPath();
        for (String pattern : urls) {
            Pattern p = Pattern.compile("^" + pattern);
            Matcher m = p.matcher(url);
            if (m.find()) {
                return true;
            }
        }
        return false;
        
    }
    
    
    // 自动刷新的cache  在写入 1 hours后刷新key的值  
    public static LoadingCache<String, TenantConfig> cache = CacheBuilder.newBuilder()
            .refreshAfterWrite(1, TimeUnit.MINUTES).maximumSize(100)  
            .build(new CacheLoader<String, TenantConfig>() {

                @Override
                public TenantConfig load(String key) throws Exception {
                    return get(key);
                }

                private TenantConfig get(String key) {
                    if(tenantConfigService==null){
                        tenantConfigService = (TenantConfigService) SpringContextUtil.getBean("tenantConfigService");
                    }
                    TenantConfig tenatConfig =  tenantConfigService.findOne(key);
                    logger.debug("get tenant config from db. data=[]", tenatConfig);
                    return tenatConfig==null? new TenantConfig():tenatConfig ;
                }
            });  
    
   public boolean  isOpen(String domain,HttpServletRequest request){
       if(StringUtils.isBlank(domain)){
           return false;
       }
      TenantConfig tenantConfig = cache.getUnchecked(domain);
      request.setAttribute("tenantConfig", tenantConfig);
      if(null==tenantConfig){
          return false;
      }
      return tenantConfig.isIsopen();
   }
    
    private static TenantConfigService tenantConfigService;

 
}
