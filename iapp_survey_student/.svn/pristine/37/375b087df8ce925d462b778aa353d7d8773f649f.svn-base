package com.longtime.ajy.mweb;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.longtime.ajy.model.Tenant;
import com.longtime.ajy.model.TenantConfig;
import com.longtime.ajy.model.User;
import com.longtime.ajy.model.vo.TenantInfo;
import com.longtime.ajy.mweb.model.TokenInfo;
import com.longtime.ajy.mweb.service.TokenInfoService;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.config.Constant;
import com.longtime.ajy.student.service.LoginService;
import com.longtime.ajy.student.service.TenantConfigService;
import com.longtime.ajy.student.service.TenantService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.SpringContextUtil;
import com.longtime.ajy.support.TemplateHelper;
import com.longtime.ajy.support.weixin.WeiXinAPIHelper;
import com.longtime.ajy.support.weixin.WxCpAgent;
import com.telecom.ctu.platform.common.cache.CacheService;

public class MwebHelper {
	
	private static Logger      logger       = LoggerFactory.getLogger(MwebHelper.class);
	
    
    public static UserService userService;
    
    public static TenantService tenantService; 
    
    public static CacheService cacheService;
    
    public static TenantConfigService tenantConfigService;
    
    
	public static TokenInfoService tokenInfoService;

    public static boolean                init = false;
    
    public static String TENANTINFO_CACEK_KEY = "ti_%s";
    
    private static ExecutorService            executorService = Executors.newFixedThreadPool(1);

    private static void init() {
        if(null==userService){
    		userService=(UserService) SpringContextUtil.getBean("userService");
    	}
        if(null==tenantService){
        	tenantService=(TenantService) SpringContextUtil.getBean("tenantService");
        }
        if(null == cacheService){
        	cacheService = (CacheService) SpringContextUtil.getBean("lt.cacheService");
        }
        if(null == tenantConfigService){
        	tenantConfigService = (TenantConfigService) SpringContextUtil.getBean("tenantConfigService");
        }
        
        if(null==tokenInfoService){
        	tokenInfoService = (TokenInfoService)SpringContextUtil.getBean("tokenInfoService");
        }
        init = true;
    }

    public static String getUidByOpenId(String openid, String domain) {
        if (!init) {
            init();
        }
        return "";//ixinUserService.doGetUid(openid, domain);
    }
    
    public static Tenant getTenant(HttpServletRequest request) {
    	 if (!init) {
             init();
         }
    	Tenant tenant = new Tenant();
    	HttpSession session = request.getSession();
    	tenant = (Tenant)session.getAttribute("tenant");
    	if (tenant==null) {
    		String domain = SessionHelper.getCurrentDomain();
    		tenant =  tenantService.findOne(domain);
    		if (tenant==null) {
    			return null;
    		}else {
    			session.setAttribute("tenant", tenant);
    			return tenant;
    		}
		}else{
			return tenant;
		}
   
    }


    public static TenantInfo getTenantInfo() {
        if (!init) {
            init();
        }
        String domain = getCurrentDomain();
        return cache.getUnchecked(domain);
    }


    public static TenantInfo getTenantInfo_bak() {
	   	if (!init) {
	        init();
	   	}
	   	String domain = getCurrentDomain();
	   	TenantInfo tenantInfo = cacheService.get(String.format(TENANTINFO_CACEK_KEY, domain));
	   	if(tenantInfo == null){
	   		tenantInfo = new TenantInfo();
	   		Tenant tenant =  tenantService.findOne(domain);
	   		assembleWithTenant(tenantInfo,tenant);
	   		
	   		TenantConfig tenantConfig = tenantConfigService.findOne(domain);
	   		assembleWithTenantConfig(tenantInfo,tenantConfig);
	   		
	   		cacheService.put(String.format(TENANTINFO_CACEK_KEY, domain), 24*60*60*1000, tenantInfo);
	   	}
	   	return tenantInfo;
   }



