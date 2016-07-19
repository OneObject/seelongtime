package com.longtime.ajy.student.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.gson.Gson;
import com.longtime.ajy.model.Authorize;
import com.longtime.ajy.model.LabelRelationEntity;
import com.longtime.ajy.model.User;
import com.longtime.ajy.mweb.model.SurveyAndVoteQuestionVo;
import com.longtime.ajy.mweb.model.UserVoteEntity;
import com.longtime.ajy.mweb.model.VoteActionDetailEntity;
import com.longtime.ajy.mweb.model.VoteActivityEntity;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.ajy.mweb.model.VoteOptionEntity;
import com.longtime.ajy.mweb.service.LabelService;
import com.longtime.ajy.mweb.service.NSurveyService;
import com.longtime.ajy.mweb.service.UserVoteService;
import com.longtime.ajy.mweb.service.VoteActivityService;
import com.longtime.ajy.mweb.service.VoteService;
import com.longtime.ajy.session.SessionHelper;
import com.longtime.ajy.student.filter.LocalLoginFilter;
import com.longtime.ajy.student.service.AuthorizeService;
import com.longtime.ajy.student.service.UserService;
import com.longtime.ajy.student.utils.Constants;
import com.longtime.ajy.student.utils.Return;
import com.longtime.ajy.support.HttpServletHelper;
import com.longtime.ajy.support.I18nHelper;
import com.longtime.common.dao.IdGenerator;
import com.longtime.common.model.search.Filter;
import com.longtime.common.model.search.Filter.Joiner;
import com.longtime.common.model.search.Pageable;
import com.longtime.common.model.search.ResultSet;
import com.longtime.common.model.search.Search;
import com.longtime.common.model.search.Sort;
import com.myctu.platform.protocol.transform.json.JacksonSupport;
import com.telecom.ctu.platform.common.cache.CacheService;



/**
 * @since 2013-7-12
 * @author yangwk
 */
@Controller
@RequestMapping("/survey")
public class SurveyController {
	
	private Logger logger = LoggerFactory.getLogger(SurveyController.class);
	
	@Resource
	private VoteService voteService;
	
	@Resource
	private VoteActivityService voteActivityService;
	
	@Resource
	private NSurveyService nSurveyService;
	
	@Resource
	private AuthorizeService authorizeService;
	
	@Resource
	private UserVoteService userVoteService;
	
	@Resource
	private UserService userService;
	
	@Resource(name = "lt.cacheService")
	private CacheService cacheService;
	
	@Resource(name = "labelService")
	private LabelService labelService;

