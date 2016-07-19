package com.longtime.ajy.student.service.impl;

import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.longtime.ajy.model.TenantConfig;
import com.longtime.ajy.model.vo.TenantInfo;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.student.service.SiteOpenConfigService;
import com.longtime.ajy.student.service.TenantConfigService;
import com.longtime.ajy.support.SpringContextUtil;

@Service("siteOpenConfigService")
public class SiteOpenConfigServiceImpl implements SiteOpenConfigService {
    private static Logger logger = LoggerFactory.getLogger(SiteOpenConfigServiceImpl.class);

	
	public boolean  checkDomainURLOpenSetting(String domain,String url){
		boolean isOpen = this.getDomainTenantConfig(domain);
		if (!isOpen){
			return false;
		}
		
		
    	return false;

    }
	
	
	
	

	public boolean getDomainTenantConfig(String domain) {
	    
	    
	    
	    TenantInfo tenantInfo = MwebHelper.getTenantInfo();
        return  tenantInfo.isIsopen(); 
        
       /*  
        
		if(StringUtils.isBlank(domain)){
	        return false;
	       }
		TenantConfig tenantConfig = cache.getUnchecked(domain);
		if(null==tenantConfig){
	        return false;
	    }
	    return tenantConfig.isIsopen();
	    
	    */
	}
	
    //以下的代码暂时没有使用
    private static TenantConfigService tenantConfigService;
    // 自动刷新的cache  在写入 1 min后刷新key的值  
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

}
