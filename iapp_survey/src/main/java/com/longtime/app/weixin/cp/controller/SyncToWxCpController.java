//package com.longtime.app.weixin.cp.controller;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.commons.collections.CollectionUtils;
//import org.apache.commons.lang3.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.google.common.base.Joiner;
//import com.google.common.collect.Lists;
//import com.google.common.collect.Maps;
//import com.longtime.ajy.support.service.NotifySenderWrapper;
//import com.longtime.ajy.support.service.WxCpAgentService;
//import com.longtime.app.base.model.NotifyConfig;
//import com.longtime.app.base.model.Organization;
//import com.longtime.app.base.model.TenantConfig;
//import com.longtime.app.base.model.User;
//import com.longtime.app.base.service.AccountService;
//import com.longtime.app.base.service.NotifyConfigService;
//import com.longtime.app.base.service.OrganizationService;
//import com.longtime.app.base.service.TenantConfigService;
//import com.longtime.app.base.service.UserService;
//import com.longtime.app.base.util.Constant;
//import com.longtime.app.ixin.mgr.model.TokenInfo;
//import com.longtime.app.ixin.mgr.service.ITokenService;
//import com.longtime.app.oplog.listener.OpLogHandle;
//import com.longtime.app.oplog.model.OpLog;
//import com.longtime.app.oplog.service.OpLogService;
//import com.longtime.app.weixin.cp.service.SyncToWxCpService;
//import com.longtime.common.utils.LoginSessionHelper;
//import com.longtime.common.utils.Page;
//import com.longtime.message.model.NotifyBody;
//import com.longtime.message.util.Constants;
//import com.longtime.message.util.NotifyType;
//import com.telecom.ctu.platform.common.cache.CacheService;
//
//import me.chanjar.weixin.cp.bean.WxCpUser;
//
//@Controller("syncToWxCpController")
//@RequestMapping("/mgr/wx/cp")
//public class SyncToWxCpController {
//	
//	private Logger logger = LoggerFactory.getLogger(SyncToWxCpController.class);
//	
//	private static final String DURING_SYNC_TO_WXCP_KEY = "stw_%s";
//	private static final int EXPIRE_TIME = 8*60*60;
//	
//	/**
//	 * 将爱加油系统内的组织、用户同步至微信企业号内
//	 */
//	@RequestMapping("synctocp")
//	@ResponseBody
//	public String SyncToWxCp(HttpServletRequest request){
//		final String domain = LoginSessionHelper.getCurrentDomain(request);
//		new Thread(new Runnable() {
//			@Override
//			public void run() {
//				doSyncToWxCp(domain);
//			}
//		}).start();
//		return "success";
//	}
//	
//	public void doSyncToWxCp(String domain) {
//		
//		TokenInfo tokenInfo = this.tokenService.getTokenInfoByDomain(domain);
//		if(tokenInfo == null || !tokenInfo.isWXQY()){
//			return;
//		}
//		
//		TenantConfig config = this.tenantConfigService.getByDomain(domain);
//		if(config == null || !config.isIsautosyn()){
//			return;
//		}
//		
//		String cacheKey = String.format(DURING_SYNC_TO_WXCP_KEY, domain);
//		String isDuring = cacheService.get(cacheKey);
//		if("1".equals(isDuring)){
//			return;
//		}
//		cacheService.put(cacheKey, EXPIRE_TIME, "1");
//		
//		try {
//			for(int i=1;;i++){
//				Page page = new Page(i, 100);
//				List<OpLog> opLogs = this.opLogService.getNeedSyncList(domain,page);
//				if(CollectionUtils.isEmpty(opLogs)){
//					return;
//				}
//				
//				for(OpLog opLog : opLogs){
//					opLogHandle.processFromTask(opLog);
//				}
//			}
//		} catch (Exception e) {
//			logger.error("SyncToWxCp from oplog due to error.", e);
//		} finally {
//			cacheService.remove(cacheKey);
//		}
//	}
//	
//	/**
//	 * 将爱加油系统内的组织、用户同步至微信企业号内
//	 */
//	@RequestMapping("removeallorg")
//	@ResponseBody
//	public String removeAllOrg(HttpServletRequest request){
//		final String domain = LoginSessionHelper.getCurrentDomain(request);
//		new Thread(new Runnable() {
//			@Override
//			public void run() {
//				logger.info(String.format("remove all wx org by domain=%s", domain));
//				updateUserOrg(domain);
//				removeOrg(domain);
//			}
//
//			private void updateUserOrg(String domain) {
//				logger.info("update user org");
//				List<WxCpUser> users = WxCpAgentService.userList(domain);
//				if(CollectionUtils.isEmpty(users)){
//					return;
//				}
//				Integer[] departIds = {1};
//				for(WxCpUser user : users){
//					user.setDepartIds(departIds);
//					WxCpAgentService.userUpdate(user,domain);
//				}
//				logger.info("update user org success");
//			}
//			
//			private void removeOrg(String domain) {
//				logger.info("remove org");
//				int num=0;
//				for(int i=15;i>1;i--){
//					Map<String, Object> params = Maps.newHashMap();
//					params.put("domain", domain);
//					params.put("depth", i);
//					params.put("isdel", 0);
//					List<Organization> orgs = organizationService.list(params);
//					if(CollectionUtils.isEmpty(orgs)){
//						continue;
//					}
//					for(Organization org : orgs){
//						WxCpAgentService.orgDelete(org.getCpid(), domain);
//						num++;
//						logger.info(String.format("remove org name=%s,total=%d",org.getName(),num));
//					}
//				}
//				logger.info("remove org success");
//			}
//		}).start();
//		return "success";
//	}
//	
//	
//
//	/**
//	 * 将爱加油系统内的组织、用户同步至微信企业号内
//	 */
//	@RequestMapping("initsynctocp")
//	@ResponseBody
//	public String initSyncToWxCp(HttpServletRequest request){
//		final String domain = LoginSessionHelper.getCurrentDomain(request);
//		new Thread(new Runnable() {
//			@Override
//			public void run() {
//				logger.info(String.format("init sync to cp by domain=%s", domain));
//				syncToWxCpService.doInitSyncToWxCp(domain);
//			}
//		}).start();
//		return "success";
//	}
//	
//	@RequestMapping("signremain")
//	@ResponseBody
//	public String signRemaid(HttpServletRequest request){
//		List<NotifyConfig> notifyConfigs = this.notifyConfigService.getOpensByType(NotifyType.SIGNREMAIND);
//		for (NotifyConfig notifyConfig : notifyConfigs) {
//			try {
//				String domain = notifyConfig.getDomain();
//				if(StringUtils.isBlank(domain)){
//					continue;
//				}
//				
//				TenantConfig tenantConfig = tenantConfigService.getByDomain(domain);
//				if(tenantConfig == null || !tenantConfig.isSendnotify()){
//					continue;
//				}
//				Map<String, Object> params = Maps.newHashMap();
//				params.put("title", Constant.getSignRemaindTitle());
//				params.put("content", Constant.getSignRemaindContent());
//				params.put("pic", Constant.getSignRemaindPic());
//				
//				List<String> list = accountService.getRecentlyNoAccessUsers(notifyConfig.getRemaindperiod(),domain);
//				if(CollectionUtils.isEmpty(list)){
//					continue;
//				}
//				int size = list.size();
//				int count = (size%1000 == 0) ? size/1000 : (size/1000+1);
//				for(int i=0;i<count;i++){
//					List<String> sendUids = getPartList(list,i);
//					String uids = Joiner.on(",").join(sendUids);
//					NotifyBody notifyBody = new NotifyBody(NotifyType.SIGNREMAIND, uids, null,domain ,params);
//					NotifySenderWrapper.send(notifyBody);
//				}
//				String uids = Joiner.on(",").join(list);
//				NotifyBody notifyBody = new NotifyBody(NotifyType.SIGNREMAIND, uids, null,domain ,params);
//				NotifySenderWrapper.send(notifyBody);
//			} catch (Exception e) {
//				logger.error(String.format("send sign remaind notify due to error,notifyconfig=%s", notifyConfig),e);
//			}
//		}
//		
//		logger.debug("send sign remaind notify success");
//		return "success";
//	}
//	
//	private List<String> getPartList(List<String> uids, int i) {
//		int fromIndex = i*1000;
//		if(fromIndex > uids.size()){
//			return Lists.newArrayList();
//		}
//		
//		int toIndex = (i+1)*1000;
//		if(toIndex > uids.size()){
//			toIndex = uids.size();
//		}
//		List<String> partList = uids.subList(fromIndex, toIndex);
//		return partList;
//	}
//	
//	/**
//	 * 推送积分排行榜
//	 */
//	@RequestMapping("creditrank")
//	@ResponseBody
//	public String creditRank(HttpServletRequest request){
//		Map<String, Object> params = Maps.newHashMap();
//		params.put("title", Constant.getCreditRankTitle());
//		params.put("content", Constant.getCreditRankContent());
//		params.put("pic", Constant.getCreditRankPic());
//		
//		NotifyBody notifyBody = new NotifyBody(NotifyType.CREDITRANK, Constants.TOALL, null,Constant.DOMAIN_ROBAM ,params);
//		NotifySenderWrapper.send(notifyBody);
//		
//		logger.debug("send credit rank notify success");
//		return "success";
//	}
//	
//	@RequestMapping("courseuncomplete")
//	@ResponseBody
//	public String  courseUnComplete(HttpServletRequest request){
//		String domain = Constant.DOMAIN_ROBAM;
//		List<User> users = this.userService.listByDomain(domain);
//		if(CollectionUtils.isEmpty(users)){
//			return "empty";
//		}
//		
//		logger.debug(String.format("users.size=%d", users.size()));
//		
//		for(User user : users){
//			
//		}
//		return "success";
//	}
//	
//	@Resource(name = "opLogService")
//	private OpLogService opLogService;
//
//	@Resource(name = "tokenService")
//	private ITokenService tokenService;
//	
//	@Resource(name = "opLogHandle")
//	private OpLogHandle opLogHandle;
//	
//	@Resource(name = "organizationService")
//	private OrganizationService organizationService;
//	
//	@Resource(name = "lt.cacheService")
//	private CacheService cacheService;
//	
//	@Resource(name = "syncToWxCpService")
//	private SyncToWxCpService syncToWxCpService;
//	
//	@Resource
//	private TenantConfigService tenantConfigService;
//	
//	@Resource
//	private NotifyConfigService notifyConfigService;
//	
//	@Resource
//	private AccountService accountService;
//	
//	@Resource
//	private UserService userService;
//	
//}
