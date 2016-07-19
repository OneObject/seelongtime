//package com.longtime.ajy.support.service;
//
//import java.util.List;
//import java.util.Set;
//import java.util.concurrent.BlockingQueue;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//import java.util.concurrent.LinkedBlockingQueue;
//import java.util.concurrent.atomic.AtomicBoolean;
//
//import org.apache.commons.collections.CollectionUtils;
//import org.apache.commons.lang3.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import com.google.common.base.Joiner;
//import com.google.common.collect.Lists;
//import com.longtime.app.base.service.AuthorizeService;
//import com.longtime.app.base.service.NotifyConfigService;
//import com.longtime.common.spring.SpringContextUtil;
//import com.longtime.message.NotifySender;
//import com.longtime.message.model.NotifyBody;
//
//public class NotifySenderWrapper {
//
//    private static final Logger               logger          = LoggerFactory.getLogger(NotifySenderWrapper.class);
//
//    private static AtomicBoolean              init            = new AtomicBoolean(false);
//
//    private static ExecutorService            executorService = Executors.newFixedThreadPool(1);
//
//    private static AtomicBoolean              running         = new AtomicBoolean(false);
//
//    private static BlockingQueue<NotifyBody> queue           = new LinkedBlockingQueue<NotifyBody>();
//    
//    private static NotifySender notifySender;
//    
//    private static AuthorizeService authorizeService;
//    
//    private static NotifyConfigService notifyConfigService;
//
//    private static void init() {
//        if (init.get()) {
//            return;
//        }
//
//        synchronized (init) {
//            if (init.get()) {
//                return;
//            }
//            if (null == notifySender) {
//            	notifySender = SpringContextUtil.getBean(NotifySender.class);
//            }
//            if (null == authorizeService) {
//            	authorizeService =  SpringContextUtil.getBean(AuthorizeService.class);
//            }
//            if (null == notifyConfigService) {
//            	notifyConfigService =  SpringContextUtil.getBean(NotifyConfigService.class);
//            }
//            if (!running.get()) {
//                start();
//            }
//            init.set(true);
//        }
//
//    }
//
//    private static void start() {
//        synchronized (running) {
//            if (running.get()) {
//                return;
//            }
//            running.set(true);
//            executorService.execute(new Runnable() {
//
//                @Override
//                public void run() {
//                    try {
//                        while (running.get()) {
//                        	NotifyBody item = null;
//                            try {
//                                item = queue.take();
//                            } catch (InterruptedException e) {
//                                logger.error("take NotifyBody due to error", e);
//                            }
//                            if (item == null) {
//                                continue;
//                            }
//                            
//                            boolean allowToSend = notifyConfigService.allowToSend(item);
//                            if(!allowToSend){
//                            	continue;
//                            }
//                            
//                            logger.error(String.format("send notify which notifybody=%s",item));
//                            
//                            if(StringUtils.isNotBlank(item.getUids())){
//                            	notifySender.send(item);
//                            } else {
//                            	Set<String> uids = authorizeService.listAuthUids(item.getRid(),item.getDomain());
//                            	if(CollectionUtils.isNotEmpty(uids)){
//                            		List<String> list = Lists.newArrayList();
//                            		list.addAll(uids);
//                            		int size = list.size();
//                    				int count = (size%1000 == 0) ? size/1000 : (size/1000+1);
//                    				for(int i=0;i<count;i++){
//                    					List<String> partList = getPartList(list,i);
//                    					String partUids = Joiner.on(",").join(partList);
//                    					item.setUids(partUids);
//                    					notifySender.send(item);
//                    				}
//                            	}
//                            }
//                        }
//                    } finally {
//                        logger.error("proccess NotifyBody thread is exit!!!!");
//                    }
//                }
//            });
//
//        }
//    }
//    
//    private static List<String> getPartList(List<String> uids, int i) {
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
//    /**
//     * 异步调用发送提醒
//     * @param notifyBody
//     * @return
//     */
//    public static void send(NotifyBody notifyBody) {
//        try {
//			boolean bool = offer(notifyBody);
//			if (!bool) {
//			    logger.error("put notifyBody queue due to fail. notifyBody=[{}]", notifyBody);
//			}
//		} catch (Exception e) {
//			logger.error("put notifyBody queue due to fail. notifyBody=[{}]", notifyBody);
//		}
//    }
//
//
//    private static boolean offer(NotifyBody notifyBody) {
//        if (!init.get()) {
//            init();
//        }
//        return queue.offer(notifyBody);
//    }
//    
//}
