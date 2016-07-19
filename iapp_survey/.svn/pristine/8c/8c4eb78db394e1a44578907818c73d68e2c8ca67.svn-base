package com.longtime.app.ixin.mgr.service.impl;

import com.longtime.app.base.model.ActivityPersonVO;
import com.longtime.app.ixin.mgr.dao.IActivityDao;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecord;
import com.longtime.app.ixin.mgr.model.ActivityApplyRecordVO;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.service.IActivityService;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.Message;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.app.ixin.service.handlers.AbstartMessageHandler;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service("activityService")
public class ActivityServiceImpl extends AbstartMessageHandler implements IActivityService {
	
	@Resource(name="activityDao")
	private IActivityDao activityDao;
	@Resource(name="iXinRuleService")
	private IXinRuleService iXinRuleService;
	@Value("${com.longtime.ixin.activityBasePath}")
	private String activityBasePath;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String suffix;
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String qiniuImageBasePath;
	@Override
	public boolean addActivity(ActivityInfo info) {
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		info.setId(id);
		info.setCreateDate(new Date().getTime());
		boolean flag = activityDao.addActivity(info);
		if(flag && !StringUtils.isBlank(info.getFindKeys())) {
			Rule rule = new Rule();
			rule.setSid(info.getId());
			rule.setHandlerKey(ActivityInfo.HANDLER_KEY);
			rule.setsKey(info.getFindKeys());
			rule.setType(Rule.DOMAIN_RULE);
			rule.setDomain(info.getDomain());
			iXinRuleService.addOrUpdate(rule);
		}
		return flag;
	}

	@Override
	public List<ActivityInfo> getActivityList(String domain, int page) {
		// TODO Auto-generated method stub
		return activityDao.query(domain, page, 20);
	}
	
	@Override
	public List<ActivityInfo> getUnclosedActivityList(String domain) {
		// TODO Auto-generated method stub
		long nowDate = new Date().getTime();
		return activityDao.queryByDate(domain, nowDate);
	}

	@Override
	public int getActivityCount(String domain) {
		return activityDao.queryActivityCount(domain);
	}

	@Override
	public ActivityInfo getActivityById(String id) {
		return activityDao.queryById(id);
	}

	@Override
	public int applyActivity(String activityId, String openid,String baseuid) {
		// TODO Auto-generated method stub
		long nowdate = new Date().getTime();
		ActivityInfo info = activityDao.queryById(activityId);
		if(0 != info.getLastApplyDate() && info.getLastApplyDate() < nowdate ) {
			return 1;
		}
		String id = IdGenerator.nextId32().toString();
		ActivityApplyRecord record = new ActivityApplyRecord();
		record.setId(id);
		record.setUserId(openid);
		record.setBaseuid(baseuid);
		record.setActivityId(activityId);
		record.setApplyDate(nowdate);
		record.setIsSignin(0);
		record.setSigninDate(0);
		boolean flag = activityDao.applyActivity(record);
		if(flag)
			return 0;
		else
			return 2;
	}

	@Override
	public boolean signin(String activityId, String openid, String code,String baseuid) {
		// TODO Auto-generated method stub
		ActivityInfo info = activityDao.queryById(activityId);
		if(null == code || "".equals(code.trim()) || !code.equals(info.getSigninCode())) {
			return false;
		}
		ActivityApplyRecord record = activityDao.querySpecifiedApplyRecord(activityId, openid);
		if(record == null) {
			//如果报名记录为空，说明已经过了报名时间，直接给予签到
			String id = IdGenerator.nextId32().toString();
			record = new ActivityApplyRecord();
			record.setId(id);
			record.setUserId(openid);
			record.setBaseuid(baseuid);
			record.setActivityId(activityId);
			record.setApplyDate(0);
			record.setIsSignin(1);
			record.setSigninDate(new Date().getTime());
			return activityDao.applyActivity(record);
		} else {
			return activityDao.signin(activityId, openid, new Date().getTime(),baseuid);
		}
		
	}

