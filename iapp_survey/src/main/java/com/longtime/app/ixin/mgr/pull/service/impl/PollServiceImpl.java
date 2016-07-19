package com.longtime.app.ixin.mgr.pull.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.model.OptionEntity;
import com.longtime.app.ixin.mgr.model.QuestionEntity;
import com.longtime.app.ixin.mgr.pull.dao.PollDao;
import com.longtime.app.ixin.mgr.pull.service.PollService;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.model.vote.VoteEntity;
import com.longtime.app.ixin.protal.poll.vo.OptionVO;
import com.longtime.app.ixin.protal.poll.vo.QuestionVO;
import com.longtime.app.ixin.protal.poll.vo.VoteVO;
import com.longtime.app.ixin.protocol.ItemArticle;
import com.longtime.app.ixin.protocol.MessageEvent;
import com.longtime.app.ixin.protocol.MessageText;
import com.longtime.app.ixin.protocol.ReplyMessage;
import com.longtime.app.ixin.protocol.ReplyMessageNews;
import com.longtime.app.ixin.service.handlers.AbstartMessageHandler;

@Service("pollService")
public class PollServiceImpl extends AbstartMessageHandler implements PollService{

	@Resource
	private PollDao pollDao;
	
	@Value("${com.longtime.ixin.IMAGE_BASE_PATH}")
	private String coverBasePath;
	@Value("${com.longtime.ixin.COVER_SUFFIX}")
	private String suffix;
	@Value("${com.longtime.ixin.voteBasePath}")
	private String voteBasePath;
	
	@Value("${com.longtime.ixin.role.vote}")
	private String voteRole;
	
	@Resource(name="iXinRuleService")
	private IXinRuleService iXinRuleService;
	
	@Override
	public void saveVoteEntity(VoteEntity entity) {
		pollDao.saveVoteEntity(entity);
	}

	@Override
	public void saveQuestionEntity(QuestionEntity question) {
		pollDao.saveQuestionEntity(question);
	}

	@Override
	public void saveOptionEntity(OptionEntity option) {
		pollDao.saveOptionEntity(option);
	}

	@Override
	public VoteVO getVoteVO(String voteId) {
		VoteVO vo = pollDao.getVoteVO(voteId);
		if(vo == null){
			return null;
		}
		
		List<QuestionVO> questions = pollDao.getQuestionVO(vo.getVoteId());
		
		for (QuestionVO v : questions) {
			List<OptionVO> options = pollDao.getOptionVO(v.getQid());
			v.setOptions(options);
		}
		vo.setQuestions(questions);
		
		return vo;
	}

	@Override
	public void updateOptionVoteNum(String selectOptId) {
		pollDao.updateOptionVoteNum(selectOptId);
	}

	@Override
	public void updateVoteUserNum(String voteId) {
		// TODO Auto-generated method stub
		pollDao.updateVoteUserNum(voteId);
	}

	@Override
	public void addToUserVote(String voteId, String openId) {
		pollDao.addToUserVote(voteId,openId);
	}

	@Override
	public boolean checkExits(String openId, String voteId) {
		
		return pollDao.checkExits(openId,voteId);
	}

	@Override
	public VoteVO getVoteVOByVoteId(String voteId) {
		VoteVO vo = pollDao.getVoteVOByVoteId(voteId);
		
		List<QuestionVO> questions = pollDao.getQuestionVos(voteId);
		for (QuestionVO q : questions) {
			List<OptionVO> options = pollDao.getOptionVOs(q.getQid());
			q.setOptions(options);
		}
		
		vo.setQuestions(questions);
		return vo;
	}

	@Override
	public int getTotalSize(String currentDomain) {
		return pollDao.getTotalSize(currentDomain);
	}

	@Override
	public List<VoteVO> queryVoteVOByPage(int currpage, int pageSize,
			String domain) {
		return pollDao.queryVoteVOByPage(currpage,pageSize,domain);
	}

	@Override
	public ReplyMessage processText(MessageText messageText) {
		if(StringUtils.isBlank(voteRole)){
			return null;
		}
		String[] votes = voteRole.split(",");
		List<String> voteList = Arrays.asList(votes);
		
		if(voteList.contains(messageText.getContent())){
			MessageEvent messageEvent = new MessageEvent();
			messageEvent.setDomain(messageText.getDomain());
			messageEvent.setFromUserName(messageText.getFromUserName());
			return processEvent(messageEvent);
		}else{
			//查询一条
			String domain = messageText.getDomain();
			String openId = messageText.getFromUserName();
			String kewwords = messageText.getContent();
			ItemArticle item = pollDao.queryItemArticleByKewWords(kewwords,coverBasePath,suffix,voteBasePath,openId);
			List<ItemArticle> list = new ArrayList<ItemArticle>();
			if(item == null){
				return null;
			}
			
			ReplyMessageNews replyMessage = new ReplyMessageNews();
			replyMessage.setCount(1);
			replyMessage.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
			replyMessage.setDomain(domain);
			replyMessage.setCreateTime(System.currentTimeMillis());
			list.add(item);
			replyMessage.setArticleItems(list);
			
			return replyMessage;
			
		}
		
		
	}

	@Override
	public ReplyMessage processEvent(MessageEvent messageEvent) {
		String domain = messageEvent.getDomain();
		String openId = messageEvent.getFromUserName();
		int itemNum = 5;
		List<ItemArticle> list = pollDao.queryItemArticle(itemNum,coverBasePath,suffix,voteBasePath,openId);
		
		if(list == null || list.size() <= 0){
			return null;
		}
		
		ReplyMessageNews replyMessage = new ReplyMessageNews();
		replyMessage.setCount(list.size());
		replyMessage.setMsgType(ReplyMessage.REPLY_MESSAGE_NEWS);
		replyMessage.setDomain(domain);
		replyMessage.setCreateTime(System.currentTimeMillis());
		
		replyMessage.setArticleItems(list);
		
		return replyMessage;
	}

	@Override
	public void delVoteById(String voteId) {
		pollDao.delVoteById(voteId);
		iXinRuleService.delBySid(voteId);
	}
	
}
