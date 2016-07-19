package com.longtime.ajy.session;

import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.service.CheckBindStatusService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.support.SpringContextUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

public class SessionHelper {

    public static final String SEESION_USER   = "local_session_user";
    public static final String SEESION_TENANT = "local_session_tenant";

    public static final String SEESION_UID    = "uid";
    
    
    private static final String UNAME_UNKONW = "匿名";

    
    public static void flushDomain(HttpServletRequest request,HttpServletResponse response,String domain){
    	getCheckBindStatusService().remove(ReceiptHelper.getLoginSession().getUid(),ReceiptHelper.getLoginSession().getSid());
        ReceiptHelper  receiptHelper =  new ReceiptHelper(request, response);
        receiptHelper.flushDomain(domain);
       
        
    }
    public static  void flushOpenId(HttpServletRequest request,HttpServletResponse response,String openId){
        ReceiptHelper  receiptHelper =  new ReceiptHelper(request, response);
        receiptHelper.flushOpenId(openId);
    }
    
    public static  void flushExt(HttpServletRequest request,HttpServletResponse response,String ext){
        ReceiptHelper  receiptHelper =  new ReceiptHelper(request, response);
        receiptHelper.flushExt(ext);
    }
    
    public static LocalSession getLoginSession() {
        return ReceiptHelper.getThread();
    }

    public static String getCurrentUid() {
        return ReceiptHelper.getCurrentUid();
    }
    
    public static String getCurrentDomain(){
        return escapeDomain(ReceiptHelper.getCurrentDomain());
    }
    
    public static User  getCurrentUser(HttpServletRequest request){
        String uid = getCurrentUid();
        if(StringUtils.isBlank(uid)){
            return null;
        }
        return  getUserFromSession(request,uid);
    }
    
    public static User  getAndflushCurrentUser(HttpServletRequest request){
        String uid = getCurrentUid();
        if(StringUtils.isBlank(uid)){
            return null;
        }
        return  getUserFromSession(request,uid,true);
    }
    
    public static String getCurrentUname(HttpServletRequest request){
        LocalSession localSession = getLoginSession();
        if(null==localSession){
            return UNAME_UNKONW;
        }
        String uname = localSession.getUname();
        if(StringUtils.isBlank(uname)){
            User user = getCurrentUser(request);
            return (null==user )? UNAME_UNKONW:StringUtils.trimToEmpty(user.getName());
        }
        return uname;
    }
    
    public static void flushCurrentUser(HttpServletRequest request,User user){
        request.getSession().setAttribute(SEESION_USER, user);
    }
    
    public static void storeSession(HttpServletRequest request, HttpServletResponse response, LoginSession loginSession) {
        storeSession(request, response, loginSession, null);
     }

    public static void storeSession(HttpServletRequest request, HttpServletResponse response, LoginSession loginSession,String openId) {
       ReceiptHelper _receiptHelper = new ReceiptHelper(request, response);
        LocalSession _receipt = new LocalSession();
        _receipt.setSid(loginSession.getSid());
        _receipt.setDomain(loginSession.getDomain());
        _receipt.setLoginSession(loginSession);
        _receipt.setOpenId(openId);
        
        String remberme = request.getParameter("remberme");
        
        int cache_expire_seconds = CacheExpireTime.CACHE_MAX_AGE;
        int cookie_expire_seconds = CacheExpireTime.COOKIE_MAX_AGE;
        if("false".equalsIgnoreCase(remberme)){//选了false  缓存1天，cookie-1
        	cache_expire_seconds =  CacheExpireTime.CACHE_MIN_AGE;
        	cookie_expire_seconds = CacheExpireTime.COOKIE_MIN_AGE;
        }
        
        if(Contants.COOKIE_SESSION_NEVER_EXPIRES){ //会话永不过期
            
            cache_expire_seconds = Integer.MAX_VALUE;
            cookie_expire_seconds = Integer.MAX_VALUE;
        }
        
        _receiptHelper.store(_receipt, cookie_expire_seconds);
        getCheckBindStatusService().addCache(loginSession.getUid(),loginSession.getSid(), cache_expire_seconds);
    }
    
    private static final String TMP_UID = "tmp_uid";//临时用户uid
    public static void putTmpUid(HttpServletRequest request, HttpServletResponse response,String tmpUid){
    		HttpSession session = request.getSession();
    		session.setAttribute(TMP_UID, tmpUid);
    }
    
    public static String getTmpUid(HttpServletRequest request){
		HttpSession session = request.getSession();
		return (String) session.getAttribute(TMP_UID);
    }

    public static void removeSession(HttpServletRequest request, HttpServletResponse response) {
    	 getCheckBindStatusService().remove(ReceiptHelper.getLoginSession().getUid(),ReceiptHelper.getLoginSession().getSid());
        SessionHelper.destory(request);
        com.longtime.ajy.session.ReceiptHelper _receiptHelper = new com.longtime.ajy.session.ReceiptHelper(request,
                                                                                                           response);
        _receiptHelper.destory();
      
    }

    private static void destory(HttpServletRequest request) {
        request.getSession().invalidate();
    }
    
    private static User getUserFromSession(HttpServletRequest request,String uid){
        
        return getUserFromSession(request, uid, false);
    }
    
    
    private static User getUserFromSession(HttpServletRequest request,String uid,boolean isFlush){
        
        User user =  (User)request.getSession().getAttribute(SEESION_USER);
        
        if(!isFlush &&null!=user && StringUtils.equals(uid, user.getId())){
            return user;
        }
        // 数据库加载
        if(null==userService){
            userService  = (UserService) SpringContextUtil.getBean("userService");
        }
        user = userService.findOne(uid);
        if(null!=user){
            flushCurrentUser(request, user);
        }
        
        return user;    
    }


    private static CheckBindStatusService getCheckBindStatusService(){
    	  if(null==checkBindStatusService){
          	checkBindStatusService=(CheckBindStatusService) SpringContextUtil.getBean("checkBindStatusService");
          }
    	  return checkBindStatusService;
    }
     
     private static UserService userService;
     
     private static CheckBindStatusService checkBindStatusService;

     
     private static final String _pattern = "[^a-zA-Z_\\-0-9]";
     //将除 a-z A-Z 0-9  -_ 除外的字符去除
     public static String escapeDomain(String domainStr){
  	   
  	   if(StringUtils.isBlank(domainStr)){
  		   return StringUtils.EMPTY;
  	   }
  	   
  	  return domainStr.replaceAll(_pattern, "");
     }
}
