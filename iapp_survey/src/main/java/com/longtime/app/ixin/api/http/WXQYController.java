//package com.longtime.app.ixin.api.http;
//
//import com.longtime.ajy.support.bean.WxCpInRedisConfigStorage;
//import com.longtime.app.ixin.api.http.WXAPIController.MsgCheck;
//import com.longtime.app.ixin.mgr.model.TokenInfo;
//import com.longtime.app.ixin.mgr.service.ITokenService;
//import com.longtime.app.ixin.protocol.IMessage;
//import com.longtime.app.ixin.protocol.ItemArticle;
//import com.longtime.app.ixin.protocol.Message;
//import com.longtime.app.ixin.protocol.MessageEvent;
//import com.longtime.app.ixin.protocol.MessageImage;
//import com.longtime.app.ixin.protocol.MessageLog;
//import com.longtime.app.ixin.protocol.MessageText;
//import com.longtime.app.ixin.protocol.ReplyMessage;
//import com.longtime.app.ixin.protocol.ReplyMessageNews;
//import com.longtime.app.ixin.protocol.ReplyMessageText;
//import com.longtime.app.ixin.service.MessageLogService;
//import com.longtime.app.ixin.service.MessageProEntrance;
//import com.longtime.common.utils.encrypt.BlowfishEncryptor;
//import com.longtime.common.utils.encrypt.EncryptException;
//import java.io.ByteArrayInputStream;
//import java.io.IOException;
//import java.util.Date;
//import java.util.List;
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import me.chanjar.weixin.common.api.WxConsts;
//import me.chanjar.weixin.cp.api.WxCpConfigStorage;
//import me.chanjar.weixin.cp.api.WxCpInMemoryConfigStorage;
//import me.chanjar.weixin.cp.api.WxCpService;
//import me.chanjar.weixin.cp.api.WxCpServiceImpl;
//import me.chanjar.weixin.cp.bean.WxCpXmlMessage;
//import me.chanjar.weixin.cp.bean.WxCpXmlOutMessage;
//import me.chanjar.weixin.cp.bean.WxCpXmlOutNewsMessage;
//import me.chanjar.weixin.cp.bean.WxCpXmlOutNewsMessage.Item;
//import me.chanjar.weixin.cp.bean.WxCpXmlOutTextMessage;
//import me.chanjar.weixin.cp.bean.outxmlbuilder.NewsBuilder;
//import me.chanjar.weixin.cp.util.crypto.WxCpCryptUtil;
//import me.chanjar.weixin.cp.util.xml.XStreamTransformer;
//import org.apache.commons.io.IOUtils;
//import org.apache.commons.lang3.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.util.CollectionUtils;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//@Controller
//@RequestMapping("/iwx/")
//public class WXQYController {
//
//	private static final Logger logger = LoggerFactory.getLogger(WXQYController.class);
//	@Resource
//	private ITokenService tokenService;
//	@Resource
//	private MessageProEntrance messageProEntrance;
//	
//	@Resource
//	private MessageLogService messageLogService;
//
//	private MsgCheck msgCheck = new MsgCheck();
//	
//	
//	@RequestMapping(value = "/qy/{domain_token}", method = { RequestMethod.GET, RequestMethod.POST })
//	@ResponseBody
//	public String proccess(HttpServletRequest request,
//			HttpServletResponse response,
//			@PathVariable(value = "domain_token") String domainToken) {
//
//		long start = System.currentTimeMillis();
//		logger.debug("weixin qy msg is receive. time=[{}]", new Date());
//
//		// 1. 根据domaintoken 获取商户
//		TokenInfo tokenInfo = tokenService.getTokenInfoByDomainToken(domainToken);
//
//		// 2. 判断商户是否启用微信服务
//		logger.debug("weixin msg. tokeninfo=[{}]", tokenInfo);
//
//		if (null == tokenInfo || !tokenInfo.enable()) {
//			
//			logger.debug("tokenInfo disaled.");
//			return "not bind";
//		}
//
//		String domain = tokenInfo.getDomain();
//		String corpId = tokenInfo.getAppId();
//		String secret = tokenInfo.getAppSecret();
//		String token = tokenInfo.getToken();
//		String aeskey = tokenInfo.getAeskey();
//		String agentId = tokenInfo.getAgentid();
//
//		String msgSignature = request.getParameter("msg_signature");
//		String nonce = request.getParameter("nonce");
//		String timestamp = request.getParameter("timestamp");
//		String echostr = request.getParameter("echostr");
//		
//		logger.debug("msg_signature={} nonce={}  timestamp={} echostr={}", msgSignature,nonce,timestamp,echostr);
//
//		WxCpInRedisConfigStorage wxCpConfigStorage = WxCpInRedisConfigStorage.buildWxCpConfigStorage(corpId, secret, agentId, token, aeskey);
//
//		WxCpService wxCpService = getWxCpService(corpId, secret, token, aeskey, agentId);
//		
//		if (StringUtils.isNotBlank(echostr)) { // 验证
//			if (!wxCpService.checkSignature(msgSignature, timestamp, nonce, echostr)) {
//				logger.info("wx callback url validate fail. domaintoken={} ", tokenInfo);
//				return "illegal signature";
//			}
//			String plainText = getPlanText(wxCpConfigStorage, echostr);
//			logger.info("wx callback url validate success. domaintoken={} ", tokenInfo);
//			return plainText;
//		}
//
//		WxCpXmlMessage inMessage = null;
//		try {
//			String data = IOUtils.toString(request.getInputStream(), "UTF-8");
//			logger.debug(data);
//			inMessage = WxCpXmlMessage.fromEncryptedXml(new ByteArrayInputStream(data.getBytes()),
//				wxCpConfigStorage,
//				timestamp,
//				nonce,
//				msgSignature);
//
//		} catch (IOException e) {
//			logger.error("get request inputstream due to error.", e);
//			return "";
//		}catch (RuntimeException e) {
//			logger.error("fromEncryptedXml due to error.", e);
//			return "";
//		}
//
//		logger.debug(inMessage.toString());
//		
//		
//		if(msgCheck.isProcessed(inMessage.getMsgId())){
//            logger.info(" msg is processed.");
//            return "";
//        }
//		
//		String fromUserName = inMessage.getFromUserName();
//		String toUserName = inMessage.getToUserName();
//
//		String msgType = inMessage.getMsgType();
//		Message message = null;
//
//		if (WxConsts.XML_MSG_TEXT.equals(msgType)) { //text
//			message = new MessageText();
//			((MessageText) message).setContent(inMessage.getContent());
//		} else if (WxConsts.XML_MSG_EVENT.equals(msgType)) {//event
//			message = new MessageEvent();
//			((MessageEvent) message).setEvent(inMessage.getEvent());
//			((MessageEvent) message).setEventKey(inMessage.getEventKey());
//		} else if (WxConsts.XML_MSG_IMAGE.equals(msgType)) {// image
//			message = new MessageImage();
//			((MessageImage) message).setPicUrl(inMessage.getPicUrl());
//			((MessageImage) message).setMediaId(inMessage.getMediaId());
//		}
//		if (null != message) {
//			message.setToUserName(toUserName);
//			message.setFromUserName(fromUserName);
//			message.setDomain(domain);
//			message.setMsgType(msgType);
//			message.setWxQYType(); //来自企业号的信息
//			if(inMessage.getMsgId() != null){
//				message.setMsgId(inMessage.getMsgId());
//			}
//		}
//		
//		//MessageLog 记录
//		MessageLog ml = MessageLog.Builder.build(message);
//		this.messageLogService.add(ml);
//		
//		ReplyMessage replyMessage = messageProEntrance.process(message);
//		
//		logger.debug("replymessage=[{}]",replyMessage);
//		
//		if (replyMessage == null) {
//			return "";
//		}
//		
//		
//		 msgType = replyMessage.getMsgType();
//		
//		if(StringUtils.isBlank(msgType)){
//			return "";
//		}
//		
//		
//		
//		WxCpXmlOutMessage outMessage  = null;
//		
//		if(IMessage.REPLY_MESSAGE_TEXT.equals(msgType)){
//			ReplyMessageText replyMessageText = (ReplyMessageText) replyMessage;
//			if(StringUtils.isBlank(replyMessageText.getContent())){
//				return "";
//			}
//			
//			outMessage = WxCpXmlOutTextMessage.TEXT().content(replyMessageText.getContent()).build();
//		}
//		
//		if (IMessage.REPLY_MESSAGE_NEWS.equals(msgType)) {// replyMessage
//			ReplyMessageNews replyMessageNews = (ReplyMessageNews) replyMessage;
//			if(CollectionUtils.isEmpty(replyMessageNews.getArticleItems())){
//				return "";
//			}
//			List<ItemArticle> items = replyMessageNews.getArticleItems();
//			for (ItemArticle item : items) {
//				String url = item.getUrl();
//				url = addQueryString(url, "d_openid", fromUserName);
//				//添加sign，该sign只能使用一次，用于d_openid 与 ajy opendid 对应
//				url = addQueryString(url, "d_sign", sign(fromUserName, System.currentTimeMillis()));
//				
//				item.setUrl(url);
//			}
//			
//			NewsBuilder builder = WxCpXmlOutNewsMessage.NEWS();
//			
//			for (ItemArticle itemArticle : items) {
//				builder.addArticle(toItem(itemArticle));
//			}
//			outMessage = builder.build();
//		}
//
//		outMessage.setFromUserName(toUserName);
//		outMessage.setToUserName(fromUserName);
//		
//		
//		String respMessage = outMessage.toEncryptedXml(wxCpConfigStorage);
//		logger.debug("orginal reply=[{}]",replyMessage);
//		logger.debug("encode  replay=[{}]", respMessage);
//		logger.debug("weixin qy msg is reponsed. time={} ms", System.currentTimeMillis()-start);
//		return respMessage;
//
//	}
//
//	private Item toItem(ItemArticle itemArticle) {
//		Item item = new Item();
//		item.setTitle(itemArticle.getTitle());
//		item.setUrl(itemArticle.getUrl());
//		item.setPicUrl(itemArticle.getPicUrl());
//		item.setDescription(itemArticle.getDescription());
//		return item;
//	}
//
//	private String getPlanText(WxCpConfigStorage config, String echostr) {
//		WxCpCryptUtil cryptUtil = new WxCpCryptUtil(config);
//		String plainText = cryptUtil.decrypt(echostr);
//		return plainText;
//	}
//
//	public WxCpService getWxCpService(String corpId, String corpSecret, String token, String aeskey, String agentId) {
//		WxCpInRedisConfigStorage config = WxCpInRedisConfigStorage.buildWxCpConfigStorage(corpId, corpSecret, agentId, token, aeskey);
//		WxCpService wxCpService = new WxCpServiceImpl();
//		wxCpService.setWxCpConfigStorage(config);
//		return wxCpService;
//
//	}
//
//	
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
//	public static void main(String[] args) {
//		
//		//-msg_signature=05c95e82b6f3f630fedff74f92d4b7311d31f8bf nonce=1622489685  timestamp=1423204237 echostr=null
//
//		String data = "<xml><ToUserName><![CDATA[wx60af3cef5630ffca]]></ToUserName><Encrypt><![CDATA[Oec7mlsZ/vMs8RXwyI5IS8rUGHIkoP4Jbm3Z19lL5CmoMceviMpDaWDzWYAO/+h+g6rDlWBYQ2Yf7Xy8sMvdglvMjL8frO+XfPPdTcCgMzKemtXgCKhE0ib3Ks04oGRcD3mr6ELfbHYJPbP2MFzWVmSv0g+Prwt9leywXeZ2DoE8EIirjXKP5FLzBRLmoLNzH+hDRSbytrQdvcBn0DaC+Y4lpzGAmF2JVgziWF2Jl5Ma4cCQE/hZaOWkDVZ9cxllbcJlu3ZjoFYV/b5RIUFAIcQBhQszCRvkU4Zixg+6G4g2+KdYjqh4+SZhGaFxIjceX+gEyOqqSWc4NNfS6tTcpNnSyTeYwcxzcIsoQ9Pz5fXRnqtnPKRtCJGYvvj16YHSkVzXbipY2leuhoGdLuw8mxgISBwPvvjJgZi5qvGu9LM8ntii92FPv2q3IFYkLN09eZlQjWWrv/RRDSYP9PBYJQ==]]></Encrypt><AgentID><![CDATA[2]]></AgentID></xml>";
//		
//
//		WxCpInMemoryConfigStorage wxCpConfigStorage = new WxCpInMemoryConfigStorage();
//		wxCpConfigStorage.setCorpId("wx60af3cef5630ffca"); // 设置微信企业号的appid
//		wxCpConfigStorage.setCorpSecret("3FVZ01OXzfsfHCk-SrWn_6lFEIyms8xAHF90wK1uHYTrv-LY8s60znbTsTseHiNG"); // 设置微信企业号的app corpSecret
//		wxCpConfigStorage.setAgentId("2"); // 设置微信企业号应用ID
//		wxCpConfigStorage.setToken("axrbOJ"); // 设置微信企业号应用的token
//		wxCpConfigStorage.setAesKey("WsFi∂L4eHMNexqBp3LLSSafanGU9t9fXgnyzQtvVwHtm"); // 设置微信企业号应用的EncodingAESKey
//		WxCpCryptUtil cryptUtil = new WxCpCryptUtil(wxCpConfigStorage);
//		
//		
//		
//		String msgSignature = "05c95e82b6f3f630fedff74f92d4b7311d31f8bf";
//		String timestamp = "1423204237";
//		String nonce="1622489685";
//	    String plainText = cryptUtil.decrypt(msgSignature, timestamp, nonce, data);
//	    
//		System.out.println(plainText);
//		
//		
//		XStreamTransformer.fromXml(WxCpXmlMessage.class, plainText);
//	}
//}
