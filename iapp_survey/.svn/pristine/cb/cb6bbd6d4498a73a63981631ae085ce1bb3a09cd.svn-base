package com.longtime.app.weixin.cp.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.oplog.listener.OpLogHandle;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.app.oplog.service.OpLogService;
import com.longtime.app.oplog.support.OpLogServiceWrapper;
import com.longtime.app.weixin.cp.service.SyncToWxCpService;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.ResultSet;
import com.telecom.ctu.platform.common.cache.CacheService;

@Service("syncToWxCpService")
public class SyncToWxCpServiceImpl implements SyncToWxCpService{
	
	private static Logger logger = LoggerFactory.getLogger(SyncToWxCpServiceImpl.class);
	
	@Resource(name = "opLogService")
	private OpLogService opLogService;

	@Resource(name = "tenantConfigService")
	private TenantConfigService tenantConfigService;
	
	@Resource(name = "tokenService")
	private ITokenService tokenService;
	
	@Resource(name = "opLogHandle")
	private OpLogHandle opLogHandle;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "organizationService")
	private OrganizationService organizationService;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	private static final String DURING_SYNC_TO_WXCP_KEY = "stw_%s";
	private static final String DURING_INIT_SYNC_TO_WXCP_KEY = "sitw_%s";
	private static final int EXPIRE_TIME = 8*60*60;
	
	@Override
	public void doSyncToWxCp(String domain) {
		
		TokenInfo tokenInfo = this.tokenService.getTokenInfoByDomain(domain);
		if(tokenInfo == null || !tokenInfo.isWXQY()){
			return;
		}
		
		TenantConfig config = this.tenantConfigService.getByDomain(domain);
		if(config == null || !config.isIsautosyn()){
			return;
		}
		
		String cacheKey = String.format(DURING_SYNC_TO_WXCP_KEY, domain);
		String isDuring = cacheService.get(cacheKey);
		if("1".equals(isDuring)){
			return;
		}
		cacheService.put(cacheKey, EXPIRE_TIME, "1");
		
		try {
			for(int i=1;;i++){
				Page page = new Page(i, 100);
				List<OpLog> opLogs = this.opLogService.getNeedSyncList(domain,page);
				if(CollectionUtils.isEmpty(opLogs)){
					return;
				}
				
				for(OpLog opLog : opLogs){
					opLogHandle.processFromTask(opLog);
				}
			}
		} catch (Exception e) {
			logger.error("SyncToWxCp from oplog due to error.", e);
		} finally {
			cacheService.remove(cacheKey);
		}
	}
	
	@Override
	public void doInitSyncToWxCp(String domain) {
		TokenInfo tokenInfo = this.tokenService.getTokenInfoByDomain(domain);
		if(tokenInfo == null || !tokenInfo.isWXQY()){
			return;
		}
		
		TenantConfig config = this.tenantConfigService.getByDomain(domain);
		if(config == null || !config.isIsautosyn()){
			return;
		}
		
		String cacheKey = String.format(DURING_INIT_SYNC_TO_WXCP_KEY, domain);
		String isDuring = cacheService.get(cacheKey);
		if("1".equals(isDuring)){
			return;
		}
		cacheService.put(cacheKey, EXPIRE_TIME, "1");
		
		try {
			Organization org = this.organizationService.get(String.format("domain_%s", domain));
			syncOrg(org.getChildren());
			syncUser(domain);
		} finally {
			cacheService.remove(cacheKey);
		}
		
	}

	private void syncOrg(Set<Organization> childs) {
		if(CollectionUtils.isEmpty(childs)){
			return ;
		}
		
		try {
			for(Organization org : childs){
				if(org.getSynchronousstatus() == 0){
					OpLogServiceWrapper.addOrg(org.getId(), org.getSynctype(), org.getDomain());
				}
				
				if(CollectionUtils.isNotEmpty(org.getChildren())){
					syncOrg(org.getChildren());
				}
			}
		} catch (Exception e) {
			logger.error("SyncToWxCp with org due to error.", e);
		}
	}
	
	private void syncUser(String domain) {
		
		try {
			for(int i=1;;i++){
				QueryCondition condition = new QueryCondition();
				condition.addFilter("domain", domain);
				condition.addFilter("synchronousstatus", 0);
				condition.addFilter("isDel",User.ISDEL_NO);
				
				Page page = new Page(i, 100);
				ResultSet<User> rs = this.userService.list(condition,page); 
				if(rs == null || CollectionUtils.isEmpty(rs.getItems())){
					return;
				}
				
				for(User user : rs.getItems()){
					if(user.getSynchronousstatus() == 0){
						OpLogServiceWrapper.addUser(user.getId(), user.getSynctype(), user.getDomain());
					}
				}
			}
		} catch (Exception e) {
			logger.error("SyncToWxCp with user due to error.", e);
		}
	}

}
