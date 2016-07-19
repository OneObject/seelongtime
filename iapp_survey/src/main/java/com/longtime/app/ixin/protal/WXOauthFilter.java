package com.longtime.app.ixin.protal;

import com.google.common.base.Joiner;
import com.google.common.base.Joiner.MapJoiner;
import com.google.common.base.Splitter;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.Maps;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.ajy.support.service.WxCpAgentService;
import com.longtime.app.base.model.TenantConfig;
import com.longtime.app.base.service.TenantConfigService;
import com.longtime.app.config.Constants;
import com.longtime.app.ixin.api.WeiXinAPIHelper;
import com.longtime.app.ixin.mgr.model.TokenInfo;
import com.longtime.app.ixin.mgr.service.ITokenService;
import com.longtime.app.ixin.mgr.service.IXinUserService;
import com.longtime.common.spring.SpringContextUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class WXOauthFilter implements Filter {
	private static final Logger logger = LoggerFactory.getLogger(WXOauthFilter.class);
    
    
	public static final String DOMAIN_DEFAULT = "ajy";
	
	public static final String WX_OAUTH_FAIL_PAGE = "/error/wx_oauth_error.jsp";
	
	public static final String WX_OAUTH_REDIRECT_URL = "/wx_oauth_redirect.jsp";

	public static final String PARAM_NAME_EXCLUSIONS = "exclusions";
	
	//public static final  String USER_OPENID_KEY_PREIX = "m_openid_";
	
	public static  String COOKIE_KEY_DOMAIN=Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constants.COOKIE_KEY_PREFIX), "lt.domain");//"lt.domain";
    
	public static  String COOKIE_KEY_OPNEID = Joiner.on(".").skipNulls().join(StringUtils.trimToNull(Constants.COOKIE_KEY_PREFIX),"lt.openid");
	
	//public static final String USER_DOMAIN = "lt_m_domain";
    
	
	public static final String COOKIE_PATH = "/";
	    
	private static final int COOKIE_MAX_AGE = 60 * 60 * 24 * 7;//7天   //1天 60*60*24 秒 ;// -1;

	private static final String cookie_domain = Constants.COOKIE_DOMAIN;
	
	public static  String ajy_app_id ;
	public static  String ajy_app_secret;
	
	private Set<String> excludesPattern;
	
	

	@Override
	public void init(FilterConfig config) throws ServletException {
		String exclusions = config.getInitParameter(PARAM_NAME_EXCLUSIONS);
		if (exclusions != null && exclusions.trim().length() != 0) {
			excludesPattern = new HashSet<String>(Arrays.asList(exclusions.split("\\s*,\\s*")));
		}
		
		ajy_app_id = Constants.WX_AJY_APPID;
        ajy_app_secret = Constants.WX_AJY_APPSECRET;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException,
			ServletException {

		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		if (logger.isDebugEnabled()) {
            logger.debug("request url=[{}]",HttpServletHelper.getCurrentUrl(request));
            Cookie[] cookies = request.getCookies();
            if (null != cookies) {
                for (Cookie cookie : cookies) {
                    logger.debug("cookie:{}={}", cookie.getName(), cookie.getValue());
                }
            }
        }
		 
		
		if (isExclusion(request)) {
			chain.doFilter(request, response);
			return;
		}
		
		
		String  domain = request.getParameter("fdomain");
		 if(StringUtils.isNotBlank(domain)){// 刷新domain
			 Util.setCurrentDomain(response, domain);
		 }else{
			 domain = Util.getCurrentDomain(request);
		 }
		
		if(StringUtils.isBlank(domain) ){
			domain = request.getParameter("domain");
			if(StringUtils.isBlank(domain)){
				domain = DOMAIN_DEFAULT;
			}
			//response.sendRedirect(request.getContextPath() + WX_OAUTH_FAIL_PAGE);
			//return ;
		}
		String openId = Util.getCurrentUserOpenIdFromCookie(request,domain);
//		String openId = "1";
		if(StringUtils.isBlank(openId)  && isFromWeiXinBrowser(request)){
			redirectToWXOauth(request, response,domain);			
			return ;
		}
		
		
		//设置openId 和domain 参数
		
		@SuppressWarnings("unchecked")
		Map<String,String[] > m = request.getParameterMap();
		
		m = Maps.newHashMap(m);
		m.put("openId", new  String[]{openId});
		m.put("openid", new  String[]{openId});
		m.put("domain", new  String[]{domain});
		
		request = new ParameterRequestWrapper(request, m);
		logger.debug("domain=[{}] openid=[{}]",domain, openId);
		
	
if(true){
	chain.doFilter(request,response);
	return;
}
		
//======================================================================	
		
		/*
		 * 站点是否开放
		 */
				
		
		 //获取domain 的config
		boolean  isOpen = isOpen(domain, request);
		logger.debug("filter site is open. result=[{}]",isOpen);
		if(isOpen){
			chain.doFilter(request,response); 	
			
			return ;
		}
				
		
		
		// 获取是否绑定
		String uid = getUid(openId,domain);
		if(StringUtils.isBlank(uid)){
			response.sendRedirect(String.format("%s%s?domain=%s&openid=%s", Constants.STUDENT_WEB_ROOT,"m/wx_bind.xhtml",domain,openId));
			return ;
		}
		
//======================================================================		
		
		
		
		
		chain.doFilter(request,response);

	}

	private void redirectToWXOauth(HttpServletRequest request, HttpServletResponse response,String domain) throws IOException {
		
		
		String appid = ajy_app_id;
		
		
		// 根据domain 获取 oauth 的appid 
        TokenInfo tokenInfo = getTokenInfo(domain);
        if(null!=tokenInfo){
        	
        	if(tokenInfo.isOauth() && StringUtils.isNotBlank(tokenInfo.getAppId())){
        		appid = tokenInfo.getAppId();
        	}
        }
		
		String callback = String.format("%s?%s",request.getRequestURL().toString() ,request.getQueryString());
		logger.debug("current url=[{}]", callback);
		
		callback = URLEncoder.encode(callback, "utf-8");
		
		// 获取 http://test.aijiayou.com/iapp
		StringBuffer url = request.getRequestURL();  
		String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append(request.getContextPath()).toString();
		
		
		String redirectUrl = String.format("%s%s?callback=%s&domain=%s",tempContextUrl, WX_OAUTH_REDIRECT_URL,callback,domain);
		logger.debug("redirect_url url=[{}]", redirectUrl);
		
		String toUrl = WeiXinAPIHelper.createOauthURL(appid, redirectUrl, WeiXinAPIHelper.OAUTH_CODE_BASEINFO, generateState());
		
		logger.debug("oauth url=[{}]", toUrl);
		response.sendRedirect(toUrl);
	}

	public boolean isExclusion(HttpServletRequest request) {
		if (excludesPattern == null) {
			return false;
		}
		String url = request.getServletPath();
		for (String pattern : excludesPattern) {
			Pattern p = Pattern.compile("^" + pattern);
			Matcher m = p.matcher(url);
			if (m.find()) {
				return true;
			}
		}

		return false;
	}

	@Override
	public void destroy() {

	}
	
	
	public String generateState(){
		return "oauth";
	}
	
    public static String getCookieDomain(){
        return StringUtils.isBlank(cookie_domain) ? null:cookie_domain;
    }
	
	
	
	
	private static MapJoiner queryStringMapJoiner = Joiner.on("&").withKeyValueSeparator("=");  
	public static String replaceQueryString(String queryString,String key,String value){
		Map<String,String> myMap = Splitter.on("&").trimResults().withKeyValueSeparator("=").split(queryString);
		myMap =Maps.newHashMap(myMap);
		myMap.put(key, value);
		return queryStringMapJoiner.join(myMap);
	}

	public static void main(String[] args) {
		
		String str1 = WXOauthFilter.replaceQueryString("a=1&b=2&c=3", "a", "4");
		
		System.out.println(str1);
		
		String str2 = WXOauthFilter.replaceQueryString("a=1&b=2&c=3", "d", "4");
		
		System.out.println(str2);
	}
	
	
	
	public static class ParameterRequestWrapper extends HttpServletRequestWrapper {

		private Map<String, String[]> params;

		public ParameterRequestWrapper(HttpServletRequest request,
				Map<String, String[]> m) {
			super(request);
			
			this.params = m;

			// RequestDispatcher.forward parameter
			renewParameterMap(request);
		}

		@Override
		public String getParameter(String name) {
			String result = "";
			
			Object v = params.get(name);
			if (v == null) {
				result = null;
			} else if (v instanceof String[]) {
				String[] strArr = (String[]) v;
				if (strArr.length > 0) {
					result =  strArr[0];
				} else {
					result = null;
				}
			} else if (v instanceof String) {
				result = (String) v;
			} else {
				result =  v.toString();
			}
			
			return result;
		}

		@Override
		public Map<String, String[]> getParameterMap() {
			return params;
		}

		@Override
		public Enumeration getParameterNames() {
			return new Vector(params.keySet()).elements();
		}

		@Override
		public String[] getParameterValues(String name) {
			String[] result = null;
			
			Object v = params.get(name);
			if (v == null) {
				result =  null;
			} else if (v instanceof String[]) {
				result =  (String[]) v;
			} else if (v instanceof String) {
				result =  new String[] { (String) v };
			} else {
				result =  new String[] { v.toString() };
			}
			
			return result;
		}

		private void renewParameterMap(HttpServletRequest req) {

			String queryString = req.getQueryString();

			if (queryString != null && queryString.trim().length() > 0) {
				String[] params = queryString.split("&");

				for (int i = 0; i < params.length; i++) {
					int splitIndex = params[i].indexOf("=");
					if (splitIndex == -1) {
						continue;
					}
					
					String key = params[i].substring(0, splitIndex);

					if (!this.params.containsKey(key)) {
						if (splitIndex < params[i].length()) {
							String value = params[i].substring(splitIndex + 1);
							this.params.put(key, new String[] { value });
						}
					}
				}
			}
		}

	}
	
	public static class Util{
			
		
		public static String  getCurrentUserOpenIdFromCookie(HttpServletRequest request){
			
			String domain = getCurrentDomain(request);
			
			if(StringUtils.isBlank(domain)){
				return StringUtils.EMPTY;
			}
			return getCurrentUserOpenIdFromCookie(request,domain);
			
		}
		public static String getCurrentUserOpenIdFromCookie(HttpServletRequest request,String domain){
			String key = COOKIE_KEY_OPNEID;
			return HttpServletHelper.getCookie(request, key);
		}
		
		public static String getCurrentDomain(HttpServletRequest request){
			
			String key = COOKIE_KEY_DOMAIN;
			
			return HttpServletHelper.getCookie(request, key);
		}
		
		public static void setCurrentDomain(HttpServletResponse response,String domain){
			Cookie cookie = new Cookie(COOKIE_KEY_DOMAIN,domain); 
			cookie.setMaxAge(COOKIE_MAX_AGE);  
			cookie.setPath(COOKIE_PATH);
			if(StringUtils.isNotBlank(getCookieDomain())){
				cookie.setDomain(getCookieDomain());
			}
			response.addCookie(cookie);
		}
		
		
		public static void  setCurrentUserOpenIdToCookie(HttpServletResponse response,String domain,String openid){
			String key = COOKIE_KEY_OPNEID;
			Cookie cookie = new Cookie(key,openid); 
			cookie.setMaxAge(COOKIE_MAX_AGE);  
			cookie.setPath(COOKIE_PATH);
			if(StringUtils.isNotBlank(getCookieDomain())){
				cookie.setDomain(getCookieDomain());
			}
			response.addCookie(cookie);
		}
		
		
		
		public static String getOpenIdByOauthCode(String code,String domain){
			
			boolean isQY = false;
			
			String appid = ajy_app_id;
			String secret = ajy_app_secret;
			
			TokenInfo tokenInfo = WXOauthFilter.getTokenInfo(domain);
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
			return  WxCpAgentService.getOauthOpenId(code, tokenInfo);
			
		}
		
		
		
	}

	
	
	 // 自动刷新的cache  在写入 1 hours后刷新key的值  
    public static LoadingCache<String, TenantConfig> cache = CacheBuilder.newBuilder()
            .refreshAfterWrite(1, TimeUnit.SECONDS).maximumSize(100)  
            .build(new CacheLoader<String, TenantConfig>() {

                @Override
                public TenantConfig load(String key) throws Exception {
                    return getIsOpen(key);
                }

                private TenantConfig getIsOpen(String key) {
                    if(tenantConfigService==null){
                        tenantConfigService = (TenantConfigService) SpringContextUtil.getBean("tenantConfigService");
                    }
                    TenantConfig tenatConfig =  tenantConfigService.getByDomain(key);
                    logger.debug("get tenant config from db. data=[]", tenatConfig);
                    return tenatConfig ==null? new TenantConfig(): tenatConfig;
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
    
   public String getUid(String openId,String domain){
	   if(null==iXinUserService){
		   iXinUserService = (IXinUserService) SpringContextUtil.getBean("iXinUserService");
	   }
	   return  iXinUserService.getUid(openId, domain);	   
   }
    private static TenantConfigService tenantConfigService;
    
    private static IXinUserService iXinUserService;
    
    private static ITokenService  tokenService;
    
    
    private static TokenInfo  getTokenInfo(String domain){
    	if(tokenService == null){
    		tokenService = (ITokenService) SpringContextUtil.getBean("tokenService");
    	}
    	
    	return 	tokenService.getTokenInfoByDomain(domain);
    	
    }
    
    private boolean  isFromWeiXinBrowser(HttpServletRequest request){
        String User_Agent = request.getHeader("User-Agent");  
        return  (StringUtils.isNotBlank(User_Agent) && User_Agent.toLowerCase().indexOf("micromessenger") != -1); 
    }

}
