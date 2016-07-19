package com.longtime.app.ixin.mgr.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.dao.IRewardDao;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.model.ApplyRewardRecord;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.RewardCardItem;
import com.longtime.app.ixin.mgr.model.RewardExplain;
import com.longtime.app.ixin.mgr.model.RewardItem;
import com.longtime.app.ixin.mgr.model.RewardResultVO;
import com.longtime.app.ixin.mgr.model.RewardRuleContainer;
import com.longtime.app.ixin.mgr.model.RewardRuleContainerVO;
import com.longtime.app.ixin.mgr.service.IRewardService;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.protal.activity.vo.ApplyRewardVO;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.Message;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.app.ixin.service.handlers.AbstartMessageHandler;
import com.longtime.app.ixin.utils.DefaultMessageUtil;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.Page;

@Service("rewardService")
public class RewardServiceImpl extends AbstartMessageHandler implements IRewardService {

	@Resource(name="rewardDao")
	private IRewardDao rewardDao;
	@Resource(name="iXinRuleService")
	private IXinRuleService iXinRuleService;
	@Value("${com.longtime.ixin.rewardBasePath}")
	private String rewardBasePath;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String suffix;
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String qiniuImageBasePath;
	@Override
	public RewardActivity getRewardById(String id) {
		// TODO Auto-generated method stub
		RewardActivity reward = rewardDao.queryById(id);
		if(reward != null) {
			long startDate = reward.getStartDate();
			long endDate = reward.getEndDate();
			long nowDate = new Date().getTime();
			if(nowDate >= endDate) {
				reward.setStatus(2);
			} else if(nowDate < startDate) {
				reward.setStatus(0);
			} else if(startDate <= nowDate && nowDate < endDate) {
				reward.setStatus(1);
			}
			return reward;
		}
		return null;
	}

	@Override
	public String addRewardFirstStep(RewardActivity reward) {
		// TODO Auto-generated method stub
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		reward.setId(id);
		boolean flag = rewardDao.save(reward);
		if(flag) {
			return id;
		}
		return null;
	}

	@Override
	public String addRewardSecondStep(String id, RewardExplain explain) {
		// TODO Auto-generated method stub
		RewardActivity reward = rewardDao.queryById(id);
		reward.setExplain2(explain);
		boolean flag = rewardDao.update(reward);
		if(flag) {
			return id;
		}
		return null;
	}

	@Override
	public boolean addRewardThirdStep(RewardRuleContainerVO reward) {
		// TODO Auto-generated method stub
		RewardActivity oldReward = rewardDao.queryById(reward.getRewardId());
		oldReward.setIsCreateFinish(1);
//		oldReward.setRewardRate((reward.getRewardRate()/100.0));
//		oldReward.setMaxAttendNum(reward.getMaxAttendNum());
		boolean flag = rewardDao.update(oldReward);
		if(!flag){
			return false;
		}
		
		RewardRuleContainer rewardRuleContainer = new RewardRuleContainer();
		String id = IdGenerator.nextId32().toString();
		rewardRuleContainer.setId(id);
		rewardRuleContainer.setRewardId(reward.getRewardId());
		rewardRuleContainer.setMaxAttendNum(reward.getMaxAttendNum());
		rewardRuleContainer.setRewardRate(reward.getRewardRate()/100.0);
		long startTime = DateUtils.parseStringToLong(reward.getStartTimeStr());
		long endTime = DateUtils.parseStringToLong(reward.getEndTimeStr());
		rewardRuleContainer.setStartTime(startTime);
		rewardRuleContainer.setEndTime(endTime);
		boolean rs = this.rewardDao.save(rewardRuleContainer);
		if(!rs){
			return false;
		}
		
		List<RewardCardItem> items = reward.getItems();
		for(int i = 0; i < items.size(); i++) {
			if(!flag){
				return false;
			}
			if(StringUtils.isBlank(items.get(i).getTitle()) || items.get(i).getNum() == 0){
				continue;
			}
			RewardCardItem cardItem = new RewardCardItem();
			cardItem.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			cardItem.setContainerId(id);
			cardItem.setTitle(items.get(i).getTitle());
			cardItem.setContent(items.get(i).getContent());
			cardItem.setNum(items.get(i).getNum());
			cardItem.setRemainingNum(items.get(i).getNum());
			cardItem.setWeight(items.get(i).getWeight());
			flag = rewardDao.save(cardItem);
		}
		if(flag && !StringUtils.isBlank(oldReward.getKey())) {
			Rule rule = new Rule();
			rule.setSid(oldReward.getId());
			rule.setHandlerKey(RewardActivity.HANDLER_KEY);
			rule.setsKey(oldReward.getKey());
			rule.setType(Rule.DOMAIN_RULE);
			rule.setDomain(oldReward.getDomain());
			iXinRuleService.addOrUpdate(rule);
		}
		return true;
	}