    //以下的代码暂时没有使用
    // 自动刷新的cache  在写入2 hours后刷新key的值
    public static LoadingCache<String, TenantInfo> cache = CacheBuilder.newBuilder()
            .refreshAfterWrite(2, TimeUnit.HOURS).maximumSize(100)
            .build(new CacheLoader<String, TenantInfo>() {

                @Override
                public TenantInfo load(String key) throws Exception {
                    return get(key);
                }

                private TenantInfo get(String domain) {
                    TenantInfo  tenantInfo = new TenantInfo();
                    Tenant tenant =  tenantService.findOne(domain);
                    assembleWithTenant(tenantInfo,tenant);
                    TenantConfig tenantConfig = tenantConfigService.findOne(domain);
                    assembleWithTenantConfig(tenantInfo,tenantConfig);
                    return tenantInfo ;
                }
            });


    
    //素材是否支持分享
   public static boolean isFodderCanShare(String domain){
	   if(StringUtils.isBlank(domain)){
		   return false;
	   }
	   if (!init) {
           init();
       }
	   TenantConfig tenantConfig = tenantConfigService.findOne(domain);
	   return null!=tenantConfig && tenantConfig.isIsfoddershare();
   }
    
    
    public static TokenInfo getTokenInfo(){
    	if (!init) {
	        init();
	   	}
    	String domain = getCurrentDomain();
	   	
	   	return tokenInfoService.getByDomain(domain);
    	
    }
    public static TokenInfo getTokenInfo(String domain){
    	if (!init) {
	        init();
	   	}
    	if(StringUtils.isBlank(domain)){
    		return getTokenInfo();
    	}
	   	return tokenInfoService.getByDomain(domain);
    	
    }
    
    
    
	public static String getOpenIdByOauthCode(String code,String domain){
		if (!init) {
	        init();
	   	}
		boolean isQY = false;
		
		String appid = Constant.WX_AJY_APPID;
		String secret = Constant.WX_AJY_APPSECRET;
		
		TokenInfo tokenInfo = getTokenInfo(domain);
		if(null!=tokenInfo && tokenInfo.isOauth()){
			appid = StringUtils.isBlank(tokenInfo.getAppId())?appid:tokenInfo.getAppId();
			secret = StringUtils.isBlank(tokenInfo.getAppSecret())?secret:tokenInfo.getAppSecret();
			isQY = tokenInfo.isWXQY();
		}
		
		if(!isQY){ //公众号
			WeiXinAPIHelper.OAuthBaseInfo baseInfo = WeiXinAPIHelper.getOAuthBaseInfo(appid, secret, code);
			logger.debug("get oauth base info. data=[{}]", baseInfo);
			if(null==baseInfo){
				return null;
			}
			return baseInfo.getOpenid();
		}
		
		
		//企业号
		return  WxCpAgent.getOauthOpenId(code, tokenInfo);
		
	}
	
	
	
	public static boolean authSuccess2Validate4QY(String userId,String domain){
		if(StringUtils.isBlank(userId)){
			return false;
		}
		
		if (!init) {
	        init();
	   	}
		boolean isQY = false;
		
		TokenInfo tokenInfo = getTokenInfo(domain);
		if(null!=tokenInfo && tokenInfo.isOauth()){
			isQY = tokenInfo.isWXQY();
		}
		if(!isQY){ //公众号
			return false;
		}
		//企业号
		return  WxCpAgent.authSuccess2Validate(userId, tokenInfo);
		
	}
	
	
	
    private static void assembleWithTenantConfig(TenantInfo tenantInfo, TenantConfig tenantConfig) {
    	if(tenantConfig == null){
    		return;
    	}
    	
        tenantInfo.setIsopen(tenantConfig.isIsopen());
        tenantInfo.setOpenregister(tenantConfig.isOpenregister());
        tenantInfo.setShownavigation(tenantConfig.isShownavigation());
        tenantInfo.setSetting(tenantConfig.getSetting());
    	tenantInfo.setColor(tenantConfig.getColor());
    	tenantInfo.setIsfoddershare(tenantConfig.isIsfoddershare());
    	tenantInfo.setLogin_prompt(tenantConfig.getLogin_prompt());
    	tenantInfo.setIssingle(tenantConfig.isIssingle());
	}

