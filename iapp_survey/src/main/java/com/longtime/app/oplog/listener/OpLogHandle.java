package com.longtime.app.oplog.listener;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.longtime.ajy.support.service.WxCpAgentService;
import com.longtime.app.base.model.Organization;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.base.service.UserService;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.app.oplog.service.OpLogService;
import com.longtime.app.util.IdGenerator;

@Component("opLogHandle")
public class OpLogHandle {
	
	private static Logger logger = LoggerFactory.getLogger(OpLogHandle.class);

	@Resource(name = "opLogService")
	private OpLogService opLogService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "organizationService")
	private OrganizationService organizationService;
	
	@Resource(name = "tenantConfigService")
	private TenantConfigService tenantConfigService;
	
	
	public void process(OpLog opLog){
		if(opLog == null){
			return ;
		}
		TenantConfig tenantConfig = this.tenantConfigService.get(opLog.getDomain());
		if(tenantConfig != null && !tenantConfig.isIsautosyn()){//不开启同步
			if(StringUtils.isBlank(opLog.getId())){
				opLog.setId(IdGenerator.nextId32().toString());
				this.opLogService.insert(opLog);
			}
			return;
		}
		
		try{
			if(OpLog.TYPE_USER == opLog.getType()){//用户变更
				processUser(opLog);
			} else if(OpLog.TYPE_ORG == opLog.getType()){//组织变更
				processOrg(opLog);
			}
		}catch(Exception e){
			logger.error(String.format("oplog=%s", opLog), e);
		}
	}

	//用户
	private boolean processUser(OpLog opLog) {
		User user = this.userService.get(opLog.getSid());
		if(user == null){
			syncFail(opLog,"用户为空");
			return false;
		}
		boolean rs = false;
		switch (opLog.getAction()) {
		case 0://add
			rs = WxCpAgentService.userCreate(user);
			break;
		case 1://del
			rs = WxCpAgentService.userDelete(user.getUsername(), user.getDomain());
			break;
		case 2://update
			rs = WxCpAgentService.userUpdate(user);
			break;
		case 3://disabled
			rs = WxCpAgentService.userDisabled(user);
			break;
		case 4://invite
			//rs = WxCpAgentService.userInvite(user.getUsername(), user.getDomain());
			//break;
		    boolean[] newrs = WxCpAgentService.userInvite2(user.getUsername(), user.getDomain());
		    syncUserInviteResult(user,opLog,newrs);
		    return newrs[0];
		default:
			break;
		}
		
		syncUserResult(user,opLog,rs);
		return rs;
	}

	private void syncUserResult(User user, OpLog opLog, boolean rs) {
		if(rs){
			user.setSynchronousstatus(1);
			if(opLog.getAction() == 4){
				user.setAttentionstatus(1);
			}
			opLog.setSync(OpLog.SYNC_YES);
		} else {
			if(opLog.getAction() == 4){
				user.setAttentionstatus(-1);
			}else{
			    user.setSynchronousstatus(-1);
			}
			opLog.setSync(OpLog.SYNC_FAIL);
			opLog.setFailnum(opLog.getFailnum()+1);
		}
		this.userService.update(user);
		
		if(StringUtils.isBlank(opLog.getId())){
			opLog.setId(IdGenerator.nextId32().toString());
			opLogService.insert(opLog);
		} else {
			opLogService.update(opLog);
		}
	}
	
	
	private void syncUserInviteResult(User user, OpLog opLog, boolean[] rs) {
        
	    if(opLog.getAction() == 4){
    	    if(rs[0]){
    	        user.setAttentionstatus(1);
    	        if(rs[1]){
    	            user.setAttentionstatus(2); //已经关注
    	        }
    	    }else{
    	        user.setAttentionstatus(-1);
    	        opLog.setSync(OpLog.SYNC_FAIL);
                opLog.setFailnum(opLog.getFailnum()+1);
    	    }
	    
	    }
        this.userService.update(user);
        
        if(StringUtils.isBlank(opLog.getId())){
            opLog.setId(IdGenerator.nextId32().toString());
            opLogService.insert(opLog);
        } else {
            opLogService.update(opLog);
        }
    }

	private void syncFail(OpLog opLog, String remark) {
		try {
			opLog.setSync(OpLog.SYNC_FAIL);
			opLog.setFailnum(opLog.getFailnum()+1);
			opLog.setRemark(remark);
			if(StringUtils.isBlank(opLog.getId())){
				opLogService.insert(opLog);
			} else {
				opLogService.update(opLog);
			}
		} catch (Exception e) {
			logger.error(String.format("oplog=%s,the msg is:", opLog),e);
		}
	}

	//组织
	private boolean processOrg(OpLog opLog) {
		Organization org = this.organizationService.get(opLog.getSid());
		if(org == null || StringUtils.isBlank(org.getId())){
			syncFail(opLog,"组织为空");
			return false;
		}
		
		boolean rs = false;
		switch (opLog.getAction()) {
		case 0://add
			Integer parentId = getParentId(org.getParentId());
			if(parentId == null){
				break;
			}
			Integer cpid = WxCpAgentService.orgCreate(org,parentId);
			if(cpid != null){
				org.setCpid(cpid);
				rs = true;
			}
			break;
		case 1://del
			rs = WxCpAgentService.orgDelete(org.getCpid(), org.getDomain());
			break;
		case 2://update
			parentId = getParentId(org.getParentId());
			if(parentId == null){
				break;
			}
			rs = WxCpAgentService.orgUpdate(org,parentId);
			break;
		default:
			break;
		}
		
		syncOrgResult(org,opLog,rs);
		return rs;
	}

	
	private void syncOrgResult(Organization org, OpLog opLog, boolean rs) {
		if(rs){
			org.setSynchronousstatus(1);
			opLog.setSync(OpLog.SYNC_YES);
		} else {
			org.setSynchronousstatus(-1);
			opLog.setSync(OpLog.SYNC_FAIL);
			opLog.setFailnum(opLog.getFailnum()+1);
		}
		this.organizationService.update(org);
		
		if(StringUtils.isBlank(opLog.getId())){
			opLog.setId(IdGenerator.nextId32().toString());
			opLogService.insert(opLog);
		} else {
			opLogService.update(opLog);
		}
	}

	private Integer getParentId(String parentId) {
		if(StringUtils.isBlank(parentId) || parentId.startsWith("domain_")){
			return 1;
		}
		Organization org = organizationService.get(parentId);
		if(org != null){
			return org.getCpid();
		}
		return null;
	}

	public void processFromTask(OpLog opLog) {
		try {
			if(OpLog.TYPE_USER == opLog.getType()){//用户变更
				processUser(opLog);
			} else if(OpLog.TYPE_ORG == opLog.getType()){//组织变更
				processOrg(opLog);
			}
		} catch (Exception e) {
			logger.error(String.format("processFromTask due to error,the opLog is %s", opLog.toString()), e);
		}
	}
	
}