	/**
	 * 调研列表页面
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "index")
	public String index(HttpServletRequest request, ModelMap modelMap) {
		long t = System.currentTimeMillis();
		String domain = SessionHelper.getCurrentDomain();
		Pageable page = HttpServletHelper.assembyPage(request);
		String title = request.getParameter("title");
		Search search = Search.newInstance();
		search.addEqualFilter("domain", domain);
		if(StringUtils.isNotBlank(title)){
			search.addFilter(Filter.like("title", String.format("%%%s%%", title)));
		}
		search.addEqualFilter("isrelease", 2);//已发布
		User user  = SessionHelper.getCurrentUser(request);
		//权限-公开或授权
		Filter filter = Filter.equal("isOpen", 1);
		List<String> rids = authorizeService.listRidByUidAndRcategory(user.getId(), Authorize.R_CATEGORY_VOTE_ACTIVITY, user.getDomain());
		List<String> fromLabelIds = labelService.getRids(user.getLabels(),LabelRelationEntity.RTYPE_SURVEY,user.getDomain());
		rids.addAll(fromLabelIds);
		if(CollectionUtils.isNotEmpty(rids)){
			filter = Joiner.or(filter,Filter.in("id", rids));
		}
		search.addFilter(filter);
		search.addEqualFilter("del", VoteEntity.ISDEL_NO);
		search.addSort(new Sort("weight", true));
		search.addSort(new Sort("createTime", true));
		long count = this.voteActivityService.count(search);
		List<VoteActivityEntity> list = this.voteActivityService.list(search, page);
		ResultSet<VoteActivityEntity> rs = new ResultSet<VoteActivityEntity>(list, page, count);
		List<UserVoteEntity> userVotes = userVoteService.getUserVotes(list,user.getId());
		modelMap.put("rs", rs);
		modelMap.put("current", System.currentTimeMillis());
		modelMap.put("user", user);
		modelMap.put("userVotes", userVotes);
		
		logger.debug(String.format("survey index use time = [%d]", System.currentTimeMillis()-t));
		return "/survey/index";
	} 

	/**
	 * 参加调研页面
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "attend")
	public String attend(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
		long t = System.currentTimeMillis();
		String id = request.getParameter("id");
		String uid = SessionHelper.getCurrentUid();;
		VoteActivityEntity voteActivityEntity = voteActivityService.findOne(id);
		if(voteActivityEntity == null){
			String message = I18nHelper.get(Constants.MESSAGE_SURVEY_UNEXISTS);
			model.put("msg",message);
	        return "message";
		}
		if(voteActivityEntity.getAllowUnLogin() == 0){
			int status = LocalLoginFilter.checkLogin(request, response);
			if(status != LocalLoginFilter.USER_LOGIN){
				redirectLoginView(request, response);
			}
		    String domain = SessionHelper.getCurrentDomain();
		    User user = userService.findOne(uid);
		    if(!domain.equals(user.getDomain())){
		    		model.put("msg","非法请求");
		        return "message";
		    }
			Return re = voteActivityService.checkAuth(voteActivityEntity,user);
			if(Return.CODE_SUCCESS != re.getCode()){
	            model.put("msg", re.getMessage());
	            return "message";
	        }
		} else {
			if(StringUtils.isBlank(uid)){
				uid = SessionHelper.getTmpUid(request);
				if(StringUtils.isBlank(uid)){
					uid = getTmpUid();
					SessionHelper.putTmpUid(request, response, uid);
				}
			}
		}
		
		boolean exists = this.userVoteService.checkUserIsParticipate(id, uid);
		if (exists) {
			return "redirect:/survey/result.xhtml?id="+id;
		}
	    
		List<SurveyAndVoteQuestionVo> questions = voteActivityService.getQuestions(voteActivityEntity);
		if(CollectionUtils.isEmpty(questions)){
			String message = I18nHelper.get(Constants.MESSAGE_NOT_SET_VOTE_QUESTION);
			model.put("msg", message);
            return "message";
		}
		VoteEntity voteEntity = this.voteService.findOne(voteActivityEntity.getVoteId());
		boolean isHasJump = hasJump(questions);
		
		int size = 0;
		List<SurveyAndVoteQuestionVo> list = Lists.newArrayList();
		for (SurveyAndVoteQuestionVo surveyAndVoteQuestionVo : questions) {
			if(surveyAndVoteQuestionVo.getType() != 5){
				size += 1;
				list.add(surveyAndVoteQuestionVo);
			}
		}
		logger.debug(String.format("attend survey use time = [%d]", System.currentTimeMillis()-t));
		model.put("uid", uid);
		model.put("voteEntity", voteEntity);
		model.put("entity", voteActivityEntity);
		model.put("size", size);
		if(isHasJump){
			model.put("list", list);
			return "/survey/fillonebyone";
		}
		model.put("list", questions);
		return "/survey/fillall";
	}
	
	private static void redirectLoginView(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpServletHelper.setCallBackUrl(request);
		response.sendRedirect(String.format("%s%s", request.getContextPath(), LocalLoginFilter.UNAUTH_REDIRECT));
	}
	
	/**
	 * 匿名用户临时id
	 * @author yangwenkui
	 * @time 2016年7月10日 下午12:20:09
	 * @return
	 */
	private String getTmpUid() {
		return String.format("l_%s", IdGenerator.uuid32());
	}

	/**
	 * 是否包含逻辑调整题
	 * @author yangwenkui
	 * @time 2016年6月23日 下午11:10:49
	 * @param questions
	 * @return
	 */
	private boolean hasJump(List<SurveyAndVoteQuestionVo> questions) {
		for (SurveyAndVoteQuestionVo surveyAndVoteQuestionVo : questions) {
			if(surveyAndVoteQuestionVo.getHasjump() == 1){
				return true;
			}
		}
		return false;
	}

