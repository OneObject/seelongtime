package com.longtime.ajy.session;

import com.longtime.ajy.mweb.MwebHelper;
import com.longtime.ajy.mweb.service.CheckBindStatusService;
import com.longtime.ajy.student.config.Constant;
import com.longtime.ajy.support.SpringContextUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ReceiptHelper {

    private static Logger                          logger     = LoggerFactory.getLogger(ReceiptHelper.class);
    private static final ThreadLocal<LocalSession> tl_receipt = new InheritableThreadLocal<LocalSession>();
    
    private CheckBindStatusService checkBindStatusService;
    
    public static LocalSession getThread() {
        return tl_receipt.get();
    }

    private static void setThread(LocalSession _localSession) {
        tl_receipt.set(_localSession);
    }

    protected static void clearThread() {
        tl_receipt.remove();
    }

    public ReceiptHelper(HttpServletRequest request, HttpServletResponse response){
        this.request = request;
        this.response = response;
    }

    private final HttpServletRequest  request;

    private final HttpServletResponse response;

    protected LocalSession retrieve() {

        /* 优先从threadlocal获取 */
        LocalSession receipt = getThread();

        if (receipt != null) {
            return receipt;
        }

        try {

            CookieReceipt cookieReceipt = new CookieReceipt(request, response);
            receipt = cookieReceipt.retrive();
            return receipt;

        } finally {
            if (receipt != null) {
                setThread(receipt);
            }
        }

    }

    protected void store(LocalSession _receipt) {
        setThread(_receipt);
        CookieReceipt cookieReceipt = new CookieReceipt(request, response);
        cookieReceipt.store(_receipt);
    }

    protected void store(LocalSession _receipt, int cookie_expire_seconds) {
    	 setThread(_receipt);
         CookieReceipt cookieReceipt = new CookieReceipt(request, response);
         cookieReceipt.store(_receipt, cookie_expire_seconds);
	}
    
    protected void destory() {
        tl_receipt.remove();
        CookieReceipt cookieReceipt = new CookieReceipt(request, response);
        cookieReceipt.destory();
    }
    


    public boolean isReceiptLoginAcceptable() {
        boolean bool = isReceiptLoginAcceptable(retrieve());
        
        if(!bool){
        	LocalSession localSession = retrieve();
            if(null!=localSession && null!=localSession.getLoginSession()){
            	localSession.setLoginSession(null);
            	this.store(localSession);
            }
        }
        
        return bool;
    }

    private boolean isReceiptLoginAcceptable(LocalSession receipt) {
    	if(checkBindStatusService==null){
    		checkBindStatusService=(CheckBindStatusService) SpringContextUtil.getBean("checkBindStatusService");
    	}
        if (receipt == null) {
            return false;
        }
        if (receipt.getLoginSession() == null) {
            return false;
        }

        if (!StringUtils.equals(receipt.getDomain(), receipt.getLoginSession().getDomain())) {
            return false;
        }
        
        if(StringUtils.isBlank(receipt.getLoginSession().getUid())){
        	return false;
        }




        //判断sid是否有效
        boolean rs = isSidVaildate(receipt.getLoginSession().getSid());
        if(!rs){
        	MwebHelper.setLogoutStatusInvalid(request);
        }
        
        return rs;
    }


    private boolean isSidVaildate(String sid){

        //  true_time
        String data = (String)this.request.getSession().getAttribute(String.format("ssid_%s",sid));
        if(StringUtils.isNotBlank(data)){
            String[] items = data.split("_");

            if(null!=items && items.length==2) {
                String isPass = items[0];
                String timeStr = items[1];
                long time = Long.valueOf(timeStr);
                if(time>System.currentTimeMillis()){ // 未过期
                    if( Boolean.valueOf(isPass)){
                        return true;
                    }
                }
            }
        }

        boolean rs = checkBindStatusService.checkSid(sid);

        //
        String key = String.format("ssid_%s",sid);
        String value = String.format("%s_%s",rs,System.currentTimeMillis() + 60*60*1000L);
        this.request.getSession().setAttribute(key,value);

        return rs;
    }





    protected static LocalSession getLoginSession() {
        return getThread();
    }
    
    protected static String  getCurrentDomain(){
        LocalSession localSession = getLoginSession();
        String domain =  (null==localSession) ?null: localSession.getDomain();
        domain = StringUtils.isBlank(domain)?StringUtils.trimToNull(Constant.DEFAULT_DOMAIN):domain;
        return domain ;
    }
    protected static String  getCurrentUid(){
        LocalSession localSession = getLoginSession();
        return (null==localSession || null==localSession.getLoginSession()) ?null:localSession.getLoginSession().getUid(); 
    }
    
    protected  void flushDomain(String domain){
        LocalSession localSession = retrieve();
        
        if(null==localSession){
            logger.warn("flush domain due to fial. not found localsession from cookie.want set new domain=[{}]",domain);
            return ;
        }
        if(!StringUtils.equals(domain, localSession.getDomain())){
            localSession.setDomain(domain);
            localSession.setLoginSession(null);
            localSession.setOpenId(null);
            localSession.setExt(null);
        }
        this.store(localSession);
        
    }
    protected  void flushOpenId(String openId){
        LocalSession localSession = retrieve();
        if(null==localSession){
            logger.warn("flush openId due to fial. not found localsession from cookie.want set new openId=[{}]",openId);
            return ;
        }
        localSession.setOpenId(openId);
        this.store(localSession);
    }
    protected  void flushExt(String ext){
        LocalSession localSession = retrieve();
        if(null==localSession){
            logger.warn("flush openId due to fial. not found localsession from cookie.want set new ext=[{}]",ext);
            return ;
        }
        localSession.setExt(ext);
        this.store(localSession);
    }

	
    
}
