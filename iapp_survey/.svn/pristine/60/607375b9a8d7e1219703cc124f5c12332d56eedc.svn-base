package com.longtime.app.weixin.cp.task;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.oplog.listener.OpLogHandle;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.app.oplog.service.OpLogService;
import com.longtime.common.utils.Page;
import com.telecom.ctu.platform.common.cache.CacheService;

/**
 * 从用户组织内查询未同步数据进行同步
 * @author longtime
 *
 */
@Component("syncToWxCpTask")
public class SyncToWxCpTask {
	
	private static Logger logger = LoggerFactory.getLogger(SyncToWxCpTask.class);

	@Resource
	private AccountService accountService;
	
	@Resource
	private UserService userService;
	
	private static final String DURING_SYNC_TO_WXCP_KEY = "stw_%s";
	private static final int EXPIRE_TIME = 8*60*60;
	
	public void execute(){
		logger.info("SyncToWxCpTask start");
		List<TokenInfo> list = this.tokenService.getTokenInfoByType("3");
		if(CollectionUtils.isEmpty(list)){
			return ;
		}
		for(TokenInfo token : list){
			doSyncToWxCp(token.getDomain());
		}
		
		logger.info("SyncToWxCpTask success");
	}
	
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
	
	@Resource(name = "tokenService")
	private ITokenService tokenService;
	
	@Resource(name = "opLogService")
	private OpLogService opLogService;

	@Resource(name = "opLogHandle")
	private OpLogHandle opLogHandle;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	@Resource
	private TenantConfigService tenantConfigService;
	
}