	/**
	 * 保存调研结果
	 * @author yangwenkui
	 * @time 2016年6月8日 下午10:32:29
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "saveanswer", method = RequestMethod.POST)
	@ResponseBody
	public int saveAnswer(HttpServletRequest request,HttpServletResponse response) {
		long t = System.currentTimeMillis();
		String activityId = request.getParameter("activityId");
		String voteId = request.getParameter("voteId");
		String uid = SessionHelper.getCurrentUid();
		String answersStr = request.getParameter("answers");
		String allowAnonymous = request.getParameter("allowAnonymous");
		if (StringUtils.isBlank(answersStr)) {
			return -3;
		}
		if (StringUtils.isBlank(voteId) || StringUtils.isBlank(activityId)) {
			return -1;
		}
		
		VoteActivityEntity voteActivityEntity = voteActivityService.findOne(activityId);
		if(voteActivityEntity == null){
	        return -1;
		}
		if(voteActivityEntity.getAllowUnLogin() == 0){
			int status = LocalLoginFilter.checkLogin(request, response);
			if(status != LocalLoginFilter.USER_LOGIN){
				return -5;
			}
		}else if(StringUtils.isBlank(uid)){
			uid = SessionHelper.getTmpUid(request);
			if(StringUtils.isBlank(uid)){
				uid = getTmpUid();
				SessionHelper.putTmpUid(request, response, uid);
			}
		}
		String domain = voteActivityEntity.getDomain();
		// 判断是否已经提交过
		boolean exists = userVoteService.checkUserIsParticipate(activityId, uid);
		if (exists) {
			return -2;// 已经提交过
		}
		
		//避免重复提交
		String cacheKey = String.format("%s_%s", uid,activityId);
		String isProcess = cacheService.get(cacheKey);
		if("1".equals(isProcess)){
			return -2;
		}
		cacheService.put(cacheKey, 120, "1");
		
		Map<String, String> answerMap = MapUtils.EMPTY_MAP;
		try {
			if (StringUtils.isNotBlank(answersStr)) {
				answerMap = JacksonSupport.decode1(answersStr, Map.class);
			}
		} catch (Exception e) {
			logger.error(String.format("str to map due to erroe. str=[%s]",
					answersStr), e);
		}

		if (MapUtils.isEmpty(answerMap)) {
			cacheService.remove(cacheKey);
			return -3;
		}
		try{
			voteService.saveAnswer(activityId,voteId,uid,domain,allowAnonymous,answerMap);
		} catch(Exception e){
			logger.error("save vote answer due to errror", e);
			cacheService.remove(cacheKey);
			return -4;
		}
		logger.debug(String.format("save answer use time = [%d]", System.currentTimeMillis()-t));
		return 1;
	}
	
	/**
	 * 调研结果提示页面
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("prompt")
	public String prompt(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
		String activityId = request.getParameter("id");
		VoteActivityEntity activity = voteActivityService.findOne(activityId);
		if(activity == null){
			String message = I18nHelper.get(Constants.MESSAGE_SURVEY_UNEXISTS);
			model.put("msg",message);
	        return "message";
		}
		if(activity.getAllowUnLogin() == 0){
			int status = LocalLoginFilter.checkLogin(request, response);
			if(status != LocalLoginFilter.USER_LOGIN){
				redirectLoginView(request, response);
			}
		}
		model.put("activity", activity);
		return "/survey/prompt";
	}
	
	/**
	 * 调研结果页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("result")
	public String result(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException {
		long t = System.currentTimeMillis();
		String id = request.getParameter("id");
		String uid = SessionHelper.getCurrentUid();
		if(StringUtils.isBlank(uid)){
			uid = SessionHelper.getTmpUid(request);
		}
		VoteActivityEntity voteActivityEntity = voteActivityService.findOne(id);
		if(voteActivityEntity == null){
			String message = I18nHelper.get(Constants.MESSAGE_SURVEY_UNEXISTS);
			model.put("msg",message);
	        return "message";
		}
		String domain = voteActivityEntity.getDomain();
		if(voteActivityEntity.getAllowUnLogin() == 0){
			int status = LocalLoginFilter.checkLogin(request, response);
			if(status != LocalLoginFilter.USER_LOGIN){
				redirectLoginView(request, response);
			}
			
			User user = userService.findOne(uid);
		    if(!domain.equals(user.getDomain())){
		    		model.put("msg","非法请求");
		        return "message";
		    }
		}
		
		boolean exists = this.userVoteService.checkUserIsParticipate(id, uid);
		if (!exists) {
			String message = I18nHelper.get(Constants.MESSAGE_UNATTEND);
			model.put("msg", message);
            return "message";
		}
		
		List<SurveyAndVoteQuestionVo> questions = voteActivityService.getQuestionsWithStatistics(voteActivityEntity);
		if(CollectionUtils.isEmpty(questions)){
			String message = I18nHelper.get(Constants.MESSAGE_NOT_SET_VOTE_QUESTION);
			model.put("msg", message);
            return "message";
		}
		// 得到问答题
		List<VoteActionDetailEntity> voteActionDetailEntities = this.voteService.getVoteActionDetailEntities(uid, id, domain);
		for(SurveyAndVoteQuestionVo questionVo : questions){
			if(questionVo.getType() == 6){
				VoteActionDetailEntity detail = getDetail(questionVo.getId(),voteActionDetailEntities);
				if(detail == null || StringUtils.isBlank(detail.getOptionid())){
					continue;
				}
				
				Map<String, String> answerMap = getAnswerMap(detail.getOptionid());
				for(VoteOptionEntity option : questionVo.getVoteOptionEntities()){
					option.setContent(answerMap.get(option.getId()));
				}
			}
		}
		
		boolean isShowResult = false;
		if(voteActivityEntity.getShowresult() ==1 && (voteActivityEntity.getEndTime() == 0 || System.currentTimeMillis()>voteActivityEntity.getEndTime())){
			isShowResult = true;
		}
		logger.debug(String.format("show result use time = [%d]", System.currentTimeMillis()-t));
		model.put("voteActionDetailEntities", voteActionDetailEntities);
		model.put("surveyAndVoteQuestionVos", questions);
		model.put("uid", uid);
		model.put("entity", voteActivityEntity);
		model.put("isShowResult", isShowResult);
		return "/survey/result";
	}
	
	/**
	 * @author yangwenkui
	 * @time 2016年6月26日 下午3:53:18
	 * @param openid
	 * @return
	 */
	private Map<String, String> getAnswerMap(String answerStr) {
		String[] items = answerStr.split(",#q#");
		if(ArrayUtils.isEmpty(items)){
			return Maps.newHashMap();
		}
		Map<String, String> answerMap = Maps.newHashMap();
		for(String item : items){
			if(StringUtils.isEmpty(item) || !item.contains(",#o#")){
				continue;
			}
			String[] arr = item.split(",#o#");
			answerMap.put(arr[0], arr[1]);
		}
		return answerMap;
	}
	
