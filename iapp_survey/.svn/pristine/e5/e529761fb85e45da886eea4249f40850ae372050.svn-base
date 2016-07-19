package com.longtime.ajy.support.service;

import com.longtime.app.ixin.mgr.service.IXinUserService;
import com.longtime.common.spring.SpringContextUtil;
import com.longtime.platform.credit.domain.CreditRankVO;
import com.longtime.platform.credit.service.ICreditService;
import com.longtime.platform.credit.service.ICreditServiceV2;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CreditServiceWrapper {

    private static final Logger               logger          = LoggerFactory.getLogger(CreditServiceWrapper.class);

    private static AtomicBoolean              init            = new AtomicBoolean(false);

    private static ExecutorService            executorService = Executors.newFixedThreadPool(1);

    private static AtomicBoolean              running         = new AtomicBoolean(false);

    private static ICreditServiceV2             creditService;

    private static IXinUserService            ixinUserService;

    private static BlockingQueue<CreditLogVO> queue           = new LinkedBlockingQueue<CreditLogVO>();

    private static void init() {
        if (init.get()) {
            return;
        }

        synchronized (init) {
            if (init.get()) {
                return;
            }
            if (null == creditService) {
                creditService = SpringContextUtil.getBean(ICreditServiceV2.class);
            }
            if (null == ixinUserService) {
                ixinUserService =  SpringContextUtil.getBean(IXinUserService.class);
            }
            if (!running.get()) {
                start();
            }
            init.set(true);
        }

    }

    private static void start() {
        synchronized (running) {
            if (running.get()) {
                return;
            }
            running.set(true);
            executorService.execute(new Runnable() {

                @Override
                public void run() {
                    try {
                        while (running.get()) {
                            CreditLogVO item = null;
                            try {
                                item = queue.take();
                            } catch (InterruptedException e) {
                                logger.error("take creditlog due to error", e);
                            }
                            if (item == null) {
                                continue;
                            }
                            String uid = item.getUid();
                            String domain = item.getDomain();
                            try {
	                            if (item.isOpenId) {
									uid = getUidByOpenId(uid, domain);
	                            }
	                            if (StringUtils.isBlank(uid)) {
	                            	logger.debug(String.format("not find uid.domain=[{}] openid=[{}]", domain,uid));
	                                continue;
	                            }
								createCreditLogSync(uid, item.getAction(), item.getResourceId(), domain);
							} catch (Exception e) {
								logger.error(String.format("create creditlog sync due to error，the uid=[%s],domain=[%s],action=[%s]", uid,domain,item.getAction()), e);
							}
                        }
                    } finally {
                        logger.error("proccess creditlog thread is exit!!!!");
                    }
                }
            });

        }

    }

    public static int createCreditLogSync(String uid, String action, String resourceId, String domain) {
        if (StringUtils.isBlank(uid) || StringUtils.isBlank(domain) || StringUtils.isBlank(action)) {
            return 0;
        }
        return getCreditService().createCreditLog(uid, action, resourceId, domain);

    }
    
    
	public static int createCreditLogRandomSync(String fromUid, String toUid, String action,int credit, int experience,String domain){
		 try {
			return getCreditService().createCreditLogRandom(fromUid, toUid, action, credit, experience, domain);
		} catch (Exception e) {
			logger.error(String.format("random credit invoke due to error. [fromuid=%s,touid=%s,action=%s]",fromUid,toUid,action), e);
			return 0;
		}
	}


    /**
     * 异步调用积分
     * 
     * @param uid
     * @param action
     * @param resourceId
     * @param domain
     * @return
     */
    public static void createCreditLog(String uid, String action, String resourceId, String domain) {
        if (StringUtils.isBlank(uid) || StringUtils.isBlank(domain) || StringUtils.isBlank(action)) {
            return;
        }
        CreditLogVO item = new CreditLogVO(uid, action, resourceId, domain);

        boolean bool = offer(item);

        if (!bool) {
            logger.error("put creditlog queue due to fail. createlog=[{}]", item);
        }

    }

    /**
     * 异步调用积分
     * 
     * @param openId
     * @param action
     * @param resourceId
     * @param domain
     */
    public static void createCreditLogForOpenId(String openId, String action, String resourceId, String domain) {
        if (StringUtils.isBlank(openId) || StringUtils.isBlank(domain) || StringUtils.isBlank(action)) {
            return;
        }

        CreditLogVO item = new CreditLogVO(openId, action, resourceId, domain, true);
        boolean bool = offer(item);
        if (!bool) {
            logger.error("put creditlog queue due to fail. createlog=[{}]", item);
        }
    }
    
    public static long getTotalCredit(String uid){
    	return getCreditService().getCurrentCredit(uid);
    }

    private static boolean offer(CreditLogVO item) {
        if (!init.get()) {
            init();
        }
        return queue.offer(item);
    }

    private static String getUidByOpenId(String openId, String domain) {
        return ixinUserService.getUid(openId, domain);

    }
    public static List<CreditRankVO> getTopCreditRank(long start, long end, int max,String domain) {
    	return getCreditService().getTopCreditRank(start, end, 0,max, domain);
    }

    public static ICreditService getCreditService() {
        if (!init.get()) {
            init();
        }
        return creditService;
    }

    static class CreditLogVO {

        boolean isOpenId;
        String  uid;
        String  action;
        String  resourceId;
        String  domain;

        public CreditLogVO(String uid, String action, String resourceId, String domain){
            this.uid = uid;
            this.action = action;
            this.resourceId = resourceId;
            this.domain = domain;
        }

        public CreditLogVO(String uid, String action, String resourceId, String domain, boolean isOpenId){
            this.uid = uid;
            this.action = action;
            this.resourceId = resourceId;
            this.domain = domain;
            this.isOpenId = isOpenId;
        }

        public String getUid() {
            return uid;
        }

        public void setUid(String uid) {
            this.uid = uid;
        }

        public String getAction() {
            return action;
        }

        public void setAction(String action) {
            this.action = action;
        }

        public String getResourceId() {
            return resourceId;
        }

        public void setResourceId(String resourceId) {
            this.resourceId = resourceId;
        }

        public String getDomain() {
            return domain;
        }

        public void setDomain(String domain) {
            this.domain = domain;
        }

        public boolean isOpenId() {
            return isOpenId;
        }

        public void setOpenId(boolean isOpenId) {
            this.isOpenId = isOpenId;
        }

        @Override
        public String toString() {
            return String.format("CreditLogVO [isOpenId=%s, uid=%s, action=%s, resourceId=%s, domain=%s]", isOpenId,
                                 uid, action, resourceId, domain);
        }

    }

}
