package com.longtime.app.ixin.service;

import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.mgr.service.MappingService;
import com.longtime.app.ixin.protocol.Message;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageImage;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageText;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.app.ixin.service.handlers.SimpleMessageHandler;
import com.longtime.app.ixin.service.handlers.SpecialHandler;
import com.longtime.app.ixin.utils.DefaultMessageUtil;
import com.telecom.ctu.platform.common.cache.CacheService;

public class MessageProEntrance {
	
	//系统内处理事件的bean，通过配置注入
	private Map<String, IMessageHandler> handlers;
	
	private SimpleMessageHandler simpleMessageHandler;
	
	@Resource(name = "iXinRuleService")
	private IXinRuleService iXinRuleService;
	
	@Resource(name = "specialHandler")
	private SpecialHandler specialHandler;
	
	@Resource(name = "mappingService")
	private MappingService mappingService;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	
	public static String SPLIT_FLAG_EN = "#";
	public static String SPLIT_FLAG_CH = "＃";
	
	public void init(){

	}
	
	public ReplyMessage process(Message msg){
		ReplyMessage reply = null;
		String key = getKey(msg);
		if(StringUtils.isBlank(key)){
			return DefaultMessageUtil.getDefaultMessage(msg.getDomain());
		}
		
		if("tc".equals(key)){ //退出上下文环境
			cacheService.remove(getCacheKey(msg.getFromUserName()));
			ReplyMessageText text = new ReplyMessageText();
			text.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
			text.setContent("退出成功！");
			return text;
		}
		
		if("subscribe".equals(key)){
			//关注
			return specialHandler.processSubscribe(msg);
		}
		if("unsubscribe".equals(key)){
			//取消关注
			return specialHandler.processUnsubscribe(msg);
		}
		
		IMessageHandler handler = getHandler(key,msg.getDomain());
		if(handler == null){
			return DefaultMessageUtil.getDefaultMessage(msg.getDomain());
		}
		reply = handler.process(msg);
		return reply;
	}
	
	private String getCacheKey(String openid){
		return String.format("wallx_%s", openid);
	}

	
	private IMessageHandler getHandler(String key,String domain) {
		key = getHandlerKey(key,domain);
		if(key == null || StringUtils.isBlank(key)){
			return simpleMessageHandler;
		}

		for(Entry<String, IMessageHandler> entry : handlers.entrySet()){
			if(matchKey(key,entry.getKey())){
				return entry.getValue();
			}
		}
		return simpleMessageHandler;
	}
	
	private String getHandlerKey(String key, String domain) {
		//先匹配通用规则，未匹配到，则从domainMap下拿到当前域的所有关键字，然后匹配拿到Rule，根据rule的关键字和类型返回相应业务处理程序的key
		Map<String, Rule> commonRuleMap = this.iXinRuleService.getCommonRules();
		if(commonRuleMap != null && !commonRuleMap.isEmpty()){
			Rule rule = commonRuleMap.get(key);
			if(rule != null){
				return rule.getHandlerKey();
			}
		}
		
		Map<String, Rule> rules = this.iXinRuleService.getDomainRules(domain);
		
		if(rules == null || rules.isEmpty()){
			return null;
		}
		for(Entry<String, Rule> entry : rules.entrySet()){
			if(key.equalsIgnoreCase(entry.getKey())){
				return entry.getValue().getHandlerKey();
			}
		}
		return null;
	}

	//匹配处理程序
	private boolean matchKey(String key, String hKey) {
		if(key.equalsIgnoreCase(hKey)){ //|| key.startsWith(hKey)
			return true;
		}
		return false;
	}

	//从message内获取key，eventKey或content
	private String getKey(Message msg) {
		String key = "";
		if(msg instanceof MessageEvent){
			MessageEvent realMsg = (MessageEvent) msg;
			cacheService.remove(realMsg.getFromUserName());//是事件就清除之前的上下文环境
			key = getEventKey(realMsg);
		}else if(msg instanceof MessageText){
			MessageText realMsg = (MessageText) msg;
			if("tc".equalsIgnoreCase(realMsg.getContent())){
				return "tc";
			}
			key = getContextKey(realMsg.getFromUserName());
			if(StringUtils.isNotBlank(key)){
				return key;
			}
			key = getComplexKey(realMsg);
			if(StringUtils.isNotBlank(key)){
				return key;
			}
			key = realMsg.getContent();
		} else if(msg instanceof MessageImage){
			key = getContextKey(msg.getFromUserName());
		}
		return key;
	}

	private String getEventKey(MessageEvent realMsg) {
		String key = "";
		String event = realMsg.getEvent();
		String eventKey = realMsg.getEventKey();
		if("subscribe".equals(event) && StringUtils.isNotBlank(eventKey)){
			String arg = "";
			if(eventKey.startsWith("qrscene_")){
				//TODO 未关注是否返回关注信息？
				arg = eventKey.substring(8);
			} else {
				arg = eventKey;
			}
			return getRealKey(arg,realMsg.getDomain());
		}
		key = realMsg.getEventKey();
		if(StringUtils.isBlank(key)){
			key = realMsg.getEvent();
		}

		return key;
	}

	private String getRealKey(String arg, String domain) {
		return this.mappingService.getValueBykey(arg,domain);
	}

	private String getComplexKey(MessageText realMsg) {
		String content = realMsg.getContent();
		if(StringUtils.isBlank(content)){
			return null;
		}
		if(content.contains(SPLIT_FLAG_CH)){
			content = content.replaceAll(SPLIT_FLAG_CH, SPLIT_FLAG_EN);
		}
		if(content.contains(SPLIT_FLAG_EN)){
			int count = countString(content,SPLIT_FLAG_EN);
			if(count >= 2){
				return content.substring(content.indexOf(SPLIT_FLAG_EN)+1, content.lastIndexOf(SPLIT_FLAG_EN));
			}
		}
		return null;
	}

	private int countString(String str1, String str2) {
		if(StringUtils.isBlank(str1) || StringUtils.isBlank(str2)){
			return 0;
		}
		String[] arr = str1.split(str2);
		if(arr != null && arr.length >=2){
			return arr.length;
		}
		return 0;
	}

	private String getContextKey(String openid) {
		String contextKey = cacheService.get(getCacheKey(openid));
		return contextKey;
	}
	
	

	public Map<String, IMessageHandler> getHandlers() {
		return handlers;
	}

	public void setHandlers(Map<String, IMessageHandler> handlers) {
		this.handlers = handlers;
	}
	
	public SimpleMessageHandler getSimpleMessageHandler() {
		return simpleMessageHandler;
	}


	public void setSimpleMessageHandler(SimpleMessageHandler simpleMessageHandler) {
		this.simpleMessageHandler = simpleMessageHandler;
	}
	
}