	public static void main(String[] args) {
		SurveyController entity = new SurveyController();
		Gson gson = new Gson();
		System.out.println(gson.toJson(entity.getAnswerMap("d32b98bf14c34a5cb1cd516578c8215b,#o#test,#q#06562d7b823740929ce8772013305057,#o#27,#q#")));
	}


	/**
	 * @author yangwenkui
	 * @time 2016年6月26日 下午3:47:41
	 * @param id
	 * @param voteActionDetailEntities
	 * @return
	 */
	private VoteActionDetailEntity getDetail(String id, List<VoteActionDetailEntity> voteActionDetailEntities) {
		for (VoteActionDetailEntity voteActionDetailEntity : voteActionDetailEntities) {
			if(id.equals(voteActionDetailEntity.getQuestionid())){
				return voteActionDetailEntity;
			}
		}
		return null;
	}

	/**
	 * 调研列表页面
	 * 
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "mysurvey")
	public String mySurvey(HttpServletRequest request, ModelMap modelMap) {
		Pageable page = HttpServletHelper.assembyPage(request);
		String uid = SessionHelper.getCurrentUid();
		String domain = SessionHelper.getCurrentDomain();
		ResultSet<VoteActivityEntity> rs = this.voteActivityService.getMyAttendVote(domain,uid,page);
		modelMap.put("rs", rs);
		return "/survey/mysurvey";
	} 

	
}
