package com.longtime.common.web.utils;


import com.google.common.collect.Lists;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.AclService;
import com.longtime.common.spring.SpringContextUtil;
import com.longtime.common.utils.LoginSessionHelper;
import com.telecom.ctu.platform.common.cache.CacheService;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

public class AclHelper {
	
	//private static Logger      logger       = LoggerFactory.getLogger(AclHelper.class);
    
    public static CacheService cacheService;
    
    public static AclService aclService;

    private static AtomicBoolean init = new AtomicBoolean(false);
    
    public static String DOMAIN_ACL_KEY = "domain_acl_%s";
    
    public static String USER_ACL_KEY = "user_acl_%s";
    
    public static int expire_seconds = 24*60*60*1000;
    
    private static void init() {
    	
    	if (init.get()) {
			return;
		}
		synchronized (init) {
			if (init.get()) {
				return;
			}
			if(null == cacheService){
	        	cacheService = (CacheService) SpringContextUtil.getBean("lt.cacheService");
	        }
	        
	        if (null == aclService) {
				aclService = (AclService)SpringContextUtil.getBean("aclService");
			}
	        
			init.set(true);
		}
		
    }
    
    
    
  
    
    
    /**
     * 获取当前域下白名单  白名单=公开资源+该域下特定的资源
     * @param request
     * @return
     */
    public static List<Long> getDomainAclList(HttpServletRequest request){
    		
		return getDomainAclList(request,false);
    }
    
    private static List<Long> getDomainAclList(HttpServletRequest request,boolean refresh){
		init();
    	String domain = LoginSessionHelper.getCurrentDomain(request);
    	
    	List<Long> domainAclList = Lists.newArrayList();
    	
    	List<Long> list = cacheService.get(String.format(DOMAIN_ACL_KEY, domain));
    	
    	if (refresh || CollectionUtils.isEmpty(list)) {
    		
    		//获取白名单 0:菜单资源  1：按钮
    		domainAclList = aclService.getDomainResource(domain,null);
    		
    		cacheService.put(String.format(DOMAIN_ACL_KEY, domain),expire_seconds, domainAclList);
    		
		}else {
			for (Long id : list) {
				domainAclList.add(Long.valueOf(id));
			}
		}
    	
    	return domainAclList;
    }
    
    
    /**
     * 获取当前用户可访问的资源
     * @param request
     * @return
     */
    public static List<Long> getUserAclList(HttpServletRequest request){
    	
		return getUserAclList(request,false);
    }
    
    
    /**
     * 获取当前用户可访问的资源
     * @param request
     * @return
     */
    private static List<Long> getUserAclList(HttpServletRequest request,boolean refresh){
    	
		init();
			
    	String domain = LoginSessionHelper.getCurrentDomain(request);
    	
    	String uid = LoginSessionHelper.getCurrentUserId(request);
    	//String uid = "111";
    	
    	List<Long> UserAclList = Lists.newArrayList();
    	
    	List<Integer> list = cacheService.get(String.format(USER_ACL_KEY, uid));
    	
    	if ( refresh || CollectionUtils.isEmpty(list)) {
    		
    		//获取当前用户的资源 
    		UserAclList = aclService.getUserResourceIds(uid,domain);
    		
    		cacheService.put(String.format(USER_ACL_KEY, domain),expire_seconds, UserAclList);
    		
		}else {
			
			for (Integer id : list) {
				
				UserAclList.add(Long.valueOf(id));
				
			}
		}
    	
    	return UserAclList;
    }
    
    /**
     * 清除缓存中用户资源列表
     * @param request
     */
    /*
    public static void clearUserAclList(HttpServletRequest request){
		init();
    	String uid = LoginSessionHelper.getCurrentUserId(request);
			
    	cacheService.remove(String.format(USER_ACL_KEY, uid));
    		
    	
    }
    
    */
    
    /**
     * 清除缓存中域的资源列表
     * @param request
     */
    /*
    public static void clearDomainAclList(HttpServletRequest request){
		init();
		String domain = LoginSessionHelper.getCurrentDomain(request);
    	cacheService.remove(String.format(DOMAIN_ACL_KEY, domain));
    }
    */
    
    /**
     * 初始化用户资源列表
     */
    public static void initUserAclList(HttpServletRequest request){
    	
    	//清除缓存
    	//clearUserAclList(request);
    	//clearDomainAclList(request);
    	
    	//更新缓存
    	getUserAclList(request,true);
    	getDomainAclList(request,true);
    	
    	
    };
    
    
    /**
     * 校验当前域是否拥有该菜单资源的权限
     * @param ResourceId
     * @param request
     * @return
     */
    public static boolean checkMenuAclByResourceId(String ResourceId ,HttpServletRequest request){
    	
    	if (StringUtils.isBlank(ResourceId)) {
    		
			return true;
			
		}
		
		if(ResourceId.equals("null")){
			
		    return true;
		}
    	
    	List<Long> domainAclList = getDomainAclList(request);
    	
    	if (CollectionUtils.isEmpty(domainAclList)) {
    		
    		return false;
    		
		}
    	
    	if (domainAclList.contains(Long.valueOf(ResourceId))) {
    		
    		return true;
    		
    	}
    	
    	return false;
    	
    }


	/**
	 * 判断用户是否具备操作某个资源得权限
	 * @param superAdmin 
	 * 
	 */
	public static boolean isAccess(HttpServletRequest request, String id, boolean adminctl) {
		
	   
		if (StringUtils.isBlank(id)) {
			
			return true;
			
		}
		
		
		if(id.equals("null")){
			
		    return true;
		    
		}
		
		//判断用户类型，如果为type 为1 2 返回true
		int type = LoginSessionHelper.getCurrentUserType(request);
		//是否只是超级管理员可见
		if (adminctl) {
			System.err.println(1);
			if (User.checkIsSuperMgr(type) ) {
				return true;
			}else{
				return false;
			}
			
		}
		
		if ( User.checkIsSuperMgr(type)) {
			
			return true;
			
		}
		
		
		List<Long> userAclList = getUserAclList(request);
		
		if(CollectionUtils.isEmpty(userAclList)){
			
		    return false;
		    
		}
		
		if (userAclList.contains(Long.valueOf(id))) {
			
			return true;
			
		}
		
		
		return false;

	}
	
	
   

}
