package com.longtime.app.ixin.service.handlers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.mgr.service.AutoResponseRuleService;
import com.longtime.app.ixin.protocol.IMessage;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageText;
import com.longtime.app.ixin.service.IMessageHandler;
import com.longtime.app.ixin.utils.DefaultMessageUtil;

@Service("simpleMessageHandler")
public class SimpleMessageHandler implements IMessageHandler{
	
	@Resource(name="autoResponseRuleService")
	private AutoResponseRuleService autoResponseRuleService;
	
	@Resource(name = "fodderService")
	private FodderService fodderService;
	
	private Map<String, Map<String, AutoResponseRule>> maps = new HashMap<String, Map<String, AutoResponseRule>>();
	
	@Override
	public ReplyMessage process(IMessage message) {
		if(message instanceof MessageEvent){
			MessageEvent event = (MessageEvent) message;
			MessageText messageText = new MessageText();
			String key = event.getEventKey();
			if(StringUtils.isBlank(key)){
				key = event.getEvent();
			}
			messageText.setContent(key);
			messageText.setDomain(event.getDomain());
			return processText(messageText);
		}
		MessageText messageText = (MessageText) message;
		return processText(messageText);
	}
	
	private ReplyMessage processText(MessageText realMsg){
		ReplyMessage reply;
		AutoResponseRule rule = getCompleteMatchRule(realMsg); //完全匹配
		if(rule != null){
			reply = getReplyByRule(rule, realMsg.getDomain());
			return reply;
		}
		
		List<AutoResponseRule> rules = getRegexMatchRules(realMsg);//模糊匹配
		if(CollectionUtils.isNotEmpty(rules)){
			reply = getReplyByRules(rules, realMsg.getDomain());
			return reply;
		}
		return DefaultMessageUtil.getDefaultMessage(realMsg.getDomain());
	}

	//获取全匹配的规则
	private AutoResponseRule getCompleteMatchRule(MessageText realMsg) {
		String uKey = realMsg.getContent();
		Map<String,AutoResponseRule> rules = getAllRule(realMsg.getDomain());
		if(rules == null){
			return null;
		}
		for(Entry<String, AutoResponseRule> entry : rules.entrySet()){
			if(uKey.equalsIgnoreCase(entry.getKey())){
				return entry.getValue();
			}
		}
		return null;
	}
	
	private List<AutoResponseRule> getRegexMatchRules(MessageText realMsg) {
		//TODO 按照正则匹配规则 当前按包含用户key
		String uKey = realMsg.getContent();
		if(StringUtils.isBlank(uKey)){
			return null;
		}
		Map<String,AutoResponseRule> rules = getAllRule(realMsg.getDomain());
		if(rules == null){
			return null;
		}
		List<AutoResponseRule> matchs = new ArrayList<AutoResponseRule>();
		for(Entry<String, AutoResponseRule> entry : rules.entrySet()){
			//类型为不完全匹配的规则
			if(entry.getValue().getMatchAll() ==0 && uKey.contains(entry.getKey())){
				matchs.add(entry.getValue());
			}
		}
		return matchs;
	}
	
	private Map<String, AutoResponseRule> getAllRule(String domain) {
		Map<String, AutoResponseRule> rules = new HashMap<String, AutoResponseRule>();//maps.get(domain); 
		if(rules != null && !rules.isEmpty()){
			return rules;
		}
		
		List<AutoResponseRule> list = this.autoResponseRuleService.getAutoResponseRuleList(domain, 1, Integer.MAX_VALUE);
		if(CollectionUtils.isEmpty(list)){
			return rules;
		}
		for(AutoResponseRule rule : list){
			String[] keys = rule.getKeywords().split(",");
			for(String key : keys){
				rules.put(key, rule);
			}
		}
		
		maps.put(domain, rules);
		return rules;
	}

	private ReplyMessage getReplyByRule(AutoResponseRule rule, String domain) {
		// TODO 从数据库或其它地方取得规则对应的信息
//		ReplyMessageText reply = new ReplyMessageText();
//		reply.setContent("welcom!");
//		reply.setMsgType(ReplyMessage.REPLY_MESSAGE_TEXT);
		if(AutoResponseRule.TYPE_TEXT.equals(rule.getType())){
			if(StringUtils.isBlank(rule.getContent())){
				return DefaultMessageUtil.getDefaultMessage(domain);
			}
			ReplyMessageText reply = new ReplyMessageText();
			reply.setContent(rule.getContent());
			reply.setMsgType(ReplyMessage.MESSAGE_TEXT);
			return reply;
		}
		String id_str = rule.getMatterIds();
		if(StringUtils.isBlank(id_str)){
			return DefaultMessageUtil.getDefaultMessage(rule.getDomain());
		}
		String[] ids = id_str.split(",");
		ReplyMessage reply = fodderService.getReplyByIds(Arrays.asList(ids), domain);
		if(reply == null){
			reply = DefaultMessageUtil.getDefaultMessage(rule.getDomain());
		}
		reply.setDomain(rule.getDomain());
		return reply;
	}
	
	private ReplyMessage getReplyByRules(List<AutoResponseRule> rules, String domain) {
		if(CollectionUtils.isEmpty(rules)){
			return DefaultMessageUtil.getDefaultMessage(domain);
		}
		
		int index = RandomUtils.nextInt(rules.size());
		AutoResponseRule rule = rules.get(index);
		return getReplyByRule(rule, domain);
	}

}