	@Override
	public ActivityApplyRecord getSpecifiedApplyRecord(String activityId, String userId) {
		// TODO Auto-generated method stub
		return activityDao.querySpecifiedApplyRecord(activityId, userId);
	}

	@Override
	public List<ActivityApplyRecordVO> getApplyRecordByActivity(String activityId, int page) {
		return activityDao.queryApplyRecord(activityId, page, 20);
	}

	@Override
	public List<ActivityApplyRecord> getAllRecordByUid(String uid) {
		return activityDao.queruAllRecordByUid(uid);
	}

	@Override
	public int getApplyCount(String activityId) {
		return activityDao.queryApplyCount(activityId);
	}

	@Override
	public ReplyMessage processText(MessageText messageText) {
		// TODO Auto-generated method stub
		List<ActivityInfo> list = null;
		String keys = messageText.getContent().toLowerCase();
		if(keys.equalsIgnoreCase(ActivityInfo.HANDLER_KEY) || keys.equals(ActivityInfo.HANDLER_KEY_CN) || keys.equals(ActivityInfo.HANDLER_KEY_SIGN)) {
			list = getUnclosedActivityList(messageText.getDomain());
		} else {
			ActivityInfo info = activityDao.queryByKeys(keys,messageText.getDomain());
			if(info != null) {
				list = new ArrayList<ActivityInfo>();
				list.add(info);
			}
		}
		
		if(null == list || list.isEmpty())
			return null;
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		List<ItemArticle> articles = new ArrayList<ItemArticle>();
		if(list.size() >= 5) {
			replyMessage.setCount(5);
			for(int i = 0; i < 5; i++) {
				ActivityInfo info = list.get(i);
				ItemArticle article = new ItemArticle();
				article.setId(info.getId());
				article.setTitle(info.getName());
				article.setDescription(info.getDesc());
				article.setPicUrl(qiniuImageBasePath + info.getPicUrl() + suffix);
				article.setUrl(getURL( info));
				articles.add(article);
			}
		} else {
			replyMessage.setCount(list.size());
			for(int i = 0; i < list.size(); i++) {
				ActivityInfo info = list.get(i);
				ItemArticle article = new ItemArticle();
				article.setId(info.getId());
				article.setTitle(info.getName());
				article.setDescription(info.getDesc());
				article.setPicUrl(qiniuImageBasePath + info.getPicUrl() + suffix);
				article.setUrl(getURL( info));
				articles.add(article);
			}
		}
		replyMessage.setArticleItems(articles);
		replyMessage.setCreateTime(new Date().getTime());
		replyMessage.setMsgType(Message.REPLY_MESSAGE_NEWS);
		return replyMessage;
	}

	
	protected String getURL( ActivityInfo info) {
		return activityBasePath + "id=" + info.getId() + "&fdomain="+info.getDomain()+"&r="+System.currentTimeMillis();
	}

