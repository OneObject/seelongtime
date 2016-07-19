//package com.longtime.app.ixin.api.http;
//
//import org.apache.commons.lang3.builder.ToStringBuilder;
//
//import java.util.Arrays;
//import java.util.Date;
//import java.util.List;
//import java.util.Map;
//import java.util.concurrent.TimeUnit;
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.apache.commons.codec.digest.DigestUtils;
//import org.apache.commons.io.IOUtils;
//import org.apache.commons.lang.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.util.CollectionUtils;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import com.google.common.base.Joiner;
//import com.google.common.base.Joiner.MapJoiner;
//import com.google.common.base.Splitter;
//import com.google.common.cache.Cache;
//import com.google.common.cache.CacheBuilder;
//import com.google.common.collect.Maps;
//import com.longtime.app.ixin.mgr.model.TokenInfo;
//import com.longtime.app.ixin.mgr.service.ITokenService;
//import com.longtime.app.ixin.protocol.IMessage;
//import com.longtime.app.ixin.protocol.ItemArticle;
//import com.longtime.app.ixin.protocol.Message;
//import com.longtime.app.ixin.protocol.MessageLog;
//import com.longtime.app.ixin.protocol.ReplyMessage;
//import com.longtime.app.ixin.protocol.ReplyMessageNews;
//import com.longtime.app.ixin.protocol.ReplyMessageText;
//import com.longtime.app.ixin.service.MessageLogService;
//import com.longtime.app.ixin.service.MessageProEntrance;
//import com.longtime.app.ixin.utils.MessageHandler;
//import com.longtime.common.utils.encrypt.BlowfishEncryptor;
//import com.longtime.common.utils.encrypt.EncryptException;
//import com.qq.weixin.mp.aes.WXBizMsgCrypt;
//
//@Controller
//@RequestMapping("/iwx/")
//public class WXAPIController {
//
//	private static final Logger logger = LoggerFactory.getLogger(WXAPIController.class);
//	@Resource
//	private ITokenService tokenService;
//	@Resource
//	private MessageProEntrance messageProEntrance;
//	
//	@Resource
//	private MessageLogService messageLogService;
//	
//	
//	private MsgCheck msgCheck = new MsgCheck();
//
//	@RequestMapping(value = "/webchat/{domain_token}", method = { RequestMethod.GET, RequestMethod.POST })
//	@ResponseBody
//	public String proccess(HttpServletRequest request, HttpServletResponse response,
//			@PathVariable(value = "domain_token") String domainToken) {
//
//		long start = System.currentTimeMillis();
//
//		logger.debug("weixin msg is receive. time=[{}]", new Date());
//
//		// 1. 根据domaintoken 获取商户
//		TokenInfo tokenInfo = tokenService.getTokenInfoByDomainToken(domainToken);
//		// 2. 判断商户是否启用微信服务
//
//		logger.debug("weixin msg. tokeninfo=[{}]", tokenInfo);
//
//		if (null == tokenInfo || !tokenInfo.enable()) {
//			return "not bind";
//		}
//
//		// 3. 获取该商户对应的TOKEN
//		String token = tokenInfo.getToken();
//		
//		String  aeskey = tokenInfo.getAeskey();
//		String  appid = tokenInfo.getAppId();
//		// 4. 验证微信接口
//
//		String echostr = request.getParameter("echostr");
//		String signature = request.getParameter("signature");
//		String nonce = request.getParameter("nonce");
//		String timestamp = request.getParameter("timestamp");
//
//		// if(!checkSignature(signature, timestamp, nonce, token)){
//		// logger.info("weixin api signature validate due to fail. domain_token=[{}] ",
//		// domainToken);
//		// return "illegal signature";
//		// }
//
//		int flag = request.getMethod().equalsIgnoreCase("GET") ? 1 : 2;
//
//		long start_msg = System.currentTimeMillis();
//
//		switch (flag) {
//		case 1:
//
//			return echostr;
//
//		case 2:
//			try {
//				
//				WXBizMsgCrypt pc =null; // 使用时再new  因为必须要有aeskey才能创建
//				Message message = null;
//				String encryptType = StringUtils.isBlank(request.getParameter("encrypt_type")) ?
//				        "raw" :
//				        request.getParameter("encrypt_type");
//				
//				
//				if("raw".equals(encryptType)){ //无加密
//					
//					message = MessageHandler.parseMessageByInputStream(request.getInputStream());
//					
//				}else if ("aes".equals(encryptType)) {
//				    // 是aes加密的消息
//				    String msgSignature = request.getParameter("msg_signature");
//				    
//				    // 密文
//				    String encodeMsg = IOUtils.toString(request.getInputStream(), "utf-8");
//				    
//				    pc = new WXBizMsgCrypt(token, aeskey, appid);
//				    
//				    String msg = pc.decryptMsg(msgSignature, timestamp, nonce, encodeMsg);
//				    
//				    message = MessageHandler.parseMessage(msg);
//				    
//				    
//				}
//				
//				if(null==message){
//					logger.error("decode msg is null.");
//					return "";
//				}
//				
//				
//				if(msgCheck.isProcessed(message.getMsgId())){
//				    logger.info(" msg is processed.");
//				    return "";
//				}
//				
//				message.setDomain(tokenInfo.getDomain());
//				logger.debug("message=[{}]", message);
//				String fromUserName = message.getFromUserName();
//				String toUserName = message.getToUserName();
//				
//				//MessageLog 记录
//				MessageLog ml = MessageLog.Builder.build(message);
//				this.messageLogService.add(ml);
//				
//				
//				ReplyMessage replyMessage = messageProEntrance.process(message);
//				if(replyMessage == null){
//					return "";
//				}
//				logger.debug("replay message=[{}]",ToStringBuilder.reflectionToString(replyMessage));
//				String msgType = replyMessage.getMsgType();
//				
//				if(StringUtils.isBlank(msgType)){
//					return "";
//				}
//				if(IMessage.REPLY_MESSAGE_NEWS.equals(msgType)){
//					ReplyMessageNews replyMessageNews = (ReplyMessageNews) replyMessage;
//					if(CollectionUtils.isEmpty(replyMessageNews.getArticleItems())){
//						return "";
//					}
//				}
//				if(IMessage.REPLY_MESSAGE_TEXT.equals(msgType)){
//					ReplyMessageText replyMessageText = (ReplyMessageText) replyMessage;
//					if(StringUtils.isBlank(replyMessageText.getContent())){
//						return "";
//					}
//				}
//				
//				if (IMessage.REPLY_MESSAGE_NEWS.equals(msgType)) {// replyMessage
//					ReplyMessageNews replyMessageNews = (ReplyMessageNews) replyMessage;
//					List<ItemArticle> items = replyMessageNews.getArticleItems();
//					for (ItemArticle item : items) {
//						String url = item.getUrl();
//						url = addQueryString(url, "d_openid", fromUserName);
//						//添加sign，该sign只能使用一次，用于d_openid 与 ajy opendid 对应
//						url = addQueryString(url, "d_sign", sign(fromUserName, System.currentTimeMillis()));
//						
//						item.setUrl(url);
//					}
//				}
//
//				replyMessage.setFromUserName(toUserName);
//				replyMessage.setToUserName(fromUserName);
//				String respMessage = MessageHandler.buildXmlByMessage(replyMessage);
//				
//				if ("aes".equals(encryptType)) {
//				    // 是aes加密的消息
//					logger.debug("replay original=[{}]", respMessage);
//					respMessage = pc.encryptMsg(respMessage, timestamp, nonce);
//				}
//				
//				
//				logger.debug("replay=[{}]", respMessage);
//				return respMessage;
//			} catch (Exception ex) {
//			    logger.error(String.format("parse weixin fail. domain_token=%s" ,domainToken), ex);
//				break;
//			} finally {
//
//				logger.debug("weixin hanlder totaltime=[{}]  message process time=[{}]", System.currentTimeMillis()
//						- start, System.currentTimeMillis() - start_msg);
//
//			}
//			// handler msg
//
//		}
//
//		return "";
//	}
//
//	private static MapJoiner queryStringMapJoiner = Joiner.on("&").withKeyValueSeparator("=");
//
//	private String removeParamQueryString(String queryString, String key) {
//		Map<String, String> myMap = Splitter.on("&").trimResults().withKeyValueSeparator("=").split(queryString);
//		myMap = Maps.newHashMap(myMap);
//		myMap.remove(key);
//		return queryStringMapJoiner.join(myMap);
//	}
//
//	/**
//	 * 向url中附加参数
//	 * 
//	 * @param strURL
//	 * @param key
//	 * @param value
//	 * @return
//	 */
//	private String addQueryString(String strURL, String key, String value) {
//		if(StringUtils.isBlank(strURL)){
//			return "";
//		}
//		String url = strURL;
//		String[] arrSplit = null;
//		arrSplit = strURL.split("[?]");
//		if (arrSplit.length > 1) {
////			url = removeParamQueryString(strURL, key);//去除存在的d_openid参数
//			String paramStr = arrSplit[1];
//			if(!paramStr.contains(key)){
//				url = String.format("%s&%s=%s", url, key, value);
//			} else {
//				String before = paramStr.substring(0, paramStr.indexOf(key+"=")+(key.length()+2)); //key之前的字符串
//				String after = "";  //key的值之后的其他的参数
//				if(paramStr.indexOf("&",paramStr.indexOf(key)) != -1){
//					after = paramStr.substring(paramStr.indexOf("&",paramStr.indexOf(key)));
//				}
//				url = String.format("%s?%s%s%s",arrSplit[0], before,value,after);
//			}
//		} else {
//			url = String.format("%s?%s=%s", strURL, key, value);
//		}
//		return url;
//	}
//	
//	public boolean checkSignature(String signature, String timestamp, String nonce, String token) {
//
//		if (StringUtils.isBlank(signature) || StringUtils.isBlank(timestamp) || StringUtils.isBlank(nonce)
//				|| StringUtils.isBlank(token)) {
//			return false;
//		}
//
//		// dictionary sort
//		String[] dataStrings = new String[] { token, timestamp, nonce };
//
//		Arrays.sort(dataStrings);
//		// construct the three string
//		String data = dataStrings[0] + dataStrings[1] + dataStrings[2];
//		// sha1
//		String flag = DigestUtils.shaHex(data);
//		// check
//		if (flag.equalsIgnoreCase(signature)) {
//			return true;
//		} else {
//			return false;
//		}
//	}
//	
//	static BlowfishEncryptor blowfishEncryptor = new BlowfishEncryptor();
//	private String  sign(String openid,long timestamp){
//		String key = StringUtils.substring(openid, 0,6);
//		try {
//			return blowfishEncryptor.encryptHex(key,String.valueOf(timestamp));
//		} catch (EncryptException e) {
//			e.printStackTrace();
//		}
//		return StringUtils.EMPTY;
//	}
//
////	public static void main(String[] args) {
////		
////		System.out.println( StringUtils.substring("1234567890", 0,5));
////		System.out.println( StringUtils.substring("12345", 0,5));
////		System.out.println( StringUtils.substring("123", 0,5));
////		System.out.println( StringUtils.substring("null", 0,5));
////		String s = "ornC5jmJo-";
////		try {
////			System.out.println(blowfishEncryptor.encryptHex(s, String.valueOf(System.currentTimeMillis())));
////		} catch (EncryptException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
////		
////	}
////	public static void main(String[] args) {
////
////		String token = "test";
////		String nonce = "test";
////		String timestamp = "123";
////		String[] dataStrings = new String[] { token, timestamp, nonce };
////
////		Arrays.sort(dataStrings);
////		// construct the three string
////		String data = dataStrings[0] + dataStrings[1] + dataStrings[2];
////		// sha1
////		String flag = DigestUtils.shaHex(data);
////
////		System.out.println(flag);// 7da0976cd14e4e989fefe1a2a64ff6d34986a98a
////
////	}
//	
//	
//	static class MsgCheck{
//	    static Cache<Long, Boolean> MsgIdCache = CacheBuilder.newBuilder()
//	            .expireAfterAccess(10, TimeUnit.SECONDS)
//	            .maximumSize(1000).build();
//	    
//	    public synchronized boolean isProcessed(Long msgId){
//	        if(null==msgId || 0==msgId){
//	            return false;
//	        }
//	        Boolean rs =  MsgIdCache.getIfPresent(msgId);
//	        if(null==rs){
//	            MsgIdCache.put(msgId, true);
//	            return false;
//	        }
//	        return true;
//	    }
//
//	    
//	}
//	
//	public static void main(String[] args) throws InterruptedException {
//        
//	    MsgCheck MsgCheck = new WXAPIController.MsgCheck();
//	            
//	    System.out.println(MsgCheck.isProcessed(1L));
//	    System.out.println(MsgCheck.isProcessed(1L));
//	    System.out.println(MsgCheck.isProcessed(2L));
//	    
//	    Thread.sleep(10000);
//	    System.out.println(MsgCheck.isProcessed(1L));
//	    
//    }
//	
//}