	private static void assembleWithTenant(TenantInfo tenantInfo, Tenant tenant) {
		if(tenant == null){
			return;
		}
		
	    tenantInfo.setId(tenant.getId());
	    tenantInfo.setName(tenant.getName());
	    tenantInfo.setLogo(tenant.getLogo());
	    tenantInfo.setEnable(tenant.getEnable());
	    tenantInfo.setLogincover(tenant.getLogincover());
	}

	public static String getEnableUid(String openid, String domain) {
       String uid=getUidByOpenId(openid, domain);
       if(StringUtils.isNotBlank(uid)){
       	//判断账号是否被禁用
       	User user=userService.findOne(uid);
       	if(null!=user){
       		if(user.getEnable()==User.ENABLE_YES){
       			return uid;
       		}
       	}
       }
       return null;
    }
    
    
    public static String getUserOrTempUser(String openId,String domain){
        String uid=getUidByOpenId(openId, domain);
        
        if(StringUtils.isNotBlank(uid)){
            return uid;
        }
        
        // 创建临时用户 ，并绑定
        return doCreateTempUserAndBing(openId,domain);
    }
    
    
    public static void  setDopenId(final String openid,final String d_openid,final String domain){
        
    	logger.debug("update d_openid=[{}]  openid=[{}] domain=[{}]", d_openid,openid,domain);
        
        if(StringUtils.isBlank(openid) || StringUtils.isBlank(d_openid) || StringUtils.isBlank(domain)){
            return;
        }
        executorService.execute(new Runnable() {
            @Override
            public void run() {
//                ixinUserService.updateDopenId(openid, d_openid, domain);
            }
        });
    }
    
    private static String  doCreateTempUserAndBing(String openId,String domain){
     
       User tempUser =  userService.addCasulUser(domain);
       
       logger.debug("created temp user.domain=[{}] openid=[{}] uid=[{}]",domain, openId,tempUser.getId());
       try {
//        ixinUserService.doBind(openId, tempUser.getId(), domain, tempUser, null);
       } catch (Exception e) {
           logger.error(String.format("doCreateTempUserAndBing due to fail. openId=%s uid=%s", tempUser.getId()), e);
       }
       return tempUser.getId();
       
    }
    
    
    

    public static String getCurrentUid() {

        String uid = SessionHelper.getCurrentUid();
        
        if(StringUtils.isBlank(uid) && StringUtils.isNotBlank(getCurrentOpenId())){
        	uid= getUidByOpenId(getCurrentOpenId(),getCurrentDomain());
        }
        if (StringUtils.isBlank(uid)) {
        	logger.error("not found uid");
		}
        
        return StringUtils.isBlank(uid) ? DEFAULT_UID : uid;

    }

    public static String getCurrentOpenId() {

        return SessionHelper.getLoginSession() == null ? StringUtils.EMPTY : StringUtils.trimToEmpty(SessionHelper.getLoginSession().getOpenId());

    }
    
    public static String getCurrentExt() {

        return SessionHelper.getLoginSession() == null ? StringUtils.EMPTY : StringUtils.trimToEmpty(SessionHelper.getLoginSession().getExt());

    }

    public static String getCurrentDomain() {

        return SessionHelper.getCurrentDomain();
    }

    public static void flushCurrentDomain(HttpServletRequest request, HttpServletResponse response, String domain) {
        SessionHelper.flushDomain(request, response, domain);

    }

    public static void flushCurrentOpenId(HttpServletRequest request, HttpServletResponse response, String openId) {
        SessionHelper.flushOpenId(request, response, openId);
    }

   public static final String DEFAULT_UID = "test";
   
   
//   public static final String              M_LOGIN_PAGE          = "/m/plogin";
   public static final String              M_LOGIN_PAGE          = "/m/h5/login";

//   public static final String              WX_USER_BIND_PAGE     = "/m/wx_bind";
   public static final String              WX_USER_BIND_PAGE     = "/m/h5/bind";

   
   public static String getLoginView(String domain){
       if(StringUtils.isBlank(domain)){
           return M_LOGIN_PAGE;
       }
       String view = TemplateHelper.getView("m.login", domain);
       return StringUtils.isBlank(view)?M_LOGIN_PAGE:view;
       
   }
   
