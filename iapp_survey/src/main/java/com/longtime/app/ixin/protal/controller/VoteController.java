package com.longtime.app.ixin.protal.controller;


import com.longtime.app.ixin.mgr.service.IXinUserService;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.collections.MapUtils;
import java.util.Map;
import com.myctu.platform.protocol.transform.json.JacksonSupport;
import com.google.common.collect.Lists;
import com.longtime.ajy.support.service.CreditServiceWrapper;
import com.longtime.app.base.util.Constant;
import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.ixin.model.vote.VoteEventModel;
import com.longtime.app.ixin.protal.WXOauthFilter.Util;
import com.longtime.common.pubsub.PubService;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("protalNewVoteController")
@RequestMapping("/protal/uservote")
public class VoteController {
	private static Logger logger = LoggerFactory.getLogger(VoteController.class);
	@Resource(name="voteService")
	private VoteService voteService;
	
	@Resource
	private PubService pubService;
	
	@Resource(name="iXinUserService")
	private IXinUserService iXinUserService;
    
	@RequestMapping("index")
	public String userVote(@RequestParam("voteId") String voteId,HttpServletRequest request,ModelMap model){
		
		String openId = Util.getCurrentUserOpenIdFromCookie(request);
		if(StringUtils.isBlank(openId)){
			openId = request.getParameter("openId");
		}
		String uid = request.getParameter("uid");
		String domain = Util.getCurrentDomain(request);
		
		if(StringUtils.isBlank(uid) && StringUtils.isNotBlank(openId)){
			uid  = iXinUserService.getUid(openId, domain);
		}
		
		
		boolean exists = voteService.checkUserIsParticipate(voteId,uid);
		if(exists){
			return "forward:result.xhtml?uid="+uid;
		}
		VoteVO vo = voteService.getVoteVOById(voteId);
		model.put("vo", vo);
		List<VoteQuestionVO> questions = vo.getQuestions();
		int singleNumber = 0;
		int multiNumber=0;
		for (VoteQuestionVO voteQuestionVO : questions) {
			if(voteQuestionVO.getType() == 1){
				singleNumber++;
			}
			if(voteQuestionVO.getType()==2){
				multiNumber++;
			}
		}
		//单选题的个数
		if (questions.size()>0&&questions!=null) {
			model.put("questionId", questions.get(0).getId());
		}
		model.put("singleNumber", singleNumber);
		model.put("multiNumber", multiNumber);
		model.put("coverBasePath", voteService.getCoverBasePath());
		model.put("suffix", voteService.getSuffix());
		
		model.put("uid", uid);
		model.put("openId", openId);
		//return "protal/vote/uservote";
		return "protal/vote/detail";
	}
//	@RequestMapping("tomyvote")
//	public String toMyVote(HttpServletRequest request,ModelMap model){
//		
//		String openId = Util.getCurrentUserOpenIdFromCookie(request);
//		String questionId = request.getParameter("questionId");
//		if(StringUtils.isBlank(openId)){
//			openId = request.getParameter("openId");
//		}
//		VoteQuestionVO question = voteService.getVoteQuestionVOByQuestionId(questionId);
//		List<VoteOptionEntity> list = voteService.checkUserIsCreatedOption(questionId, openId);
//		
//		model.put("list", list);
//		model.put("questionId", questionId);
//		model.put("question", question);
//		return "protal/vote/index";
//	}
	
	
	