	@Override
	public ReplyMessage processEvent(MessageEvent messageEvent) {
		// TODO Auto-generated method stub
		List<ActivityInfo> list = null;
		String key = messageEvent.getEventKey();
		if(StringUtils.isBlank(key)){
			key = messageEvent.getEvent();
		}
		if(key.equalsIgnoreCase(ActivityInfo.HANDLER_KEY) || key.equals(ActivityInfo.HANDLER_KEY_CN) || key.equals(ActivityInfo.HANDLER_KEY_SIGN)) {
			list = getUnclosedActivityList(messageEvent.getDomain());
		} else {
			ActivityInfo info = activityDao.queryByKeys(key,messageEvent.getDomain());
			if(info != null) {
				list = new ArrayList<ActivityInfo>();
				list.add(info);
			}
		}
		if(null == list || list.isEmpty())
			return null;
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		List<ItemArticle> articles = new ArrayList<ItemArticle>();
		if(list.size() >= 5) {
			replyMessage.setCount(5);
			for(int i = 0; i < 5; i++) {
				ActivityInfo info = list.get(i);
				ItemArticle article = new ItemArticle();
				article.setId(info.getId());
				article.setTitle(info.getName());
				article.setDescription(info.getDesc());
				article.setPicUrl(qiniuImageBasePath + info.getPicUrl() + suffix);
				article.setUrl(getURL(info));
				articles.add(article);
			}
		} else {
			replyMessage.setCount(list.size());
			for(int i = 0; i < list.size(); i++) {
				ActivityInfo info = list.get(i);
				ItemArticle article = new ItemArticle();
				article.setId(info.getId());
				article.setTitle(info.getName());
				article.setDescription(info.getDesc());
				article.setPicUrl(qiniuImageBasePath + info.getPicUrl() + suffix);
				article.setUrl(getURL(info));
				articles.add(article);
			}
		}
		replyMessage.setArticleItems(articles);
		replyMessage.setCreateTime(new Date().getTime());
		replyMessage.setMsgType(Message.REPLY_MESSAGE_NEWS);
		return replyMessage;
	}

	
	
	@Override
	public boolean deleteActivityById(String id) {
		// TODO Auto-generated method stub
		boolean flag = activityDao.deleteActivity(id);
		if(flag) {
			iXinRuleService.delBySid(id);
		}
		return flag;
	}
	
	@Override
	public boolean modifyActivity(ActivityInfo activity) {
		// TODO Auto-generated method stub
		boolean flag = activityDao.updateActivity(activity);
		if(flag){
			if(!StringUtils.isBlank(activity.getFindKeys())) {
				Rule rule = new Rule();
				rule.setSid(activity.getId());
				rule.setHandlerKey(ActivityInfo.HANDLER_KEY);
				rule.setsKey(activity.getFindKeys());
				rule.setType(Rule.DOMAIN_RULE);
				rule.setDomain(activity.getDomain());
				iXinRuleService.addOrUpdate(rule);
			} else {
				iXinRuleService.delBySid(activity.getId());
			}
		}
		return flag;
	}

	public String getActivityBasePath() {
		return activityBasePath;
	}

	public void setActivityBasePath(String activityBasePath) {
		this.activityBasePath = activityBasePath;
	}

	@Override
	public List<ActivityInfo> getActivityListHasKey(String domain, int page,int pageSize) {
		return activityDao.queryHasKey(domain, page,pageSize);
	}

	@Override
	public int getActivityCountHasKey(String domain) {
		return activityDao.queryActivityCountHasKey(domain);
	}
	@Override
	public List<ActivityApplyRecordVO> getApplyRecordByActivity(String domain,String activityId, int page) {
		return activityDao.queryApplyRecord2(domain,activityId, page, 20);
	}
	@Override
	public List<ActivityPersonVO> getPersonByActivity(String domain,String activityId, int page,String status) {
		return activityDao.queryPersonRecord(domain,activityId, page, 20,status);
	}
	
	public int getApplyCount(String domain,String activityId){
		return activityDao.queryApplyCount2(domain,activityId);
	}
	
	public int getPersonCount(String domain,String activityId,String status){
		return activityDao.queryPersonCount(domain,activityId,status);
	}

	@Override
	public List<ActivityApplyRecordVO> getApplyRecordByActivity(String domain, String activityId) {
		// TODO Auto-generated method stub
		return activityDao.queryApplyRecord(domain,activityId);
	}

	@Override
	public List<ActivityInfo> getUnclosedActivityList(String domain,
			int currentpage, int pagesize) {
		
		long nowDate = new Date().getTime();
		return activityDao.queryByDate(domain, nowDate,currentpage,pagesize);
	}

	@Override
	public int getActivityCount(String domain, long nowDate) {
		return this.activityDao.queryActivityCount(domain, nowDate);
	}


	
	@Override
	public ResultSet<ActivityInfo> listActivity(String domain,Page page ){
		
		return activityDao.listActivity(domain, page);
	}
}
