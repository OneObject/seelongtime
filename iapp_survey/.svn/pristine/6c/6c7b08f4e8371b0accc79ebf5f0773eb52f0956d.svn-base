package com.longtime.app.weixin.cp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import me.chanjar.weixin.cp.bean.WxCpDepart;
import me.chanjar.weixin.cp.bean.WxCpUser;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.longtime.ajy.support.QiniuHelper;
import com.longtime.ajy.support.service.WxCpAgentService;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AccountService;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.UserOrgService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.util.IdGenerator;
import com.longtime.app.weixin.cp.service.SyncFromWxCpService;
import com.telecom.ctu.platform.common.cache.CacheService;

@Service("syncFromWxCpService")
public class SyncFromWxCpServiceImpl implements SyncFromWxCpService{
	
	private static Logger logger = LoggerFactory.getLogger(SyncFromWxCpServiceImpl.class);
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "organizationService")
	private OrganizationService organizationService;
	
	@Resource(name = "tenantConfigService")
	private TenantConfigService tenantConfigService;
	
	@Resource(name = "tokenService")
	private ITokenService tokenService;
	
	@Resource(name = "userOrgService")
	private UserOrgService userOrgService;
	
	@Resource(name = "accountService")
	private AccountService accountService;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	private static final String DURING_SYNC_FROM_WXCP_KEY = "sfw_%s";
	
	@Override
	public void doSyncFromWxCp(String domain) {
		TokenInfo tokenInfo = tokenService.getTokenInfoByDomain(domain);
		if(tokenInfo != null && tokenInfo.isWXQY()){
			doSyncFromWxCp(tokenInfo);
		}
	}
	
	@Override
	public void doSyncFromWxCp(TokenInfo token){
		if(token == null) {
			return;
		}
		String domain = token.getDomain();
		TenantConfig tenantConfig = this.tenantConfigService.getByDomain(domain);
		if(tenantConfig == null || !tenantConfig.isSyncfromwx()){
			return;
		}
		
		String cacheKey = String.format(DURING_SYNC_FROM_WXCP_KEY, domain);
		String isDuring = cacheService.get(cacheKey);
		if("1".equals(isDuring)){
			return;
		}
		cacheService.put(cacheKey, EXPIRE_TIME, "1");
		try {
			syncOrg(domain);//同步企业号通讯录里的组织
			syncUser(domain);//同步企业号通讯里里的用户
		} finally {
			cacheService.remove(cacheKey);
		}
	}
	
	private static final int EXPIRE_TIME = 8*60*60;
	
	private String getCacheKey(String domain,Integer departId){
		return String.format("so_%s_%d", domain,departId);
	}

	private void syncOrg(String domain) {
		long start = System.currentTimeMillis();
		List<WxCpDepart> list = WxCpAgentService.orgGet(domain);
		if(CollectionUtils.isEmpty(list)){
			return;
		}
		List<String> oids = Lists.newArrayList();
		for (WxCpDepart wxCpDepart : list) {
			try {
				String name = wxCpDepart.getName();
				Integer order = wxCpDepart.getOrder();
				String parentId = getOid(wxCpDepart.getParentId(),domain);
				Organization org = this.organizationService.getByCpid(wxCpDepart.getId(),domain);
				
				if(org == null){
					org = this.organizationService.getByName(parentId,name);
				}
				
				if(org == null){
					org = new Organization();
				}
				org.setName(name);
				org.setOrders(order);
				org.setDomain(domain);
				org.setParentId(parentId);
				org.setCpid(wxCpDepart.getId());
				org.setSynchronousstatus(1);
				if(StringUtils.isBlank(org.getId())){
					org.setId(IdGenerator.nextId32().toString());
					this.organizationService.insert(org,parentId);
				} else {
					this.organizationService.update(org);
				}
				
				cacheService.put(getCacheKey(domain, wxCpDepart.getId()),EXPIRE_TIME, org.getId());
				oids.add(org.getId());
			} catch (Exception e) {
				logger.error(String.format("sync org due to error,the wxCpDepart=%s", wxCpDepart),e);
			}
		}
		
		if(CollectionUtils.isNotEmpty(oids)){
			this.organizationService.updateSyncronousstaus(oids,domain);
		}
		logger.debug(String.format("sync org num=%d,use time=%d", list.size(),(System.currentTimeMillis()-start)));
	}
	
	private void syncUser(String domain) {
		long start = System.currentTimeMillis();
		List<WxCpUser> list = WxCpAgentService.userList(domain);
		if(CollectionUtils.isEmpty(list)){
			return;
		}
		List<String> uids = Lists.newArrayList();
		for (WxCpUser wxCpUser : list) {
			try {
				User user = this.userService.findByUsername(wxCpUser.getUserId(), domain);
				if(user == null){
					user = new User();
				}
				
				String oldEmail = user.getEmail();
				String oldMobile = user.getMobile();
				
				user.setUsername(wxCpUser.getUserId());
				user.setName(wxCpUser.getName());
				user.setEmail(wxCpUser.getEmail());
				user.setMobile(wxCpUser.getMobile());
				int gender = 3;
				if("男".equals(wxCpUser.getGender())){
					gender = 1;
				} else if("女".equals(wxCpUser.getGender())){
					gender = 2;
				}
				user.setGender(gender);
				user.setDomain(domain);
				if(StringUtils.isBlank(user.getAvatar())){
					String wxAvatar = wxCpUser.getAvatar();
					if(StringUtils.isNotBlank(wxAvatar)){
						String avatar = QiniuHelper.uploadFormURL(wxAvatar);
						if(StringUtils.isNotBlank(avatar)){
							user.setAvatar(avatar);
						}
					}
				}
				
				Integer status = wxCpUser.getStatus();
				if(status == null || status == 4){//未关注
					user.setAttentionstatus(4);
				} else if(status == 1){//已关注
					user.setAttentionstatus(2);
				} else if(status == 2){//已冻结
					user.setAttentionstatus(-2);
					user.setEnable(0);
				}
				
				user.setSynchronousstatus(1);
				
				List<String> oids = getOids(wxCpUser.getDepartIds(),domain);
				if(CollectionUtils.isNotEmpty(oids)){
					Organization org = new Organization();
					org.setId(oids.get(0));
					user.setOrganization(org);
				}
				
				if(StringUtils.isBlank(user.getId())){
					user.setId(IdGenerator.nextId32().toString());
					this.userService.insert(user);
				} else {
					userService.update(user);
				}
				
				this.accountService.updateAccount(user,oldEmail,oldMobile);
				
				this.userOrgService.updateUserOrg(user.getId(),oids);
				uids.add(user.getId());
				if(uids.size()%100==0){
					logger.debug(String.format("uids.size=%d",uids.size()));
				}
			} catch (Exception e) {
				logger.error(String.format("sync user due to error,the wxcpuser=%s", wxCpUser),e);
			}
		}
		
		if(CollectionUtils.isNotEmpty(uids)){
			this.userService.updateSyncronousstaus(uids,domain);
		}
		
		logger.debug(String.format("sync user num=%d,use time=%d", list.size(),(System.currentTimeMillis()-start)));
	}
	
	private String getOid(Integer departId,String domain) {
		return cacheService.get(getCacheKey(domain, departId));
	}

	private List<String> getOids(Integer[] departIds,String domain) {
		List<String> oids = Lists.newArrayList();
		for (Integer departId : departIds) {
			String oid = getOid(departId, domain);
			if(StringUtils.isNotBlank(oid)){
				oids.add(oid);
			}
		}
		return oids;
	}
}