	@RequestMapping("saveanswer")
	@ResponseBody
	public int saveAnswer(HttpServletRequest request){
		
		String voteId = request.getParameter("voteId");
		String openId = Util.getCurrentUserOpenIdFromCookie(request);
		String uid  = request.getParameter("uid");
		
		if(StringUtils.isBlank(openId)){
			openId = request.getParameter("openId");
		}
		
		String answersStr = request.getParameter("answers");
		
		if(StringUtils.isBlank(uid) || StringUtils.isBlank(voteId)){
			return -1;
		}
		
		String domain = request.getParameter("domain");
		
		
		// 判断是否已经提交过
		boolean exists = voteService.checkUserIsParticipate(voteId,uid);
		
		if(exists){
			return -2;//已经提交过
		}
		@SuppressWarnings("unchecked")
		Map<String,String> answerMap = MapUtils.EMPTY_MAP;
		try{
			if(StringUtils.isNotBlank(answersStr)){
				answerMap = JacksonSupport.decode1(answersStr, Map.class);
			}
		}catch(Exception e){
			logger.error(String.format("str to map due to erroe. str=[%s]", answersStr), e);
		}
		
		if(null==answerMap){
			answerMap = MapUtils.EMPTY_MAP;
		}
		//向用户投票表中插入记录
		voteService.saveUserVote(voteId, uid,openId);
		String[] keyArray = null;
		String qid ;
		int type;
		List<String> options = Lists.newArrayList();
		for(String key:answerMap.keySet()){
			keyArray =  key.split("_");
			if(null==keyArray || keyArray.length!=2){
				continue;
			}
			qid = keyArray[0];
			type = NumberUtils.toInt(keyArray[1]);
			if(StringUtils.isBlank(qid)){
				continue;
			}
			
			
			String answer = answerMap.get(key);
			if(StringUtils.isBlank(answer)){
				continue;
			}
			
			voteService.updateQuestionCount(qid);  // 题目投票数+1
			
			
			VoteActionDetailEntity voteActionDetailEntity = new VoteActionDetailEntity();
			voteActionDetailEntity.setDomain(domain);
			voteActionDetailEntity.setOpenid(openId);
			voteActionDetailEntity.setOptionid(answer);
			voteActionDetailEntity.setQuestionid(qid);
			voteActionDetailEntity.setVoteid(voteId);
			voteActionDetailEntity.setUid(uid);
			// 记录答案
			voteService.saveVoteActionDetail(voteActionDetailEntity);
			
			switch(type){//1单选，2多选，3 问答  4打分题  5段落
				case 1:
				case 2:
					String[] answerList = answer.split(",");
					if(null==answerList){
						break;
					}
					for (String item : answerList) {
						if(StringUtils.isBlank(item)){
							continue;
						}
						options.add(item);
					}
					break;
				case 3:
					break;
				case 4:
					options.add(answer);
					break;
				case 5:
					break;
			}
			
			
		}
		
		 //更新投票数统计
		for (String option : options) {
			
			if(StringUtils.isBlank(option)){
				continue;
			}
			
			
			voteService.updateOptionCount(option); 
		}
		
		
		
		
		
		//投票获取积分
		if(StringUtils.isNotBlank(uid)){
			CreditServiceWrapper.createCreditLog(uid, Constant.CREDIT_ACTION_VOTE, voteId, domain);
		}else{
			CreditServiceWrapper.createCreditLogForOpenId(openId, Constant.CREDIT_ACTION_VOTE, voteId, domain);
		}
		
		if(!options.isEmpty()){
			//mutilcast event
			VoteEventModel event = new VoteEventModel();
			event.setId(voteId);
			event.setOption(options.toArray(new String[0]));
			pub(event);
		}
		
		
		//更新投票信息
		return 1;
	}
	
	
	
