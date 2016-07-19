package com.longtime.ajy.mweb.service.impl;

import com.google.common.base.Joiner;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.longtime.ajy.model.TenantConfig;
import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.service.CheckBindStatusService;
import com.longtime.ajy.student.service.TenantConfigService;
import com.telecom.ctu.platform.common.cache.CacheService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

@Service(value = "checkBindStatusService")
public class CheckBindStatusServiceImpl implements CheckBindStatusService {

    private static Logger        logger           = LoggerFactory.getLogger(CheckBindStatusServiceImpl.class);

    @Resource(name = "lt.cacheService")
    CacheService                 cacheService;

    private final static boolean checkBindStatus  = true;

    private final static int     LOSEFUNCTIONTIME = 24 * 60 * 60; //24 小时
    
    
    private final static String  prefix_sid_key = "sid_%s";
    
    private final static String  prefix_uid_sid_key ="usid_%s";
    

	@Resource(name = "tenantConfigService")
	private TenantConfigService tenantConfigService;
	
	private boolean isSingle() {
		String currrentDomain = MwebHelper.getCurrentDomain();
		TenantConfig tenantConfig = this.tenantConfigService.findOne(currrentDomain);
		if (tenantConfig == null) {
			return false;
		}
		return tenantConfig.isIssingle();
	}

    @Override
    public void addCache(String uid, String sid) {
        addCache(uid,sid,LOSEFUNCTIONTIME);
    }
    
    @Override
    public void addCache(String uid, String sid, int expire_seconds) {
    	 if (checkBindStatus) {
             if(MwebHelper.DEFAULT_UID.equals(uid)){ //未登录用户设置的uid，无需记录。
                 return;
             }
             String key = getSidKey(sid);
             cacheService.put(key, expire_seconds, uid);
             addUidCache(uid, sid, expire_seconds);
         }
    	
    }

	private synchronized void addUidCache(String uid, String sid, int expire_seconds) {
		String key = getUidSidKey(uid);
		String sids = this.cacheService.get(key);
		List<String> idsList = null;
		Iterable<String> strarray = null;
		if (StringUtils.isNotBlank(sids)) {
			strarray = Splitter.on(",").trimResults().omitEmptyStrings().split(sids);
			idsList = Lists.newLinkedList(strarray);
			
			if (sid.startsWith("p_")) {// 如果是pc端登录
				if (isSingle()) {// 不允许一个帐号同时登录
					for (Iterator<String> iter = strarray.iterator(); iter.hasNext();) {
						String value = iter.next();
						if (value.startsWith("m_")) {// 移动端登录
							continue;
						} else if (value.startsWith("p_")) {// pc端登录
							if (!sid.equals(value)) {
								this.cacheService.remove(getSidKey(value));
								idsList.remove(value);
							}
						} else {// 旧数据
							this.cacheService.remove(getSidKey(value));
							idsList.remove(value);
						}
					}
				}
			}
		}

		if (CollectionUtils.isEmpty(idsList)) {
			cacheService.put(key, expire_seconds, sid);
		} else {
			idsList.add(sid);
			String value = Joiner.on(",").join(idsList);
			cacheService.put(key, expire_seconds, value);
		}
	}



    @Override
    public boolean checkSid(String sid) {
        if (checkBindStatus) {
            long start = System.currentTimeMillis();
            String key = getSidKey(sid);
            String uid = cacheService.get(key);
            //logger.debug("get uid by sid from cache.sid=[{}] uid=[{}]. time=[{} ms]", sid, uid,System.currentTimeMillis()-start);
            if (StringUtils.isBlank(uid)) {
                return false;
            }
        }
        return true;
    }

    @Override
    public void remove(String uid, String sid) {
        String key = getUidSidKey(uid);
        String sidStr = cacheService.get(key);
        // 根据uid得到sid
        if (StringUtils.isNotBlank(sidStr)) {
            String[] sids = sidStr.split(",");
            if (sids != null && sids.length > 0) {
                for (String currsid : sids) {
                    if(StringUtils.isBlank(currsid)){
                        continue;
                    }
                    this.cacheService.remove(getSidKey(currsid));
                }
            }
            this.cacheService.remove(key);
        }
        if(StringUtils.isNotBlank(sid)){
            String sidKey = getSidKey(sid);
            this.cacheService.remove(sidKey);
        }
    }

    private String getUidSidKey(String uid) {
        return String.format(prefix_uid_sid_key, uid);
    }
    

    private String getSidKey(String sid) {
        return String.format(prefix_sid_key, sid);
    }

}