	@Override
	public List<RewardActivity> getRewardByDomain(String domain, int currPage) {
		// TODO Auto-generated method stub
		List<RewardActivity> list = rewardDao.query(domain, currPage, 20);
		if(null != list && !list.isEmpty()) {
			for (RewardActivity reward : list) {
				long startDate = reward.getStartDate();
				long endDate = reward.getEndDate();
				long nowDate = new Date().getTime();
				if(nowDate >= endDate) {
					reward.setStatus(2);
				} else if(nowDate < startDate) {
					reward.setStatus(0);
				} else if(startDate <= nowDate && nowDate < endDate) {
					reward.setStatus(1);
				}
			}
			return list;
		}
		return null;
	}

	@Override
	public List<RewardCardItem> getAwards(String containerId) {
		// TODO Auto-generated method stub
		List<RewardCardItem> list = rewardDao.queryAwards(containerId);
		if(null != list && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public int getApplyCount(String rewardId, String containerId,String userId) {
		// TODO Auto-generated method stub
		return rewardDao.queryApplyCount(rewardId,containerId, userId);
	}
	
	@Override
	public ApplyRewardVO applyCardReward(String rewardId, String userId,String containerId) {
		// TODO Auto-generated method stub
		
		ApplyRewardVO applyRewardVO = rewardDao.queryWiningRecordByUid(rewardId, userId);
		if(applyRewardVO != null) {
				return null;
		}
		RewardRuleContainer rewardRuleContainer = this.rewardDao.getRuleContainerById(containerId);
		List<RewardCardItem> awards = getAwards(rewardRuleContainer.getId());
		//containerid
		int applyCount = getApplyCount(rewardId,containerId, userId);
		if(rewardRuleContainer.getMaxAttendNum() != 0 && applyCount >= rewardRuleContainer.getMaxAttendNum()) {
			return null;
		}
		ApplyRewardRecord record = new ApplyRewardRecord();
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		record.setId(id);
		record.setApplyDate(new Date().getTime());
		record.setRewardId(rewardId);
		record.setUserId(userId);
		record.setContainerId(containerId);
		record.setIsWining(0);
		boolean flag = rewardDao.saveRecord(record);
		if(!flag) {
			return null;
		}
		int remainingNum = rewardDao.queryAwardsNum(containerId);
		if(remainingNum <= 0)
			return null;
		double rate = rewardRuleContainer.getRewardRate();
		int max = 10000;
		Random random = new Random(new Date().getTime());
		double randNum = (double)(random.nextFloat()*max);
		double lastNum = 0;
		double nextNum = 0;
		for(int i = 0; i < awards.size(); i++) {
			nextNum = (double)(lastNum+((awards.get(i).getRemainingNum()/(float)remainingNum) * rate * max));
			if(awards.get(i).getRemainingNum() <= 0) {
				lastNum = nextNum;
				continue;
			}
			if(randNum > lastNum && randNum <= nextNum) {
				String sncode = generateCheckPass();
				record.setAwardId(awards.get(i).getId());
				record.setSncode(sncode);
				record.setIsWining(1);
				flag = processReward(awards.get(i), record);
				ApplyRewardVO vo = new ApplyRewardVO();
				if(flag) {
					vo.setId(id);
					vo.setAwardId(awards.get(i).getId());
					vo.setAwardTitle(awards.get(i).getTitle());
					vo.setSncode(sncode);
					return vo;
				} else {
					return null;
				}
			}
			lastNum = nextNum;
		}
		return null;
	}
	

	@Override
	public synchronized boolean processReward(RewardCardItem award, ApplyRewardRecord record) {
		// TODO Auto-generated method stub
		RewardCardItem currAward = rewardDao.queryAwardById(award.getId());
		if(currAward.getRemainingNum() <= 0) {
			return false;
		}
		boolean flag = rewardDao.updateRecord(record);
		if(flag) {
			flag = rewardDao.cutAwardRemainingNum(award);
			return flag;
		}
		return false;
	}
	
	  private String generateCheckPass() 
	    { 
	        String rands = ""; 
	        for (int i = 0; i < 6; i++) 
	        { 
	            int rand = (int) (Math.random() * 10); 
	            rands = rands + rand;
	        } 
	        return rands; 
	    }

	@Override
	public ReplyMessage processText(MessageText messageText) {
		// TODO Auto-generated method stub
		List<RewardActivity> list = null;
		String keys = messageText.getContent().toLowerCase();
		if(keys.equalsIgnoreCase(RewardActivity.HANDLER_KEY) || keys.equals(RewardActivity.HANDLER_KEY_CN)) {
			list = getUnclosedReward(messageText.getDomain());
		} else {
			RewardActivity reward = rewardDao.queryByKeys(keys,messageText.getDomain());
			list = new ArrayList<RewardActivity>();
			list.add(reward);
		}
		if(null == list || list.isEmpty()) {
			return DefaultMessageUtil.getDefaultMessage(messageText.getDomain());
		}
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		List<ItemArticle> articles = new ArrayList<ItemArticle>();
		if(list.size() >= 5) {
			replyMessage.setCount(5);
			for(int i = 0; i < 5; i++) {
				ItemArticle article = new ItemArticle();
				RewardActivity reward = list.get(i);
				if(new Date().getTime() < reward.getStartDate()) {
					article.setTitle(reward.getExplain1().getTitle());
					article.setDescription(reward.getExplain1().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain1().getPicUrl() + suffix);
				} else {
					article.setTitle(reward.getExplain2().getTitle());
					article.setDescription(reward.getExplain2().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain2().getPicUrl() + suffix);
				}
				article.setId(reward.getId());
				article.setUrl(rewardBasePath + "rewardId=" + reward.getId() + "&openId=" + messageText.getFromUserName()+ "&domain=" + reward.getDomain()+ "&fdomain=" + reward.getDomain());
				articles.add(article);
			}
		} else {
			replyMessage.setCount(list.size());
			for(int i = 0; i < list.size(); i++) {
				ItemArticle article = new ItemArticle();
				RewardActivity reward = list.get(i);
				if(new Date().getTime() < reward.getStartDate()) {
					article.setTitle(reward.getExplain1().getTitle());
					article.setDescription(reward.getExplain1().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain1().getPicUrl() + suffix);
				} else {
					article.setTitle(reward.getExplain2().getTitle());
					article.setDescription(reward.getExplain2().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain2().getPicUrl() + suffix);
				}
				article.setId(reward.getId());
				article.setUrl(rewardBasePath + "rewardId=" + reward.getId() + "&openId=" + messageText.getFromUserName()+ "&domain=" + reward.getDomain() + "&fdomain=" + reward.getDomain());
				articles.add(article);
			}
		}
		replyMessage.setArticleItems(articles);
		replyMessage.setCreateTime(new Date().getTime());
		replyMessage.setMsgType(Message.REPLY_MESSAGE_NEWS);
		return replyMessage;
	}

	@Override
	public ReplyMessage processEvent(MessageEvent messageEvent) {
		List<RewardActivity> list = null;
		String key = messageEvent.getEventKey();
		if(StringUtils.isBlank(key)){
			key = messageEvent.getEvent();
		}
		if(key.equalsIgnoreCase(RewardActivity.HANDLER_KEY) || key.equals(RewardActivity.HANDLER_KEY_CN)) {
			list = getUnclosedReward(messageEvent.getDomain());
		} else {
			RewardActivity reward = rewardDao.queryByKeys(key,messageEvent.getDomain());
			list = new ArrayList<RewardActivity>();
			list.add(reward);
		}
		if(null == list || list.isEmpty()) {
			return DefaultMessageUtil.getDefaultMessage(messageEvent.getDomain());
		}
	
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		List<ItemArticle> articles = new ArrayList<ItemArticle>();
		if(list.size() >= 5) {
			replyMessage.setCount(5);
			for(int i = 0; i < 5; i++) {
				ItemArticle article = new ItemArticle();
				RewardActivity reward = list.get(i);
				if(new Date().getTime() < reward.getStartDate()) {
					article.setTitle(reward.getExplain1().getTitle());
					article.setDescription(reward.getExplain1().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain1().getPicUrl() + suffix);
				} else {
					article.setTitle(reward.getExplain2().getTitle());
					article.setDescription(reward.getExplain2().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain2().getPicUrl() + suffix);
				}
				article.setId(reward.getId());
				article.setUrl(rewardBasePath + "rewardId=" + reward.getId() + "&openId=" + messageEvent.getFromUserName() + "&domain=" + reward.getDomain() + "&fdomain=" + reward.getDomain());
				articles.add(article);
			}
		} else {
			replyMessage.setCount(list.size());
			for(int i = 0; i < list.size(); i++) {
				ItemArticle article = new ItemArticle();
				RewardActivity reward = list.get(i);
				if(new Date().getTime() < reward.getStartDate()) {
					article.setTitle(reward.getExplain1().getTitle());
					article.setDescription(reward.getExplain1().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain1().getPicUrl() + suffix);
				} else {
					article.setTitle(reward.getExplain2().getTitle());
					article.setDescription(reward.getExplain2().getContent());
					article.setPicUrl(qiniuImageBasePath + reward.getExplain2().getPicUrl() + suffix);
				}
				article.setId(reward.getId());
				article.setUrl(rewardBasePath + "rewardId=" + reward.getId() + "&openId=" + messageEvent.getFromUserName()+ "&domain=" + reward.getDomain() + "&fdomain=" + reward.getDomain());
				articles.add(article);
			}
		}
		replyMessage.setArticleItems(articles);
		replyMessage.setCreateTime(new Date().getTime());
		replyMessage.setMsgType(Message.REPLY_MESSAGE_NEWS);
		return replyMessage;
	} 
	
	@Override
	public ApplyRewardVO doFinishReward(String code, String awardId, String recordId, String tel) {
		// TODO Auto-generated method stub
		if(StringUtils.isBlank(code) || StringUtils.isBlank(awardId) || 
				StringUtils.isBlank(recordId) || StringUtils.isBlank(tel)) {
			return null;
		}
		ApplyRewardRecord record = rewardDao.queryRecord(recordId);
		if(record != null && record.getIsWining() == 1 && !StringUtils.isBlank(record.getSncode()) && 
				code.equals(record.getSncode())){
			record.setPhone(tel);
			boolean flag = rewardDao.updateRecord(record);
			if(flag) {
				RewardCardItem award = rewardDao.queryAwardById(awardId);
				ApplyRewardVO vo = new ApplyRewardVO();
				vo.setAwardId(awardId);
				vo.setAwardTitle(award.getTitle());
				vo.setAwardContent(award.getContent());
				vo.setSncode(record.getSncode());
				vo.setUserId(record.getUserId());
				vo.setId(recordId);
				return vo;
			}
		}
		return null;
	}
	
	@Override
	public List<RewardActivity> getUnclosedReward(String domain) {
		// TODO Auto-generated method stub
		long nowDate = new Date().getTime();
		List<RewardActivity> list = rewardDao.queryByDate(domain, nowDate);
		if(null != list && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public boolean stopRewardActive(String rewardId) {
		// TODO Auto-generated method stub
		RewardActivity reward = getRewardById(rewardId);
		reward.setEndDate(new Date().getTime());
		boolean flag = rewardDao.update(reward);
		return flag;
	}
	
	@Override
	public List<RewardResultVO> getWinners(String rewardId, int currPage) {
		// TODO Auto-generated method stub
		return rewardDao.queryWiningRecord(rewardId, currPage, 20);
	}
	
	@Override
	public ApplyRewardVO getWinnerRecordByUid(String rewardId, String uid) {
		// TODO Auto-generated method stub
		return rewardDao.queryWiningRecordByUid(rewardId, uid);
	}
	
	@Override
	public int getWinCount(String rewardId) {
		// TODO Auto-generated method stub
		return rewardDao.queryWinCount(rewardId);
	}
	
	@Override
	public int getRewardCount(String domain) {
		// TODO Auto-generated method stub
		return rewardDao.queryRewardCount(domain);
	}
	
	@Override
	public boolean deleteRewardById(String id) {
		// TODO Auto-generated method stub
		boolean flag = rewardDao.deleteReward(id);
		if(flag) {
			iXinRuleService.delBySid(id);
		}
		return flag;
	}
	
	@Override
	public boolean modifyRewardFirstStep(RewardActivity reward) {
		// TODO Auto-generated method stub
		RewardActivity oldReward = rewardDao.queryById(reward.getId());
		oldReward.setExplain1(reward.getExplain1());
		oldReward.setExplain2(reward.getExplain2());
		oldReward.setStartDate(reward.getStartDate());
		oldReward.setEndDate(reward.getEndDate());
		oldReward.setKey(reward.getKey());
		oldReward.setReplyContent(reward.getReplyContent());
		oldReward.setRewardType(reward.getRewardType());
		boolean flag = rewardDao.update(oldReward);
		if(flag) {
			if(StringUtils.isBlank(reward.getKey())) {
				iXinRuleService.delBySid(reward.getId());
			} else {
				Rule rule = new Rule();
				rule.setSid(reward.getId());
				rule.setHandlerKey(RewardActivity.HANDLER_KEY);
				rule.setsKey(reward.getKey());
				rule.setType(Rule.DOMAIN_RULE);
				rule.setDomain(reward.getDomain());
				iXinRuleService.addOrUpdate(rule);
			}
		}
		return flag;
	}
	
	@Override
	public String modifyRewardSecondStep(String id, RewardExplain explain) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean modifyRewardThirdStep(RewardActivity reward) {
		// TODO Auto-generated method stub
		RewardActivity oldReward = rewardDao.queryById(reward.getId());
		oldReward.setRewardRate((reward.getRewardRate()/100.0));
		oldReward.setMaxAttendNum(reward.getMaxAttendNum());
		boolean flag = rewardDao.update(oldReward);
		List<RewardItem> items = reward.getItems();
		for(int i = 0; i < items.size(); i++) {
			if(!flag) 
				return false;
			RewardCardItem cardItem = new RewardCardItem();
			String containerId = "";
			cardItem.setContainerId(containerId);
			cardItem.setTitle(items.get(i).getTitle());
			cardItem.setContent(items.get(i).getContent());
			cardItem.setNum(items.get(i).getNum());
			cardItem.setRemainingNum(items.get(i).getNum());
			cardItem.setWeight(items.get(i).getWeight());
			if(!StringUtils.isBlank(items.get(i).getId())) {
				if(!StringUtils.isBlank(items.get(i).getTitle())) {
					cardItem.setId(items.get(i).getId());
					flag = rewardDao.updateAward(cardItem);
				} else {
					flag = rewardDao.deleteAwardById(items.get(i).getId());
				}
				
			} else {
				cardItem.setId(UUID.randomUUID().toString().replaceAll("-", ""));
				flag = rewardDao.save(cardItem);
			}
		}
		return true;
	}

	@Override
	public RewardRuleContainer getRuleContainer(String rewardId) {
		RewardRuleContainer rewardRuleContainer = this.rewardDao.queryRuleContainer(rewardId);
		return rewardRuleContainer;
	}

	@Override
	public List<RewardRuleContainer> getRewardRuleContainers(String rewardId) {
		List<RewardRuleContainer> containers = rewardDao.getRewardRuleContainers(rewardId);
		if(CollectionUtils.isEmpty(containers)){
			return null;
		}
		for(RewardRuleContainer container : containers){
			List<RewardCardItem> items = rewardDao.queryAwards(container.getId());
			container.setRewardRate(container.getRewardRate()*100);
			container.setStartTimeStr(DateUtils.longToString(container.getStartTime(), "yyyy-MM-dd HH:mm"));
			container.setEndTimeStr(DateUtils.longToString(container.getEndTime(), "yyyy-MM-dd HH:mm"));
			container.setItems(items);
		}
		return containers;
	}

	@Override
	public RewardRuleContainer getRewardRuleContainerById(String id) {
		RewardRuleContainer container = rewardDao.getRuleContainerById(id);
		if(container == null){
			return null;
		}
		List<RewardCardItem> items = rewardDao.queryAwards(container.getId());
		container.setRewardRate(container.getRewardRate()*100);
		container.setStartTimeStr(DateUtils.longToString(container.getStartTime(), "yyyy-MM-dd HH:mm"));
		container.setEndTimeStr(DateUtils.longToString(container.getEndTime(), "yyyy-MM-dd HH:mm"));
		container.setItems(items);
		return container;
	}

	@Override
	public boolean updateContainer(RewardRuleContainerVO reward) {
		RewardRuleContainer container = rewardDao.getRuleContainerById(reward.getId());
		container.setMaxAttendNum(reward.getMaxAttendNum());
		container.setRewardRate(reward.getRewardRate()/100.0);
		container.setStartTime(DateUtils.parseStringToLong(reward.getStartTimeStr()));
		container.setEndTime(DateUtils.parseStringToLong(reward.getEndTimeStr()));
		boolean flag = rewardDao.updateContainer(container);
		List<RewardCardItem> items = reward.getItems();
		for(int i = 0; i < items.size(); i++) {
			if(!flag) 
				return false;
			if(StringUtils.isBlank(items.get(i).getTitle()) || items.get(i).getNum() == 0){
				if(StringUtils.isNotBlank(items.get(i).getId())) {
					flag = rewardDao.deleteAwardById(items.get(i).getId());
				}
				continue;
			}
			RewardCardItem cardItem = new RewardCardItem();
			cardItem.setContainerId(container.getId());
			cardItem.setTitle(items.get(i).getTitle());
			cardItem.setContent(items.get(i).getContent());
			cardItem.setNum(items.get(i).getNum());
			cardItem.setRemainingNum(items.get(i).getNum());
			cardItem.setWeight(items.get(i).getWeight());
			if(!StringUtils.isBlank(items.get(i).getId())) {
				if(!StringUtils.isBlank(items.get(i).getTitle())) {
					cardItem.setId(items.get(i).getId());
					flag = rewardDao.updateAward(cardItem);
				} else {
					flag = rewardDao.deleteAwardById(items.get(i).getId());
				}
				
			} else {
				cardItem.setId(IdGenerator.nextId32().toString());
				flag = rewardDao.save(cardItem);
			}
		}
		return true;
	}

	@Override
	public boolean deleteRewardRuleContainer(String id) {
		boolean result = rewardDao.deleteRewardRuleContainer(id);
		return result;
	}

	@Override
	public List<RewardActivity> getRewardByDomainHasKey(String domain,
			int currPage,int pageSize) {
		List<RewardActivity> list = rewardDao.queryHasKey(domain, currPage, pageSize);
		if(null != list && !list.isEmpty()) {
			for (RewardActivity reward : list) {
				long startDate = reward.getStartDate();
				long endDate = reward.getEndDate();
				long nowDate = new Date().getTime();
				if(nowDate >= endDate) {
					reward.setStatus(2);
				} else if(nowDate < startDate) {
					reward.setStatus(0);
				} else if(startDate <= nowDate && nowDate < endDate) {
					reward.setStatus(1);
				}
			}
			return list;
		}
		return null;
	}

	@Override
	public int getRewardCountHasKey(String domain) {
		return rewardDao.queryRewardCountHasKey(domain);
	}

	@Override
	public List<RewardActivity> queryByPage(String name, String domain,
			Page page) {
		return this.rewardDao.queryByPage(name, domain, page);
	}

	@Override
	public List<RewardActivity> getRewardByDomain(String domain,
			int currentpage, int pagesize, String param) {
		return this.rewardDao.getRewardByDomain(domain, currentpage, pagesize, param);
	}

	@Override
	public int getRewardCount(String domain, String param) {
		return this.rewardDao.getRewardCount(domain, param);
	}

}