   public static String getLoginViewJSP(String domain){
       return String.format("/WEB-INF/views%s.jsp", getLoginView(domain));
   }
   
   
   public static String getLoginBindView(String domain){
       if(StringUtils.isBlank(domain)){
           return WX_USER_BIND_PAGE;
       }
       String view = "";//TemplateHelper.getView("m.loginbind", domain);
       return StringUtils.isBlank(view)?WX_USER_BIND_PAGE:view;
       
   }
   public static String getLoginBindViewJSP(String domain){
       return String.format("/WEB-INF/views%s.jsp", getLoginBindView(domain));
   }
   
   public static boolean  isFromWeiXinBrowser(HttpServletRequest request){
       String User_Agent = request.getHeader("User-Agent");  
       return  (StringUtils.isNotBlank(User_Agent) && User_Agent.toLowerCase().indexOf("micromessenger") != -1); 
   }
   
   
   public static boolean  isFromDingTalkBrowser(HttpServletRequest request){
       String User_Agent = request.getHeader("User-Agent");  
       return  (StringUtils.isNotBlank(User_Agent) && User_Agent.toLowerCase().indexOf("dingtalk") != -1); 
   }
   
   
   private static final String KEY_LOGINOUTSTATUS="loc";
   public static LoginService.Code getLogoutStatus(HttpServletRequest request){
	   LoginService.Code code = (LoginService.Code) request.getSession().getAttribute(KEY_LOGINOUTSTATUS);
	   request.getSession().removeAttribute(KEY_LOGINOUTSTATUS);
	   return code;
   }
   
   public static void setLogoutStatus(HttpServletRequest request,LoginService.Code code){
	   request.getSession().setAttribute(KEY_LOGINOUTSTATUS, code);
   }
   public static void setLogoutStatusInvalid(HttpServletRequest request){
	   request.getSession().setAttribute(KEY_LOGINOUTSTATUS, LoginService.Code.invalid);
   }
   
   public static String escapeDomain(String domainStr){
	  return SessionHelper.escapeDomain(domainStr);
   }

   public static boolean isExpired(HttpServletRequest request) {
		User user = SessionHelper.getCurrentUser(request);
		if(user == null){
			return false;
		}
		
		return user.isExpired();
	}
   
   /**
    * 判断是否是辅导员
    * @return
    */
   public static boolean isCoach(HttpServletRequest request){
	  User user = SessionHelper.getCurrentUser(request);
	  if(null==user){
	      return false;
	  }
	   return User.CATEGORY_EXPERT.equals(user.getCategory());
   }
   
   /**
    * 根据user对象判断是否是指导人
    * @param user
    * @return
    */
   public static boolean isCoach4User(User user){
	   if(null==user){
		   return false;
	   }
	   return User.CATEGORY_EXPERT.equals(user.getCategory());
   }
   
   /**
    * 根据category判断是否是指导人
    * @param user
    * @return
    */
   public static boolean isCoach4category(String category){
	   if(User.CATEGORY_EXPERT.equals(category)){
		   return true;
	   }
	   return false;
   }
   
   
   //是否是达人
   public static boolean isSuperMan(HttpServletRequest request){
       
       User user = SessionHelper.getCurrentUser(request);
       if(null==user){
           return false;
       }
        return isSuperMan(user.getCategory());
   }
   
   //是否是达人
   public static boolean isSuperMan(String category){
       
        return User.CATEGORY_SUPER.equals(category);
   }
   
   
   
   
   
   public static User getCurrentUser(HttpServletRequest request){
       return SessionHelper.getCurrentUser(request);
   }
   
   public static User getAndflushCurrentUser(HttpServletRequest request){
       return SessionHelper.getAndflushCurrentUser(request);
   }
   
}
