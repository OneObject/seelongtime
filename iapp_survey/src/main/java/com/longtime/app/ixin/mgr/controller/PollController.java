package com.longtime.app.ixin.mgr.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.ixin.mgr.controller.PollController.RequestBodyVO.Option;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.model.OptionEntity;
import com.longtime.app.ixin.mgr.model.QuestionEntity;
import com.longtime.app.ixin.mgr.pull.service.PollService;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.model.vote.VoteEntity;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.common.utils.LoginSessionHelper;

/**
 * 投票管理端
 *
 */
@Controller("mgrPollController")
@RequestMapping("/mgr/poll/")
public class PollController {
	@Resource
	private FodderService fodderService;
	
	@Resource
	private PollService pollService;
	
	@Resource(name="iXinRuleService")
	private IXinRuleService iXinRuleService;

	@RequestMapping("index")
	public String index(HttpServletRequest request){
		
		return "mgr/ixin/poll/index";
	}
	
	@RequestMapping("test")
	public String text(){
		
		return "mgr/ixin/poll/add1";
	}
	
	@RequestMapping("add")
	public String add(HttpServletRequest request,ModelMap model){
		model.put("result", fodderService.getRequiredParams());
		return "mgr/ixin/poll/add";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public void del(@RequestParam("voteId") String voteId){
		
		pollService.delVoteById(voteId);
		
	}
	
	@RequestMapping("save")
	@ResponseBody
	public String save(@RequestBody RequestBodyVO vo,HttpServletRequest request)throws Exception{
		
		VoteEntity entity = new VoteEntity();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		entity.setCreateTime(System.currentTimeMillis());
		entity.setTitle(vo.getBaseTitle());
		entity.setCreateUid(LoginSessionHelper.getCurrentUserId(request));
		entity.setCreateUname(LoginSessionHelper.getCurrentUserName(request));
		entity.setFilePath(vo.getCover());
		entity.setModifyTime(System.currentTimeMillis());
		entity.setModifyUid(LoginSessionHelper.getCurrentUserId(request));
		entity.setDomain(LoginSessionHelper.getCurrentDomain(request));
		entity.setModifyUname(LoginSessionHelper.getCurrentUserName(request));
		entity.setDesc(vo.getDesc());
		entity.setStartTime(df.parse(vo.getStartTime()).getTime());
		entity.setEndTime(df.parse(vo.getEndTime()).getTime());
		String voteId = UUID.randomUUID().toString().replaceAll("-", "");
		entity.setId(voteId);
		entity.setKeywords(vo.getKeywords());
		pollService.saveVoteEntity(entity);
		
		QuestionEntity question = new QuestionEntity();
		String questionId = UUID.randomUUID().toString().replaceAll("-", "");
		question.setId(questionId);
		question.setMaxOption(100);
		question.setSortNum(100);
		question.setTitle(vo.getQuestion().getTitle());
		question.setVoteOrSurveyId(voteId);
		
		pollService.saveQuestionEntity(question);
		
		OptionEntity option = null;
		int i = 0;
		for (Option op : vo.getQuestion().getOptions()) {
			option = new OptionEntity();
			option.setFilePath(op.getFilePath());
			option.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			option.setQid(questionId);
			option.setSortNum(i++);
			option.setTitle(op.getTitle());
			pollService.saveOptionEntity(option);
		}
		Rule rule = new Rule();
		rule.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		rule.setsKey(vo.getKeywords());
		rule.setHandlerKey("vote");
		rule.setSid(voteId);
		rule.setDomain(LoginSessionHelper.getCurrentDomain(request));
		rule.setType(Rule.DOMAIN_RULE);
		iXinRuleService.add(rule);
		
		return "";
	}
	public final static class RequestBodyVO{
		private String baseTitle;
		private String startTime;
		private String endTime;
		private String cover;
		private Question question;
		private String desc;
		private String keywords;
		
		public String getKeywords() {
			return keywords;
		}
		public void setKeywords(String keywords) {
			this.keywords = keywords;
		}

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}

		public String getBaseTitle() {
			return baseTitle;
		}

		public void setBaseTitle(String baseTitle) {
			this.baseTitle = baseTitle;
		}

		public String getStartTime() {
			return startTime;
		}

		public void setStartTime(String startTime) {
			this.startTime = startTime;
		}

		public String getEndTime() {
			return endTime;
		}

		public void setEndTime(String endTime) {
			this.endTime = endTime;
		}

		public String getCover() {
			return cover;
		}

		public void setCover(String cover) {
			this.cover = cover;
		}

		public Question getQuestion() {
			return question;
		}

		public void setQuestion(Question question) {
			this.question = question;
		}

		public static class Question{
			private String title;
			private List<Option>  options;
			public String getTitle() {
				return title;
			}
			public void setTitle(String title) {
				this.title = title;
			}
			public List<Option> getOptions() {
				return options;
			}
			public void setOptions(List<Option> options) {
				this.options = options;
			}
 		}
		
		public static class Option{
			private String title;
			private String filePath;
			public String getTitle() {
				return title;
			}
			public void setTitle(String title) {
				this.title = title;
			}
			public String getFilePath() {
				return filePath;
			}
			public void setFilePath(String filePath) {
				this.filePath = filePath;
			}
		}
	}
	
}