	@RequestMapping("save")
	@ResponseBody
	public boolean saveUserVote(HttpServletRequest request){
		String domain = Util.getCurrentDomain(request);;
		String uid = request.getParameter("uid");
		String voteId = request.getParameter("voteId");
		String openId = Util.getCurrentUserOpenIdFromCookie(request);
		String contents=request.getParameter("content");
		
		
		List<String> chooseOpts = Lists.newArrayList();
		String requestStr = request.getParameter("requestStr");
		if(StringUtils.isNotBlank(voteId) && StringUtils.isNotBlank(openId)){
			//向用户投票表中插入记录
			voteService.saveUserVote(voteId,uid, openId);
			String[] requestArr = requestStr.split(",");
			for (String optionId : requestArr) {
				String[] optionid=optionId.split(":");
				if(StringUtils.isNotBlank(optionid[0])){
					VoteActionDetailEntity voteActionDetailEntity=new VoteActionDetailEntity();
					   voteActionDetailEntity=new VoteActionDetailEntity();
			           voteActionDetailEntity.setDomain(domain);
			           voteActionDetailEntity.setOpenid(openId);
			           voteActionDetailEntity.setQuestionid(optionid[2]);
			           voteActionDetailEntity.setOptionid(optionid[0]);
			           voteActionDetailEntity.setUid(uid);
			           voteActionDetailEntity.setVoteid(voteId);
			        this.voteService.saveVoteActionDetail(voteActionDetailEntity);
					voteService.userVote(optionid[0]);
					chooseOpts.add(optionid[0]);
				}
			}
			
			
			//问答题
			if(StringUtils.isNotBlank(contents)){
				String[] content=contents.split(",");
                //保存问答题答案
				for(String strs:content){
                    String[] str=strs.split(":");
                    VoteActionDetailEntity voteActionDetailEntity=new VoteActionDetailEntity();
                    voteActionDetailEntity.setDomain(domain);
                    voteActionDetailEntity.setOpenid(openId);
                    voteActionDetailEntity.setQuestionid(str[1]);
                    voteActionDetailEntity.setOptionid(str[0]);
                    voteActionDetailEntity.setUid(uid);
                    voteActionDetailEntity.setVoteid(voteId);
                    this.voteService.saveVoteActionDetail(voteActionDetailEntity);
				}
				
			}
		}
		//投票获取积分
		if(StringUtils.isNotBlank(uid)){
			CreditServiceWrapper.createCreditLog(uid, Constant.CREDIT_ACTION_VOTE, voteId, domain);
		}else{
			CreditServiceWrapper.createCreditLogForOpenId(openId, Constant.CREDIT_ACTION_VOTE, voteId, domain);
		}
		
		if(!chooseOpts.isEmpty()){
			//mutilcast event
			VoteEventModel event = new VoteEventModel();
			event.setId(voteId);
			event.setOption(chooseOpts.toArray(new String[0]));
			pub(event);
		}
		
		
		//更新投票信息
		return true;
	}
	
	private static final String  channel = "lt.c.vote";
	private void pub(VoteEventModel event){
		pubService.pub4async(channel, event);
	}
	
	
	
	
	
	
	@RequestMapping("result")
	public String result(@RequestParam("voteId")String voteId,ModelMap model,HttpServletRequest request){
		String openId = Util.getCurrentUserOpenIdFromCookie(request);
		if(StringUtils.isBlank(openId)){
			openId = request.getParameter("openId");
		}
		String uid = request.getParameter("uid");
		
		VoteVO vo = voteService.getVoteVOById(voteId);
		List<VoteActionDetailEntity> actionlist=this.voteService.list(uid, voteId);
		
		// add by songsp 2014-05-23
		//计算所有票数
		
		/*long amount = 0;
		if(null!=vo && CollectionUtils.isNotEmpty(vo.getQuestions()) ){
			List<VoteQuestionVO> questions =  vo.getQuestions();
			for(int i=0;i<questions.size();i++){
				VoteQuestionVO question  = questions.get(i);
				
				if(null==question || CollectionUtils.isEmpty(question.getOptions())){
					continue;
				}
				
				List<VoteOptionVO> options = question.getOptions();
				for(int j=0;j<options.size();j++){
					VoteOptionVO  option = options.get(j);
					if(null==option){
						continue;
					}
					amount = amount + option.getVoteNum();
				}
			}
			
		}
		model.put("amount",amount);
		
		*/
		
        model.put("actionlist",actionlist);		
		model.put("vo", vo);
		model.put("coverBasePath", voteService.getCoverBasePath());
		model.put("suffix", voteService.getSuffix());
		model.put("uid",uid);
		
		return "protal/vote/voteresult";
	}
	
	
}
