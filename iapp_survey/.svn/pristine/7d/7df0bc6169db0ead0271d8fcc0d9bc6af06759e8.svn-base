package com.longtime.app.ixin.mgr.survey.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.survey.model.Survey;
import com.longtime.app.ixin.mgr.survey.model.SurveyJumpStrategy;
import com.longtime.app.ixin.mgr.survey.model.SurveyOption;
import com.longtime.app.ixin.mgr.survey.model.SurveyQuestion;
import com.longtime.app.ixin.mgr.survey.model.SurveyQuestionType;
import com.longtime.app.ixin.mgr.survey.service.SurveyJumpStrategyService;
import com.longtime.app.ixin.mgr.survey.service.SurveyQuestionService;
import com.longtime.app.ixin.mgr.survey.service.SurveyService;
import com.longtime.app.ixin.utils.DateUtil;
import com.longtime.app.util.IdGenerator;
import com.longtime.common.utils.LoginSessionHelper;

@Controller
@RequestMapping("/mgr/survey")
public class SurveyController {

	@Resource(name ="surveyService")
	private SurveyService surveyService;
	
	@Resource(name="surveyQuestionService")
	private SurveyQuestionService surveyQuestionService;
	
	@Resource(name="fodderService")
	private FodderService fodderService;
	
	@Resource(name="jumpStrategyService")
	private SurveyJumpStrategyService jumpStrategyService;
	/**
	 * 添加调研
	 */
	@RequestMapping("add")
	public String add(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		Map<String,String> map = fodderService.getRequiredParams();
		modelMap.put("result", map);
		return "mgr/survey/add";
	}
	/**
	 * 保存基本信息
	 */
	@RequestMapping("savebasicinfo")
	@ResponseBody
	public ModelMap saveBasicInfo(HttpServletRequest request,ModelMap modelMap){
		String id = IdGenerator.nextId32().toString();
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String title = request.getParameter("title");
		String remark = request.getParameter("remark");
		String cover = request.getParameter("cover");
		
		Survey survey = new Survey();
		survey.setId(id);
		survey.setCover(cover);
		survey.setRemark(remark);
		survey.setTitle(title);
		survey.setDomain(domain);
		survey.setCreator(LoginSessionHelper.getCurrentUserId(request));
		survey.setCreate_time(System.currentTimeMillis());
		survey.setPage_num(1);
		survey.setWeight(System.currentTimeMillis());
		
		boolean result = surveyService.add(survey);	
		
		modelMap.put("result", result);
		modelMap.put("id", id);
		return modelMap;
	}
	
	/**
	 * 调研内容添加
	 */
	@RequestMapping("add_detail")
	public String toadd_detail(HttpServletRequest request,ModelMap modelMap){
		String id = request.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		Survey survey = surveyService.findById(id, domain);
		modelMap.put("survey", survey);

		List<SurveyQuestion> list = surveyQuestionService.findBySurveyId(id, domain);
		List<SurveyJumpStrategy> jumpStrategies = getAllLogic(id,domain);
		
		modelMap.put("list", sortQuestionList(list));
		modelMap.put("logicnum",getLogicNum(list,domain));
		modelMap.put("jumpstrategies", jumpStrategies);
		
		Map<String,String> map = fodderService.getRequiredParams();
		modelMap.put("result", map);
		return "/mgr/survey/add_detail";
	}
	/**
	 * 删除调研
	 */
	@RequestMapping("delete")
	@ResponseBody
	public boolean delete(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		String id = request.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		boolean result = surveyService.delete(id,domain);
		return result;
	}
	
	/**
	 * 修改调研标题
	 */
	@RequestMapping("update/title")
	@ResponseBody
	public ModelMap updateTitle(HttpServletRequest request,ModelMap modelMap){
		String id = request.getParameter("id");
		String title =request.getParameter("title");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Survey survey = surveyService.findById(id,domain);
		if (null==survey) {
			modelMap.put("result", false);
			return modelMap;
		}
		if(!VerifyUniqueness(id,title)){
			modelMap.put("result", false);
			return modelMap;
		}
		survey.setTitle(title);
		boolean result = surveyService.update(survey,domain);
		modelMap.put("result", result);
		return modelMap;
	}
	
	/**
	 * 修改调研封面
	 */
	@RequestMapping("update/cover")
	@ResponseBody
	public boolean updateCover(HttpServletRequest request,ModelMap modelMap){
		String id = request.getParameter("id");
		String cover =request.getParameter("cover");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Survey survey = surveyService.findById(id,domain);
		if (null==survey) {
			return false;
		}
		survey.setCover(cover);
		boolean result = surveyService.update(survey,domain);
		return result;
	}
	/**
	 * 发布调研
	 */
	@RequestMapping("do/release")
	@ResponseBody
	public boolean Release(HttpServletRequest request,ModelMap modelMap){
		String surveyid = request.getParameter("surveyId");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Survey survey = surveyService.findById(surveyid, domain);
		if (null==survey) {
			return false;
		}
		survey.setRelease_status(1);
		boolean result = surveyService.update(survey, domain);
		return result;
		
	}
	
	/**
	 * 验证调研标题唯一性
	 */
	private boolean VerifyUniqueness(String id,String title){
		boolean result = surveyService.verifyUniqueness(id, title);
		return result;
	}
	/**
	 * 修改调研简介
	 */
	@RequestMapping("update/remark")
	@ResponseBody
	public boolean updateRemark(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		String remark =request.getParameter("remark");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		Survey survey = surveyService.findById(id,domain);
		if (null==survey) {
			return false;
		}
		survey.setRemark(remark);
		boolean result = surveyService.update(survey,domain);
		return result;
	}
	
	/**
	 * 修改结束提示信息
	 */
	@RequestMapping("update/prompt")
	@ResponseBody
	public boolean updatePrompt(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		String prompt =request.getParameter("prompt");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		Survey survey = surveyService.findById(id,domain);
		if (null==survey) {
			return false;
		}
		survey.setTitle(prompt);
		boolean result = surveyService.update(survey,domain);
		return result;
	}
	/**
	 * 试题添加
	 * 点击添加、拖拽添加 、因设置逻辑被动添加分页三种添加方式所需的参数不同
	 * 点击 ："id":调研Id,"title_num":题目号,"type":类型,"page_num":页码
	 * 被动添加分页："id":调研Id,"page_num":页码,"type":"fenye","before_ID":before_ID
	 * 拖拽添加："id":调研Id,"page_num":页码,"type":类型,"before_ID":前一个,"nextid":后一个,"drag":拖拽标记,"nextAllIds":后面所有的ID，
	 * "prev_qid":前面的非分页题目ID
	 */
	@RequestMapping("question/add")
	@ResponseBody
	public ModelMap addQuestion(HttpServletRequest request,ModelMap modelMap){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String id = request.getParameter("id");
		String title_num = request.getParameter("title_num");
		String type = request.getParameter("type");
		String page_num = request.getParameter("page_num");
		//在中间插入添加时上一条的ID
		String before_ID =request.getParameter("before_ID");
		//拖拽标记
		String drag = request.getParameter("drag");
		//拖拽添加时候的插入下面的一条数据
		String nextid= request.getParameter("nextid");
		String nextAllIds =request.getParameter("nextAllIds");
		//上一个非分页的问题
		String prev_qid = request.getParameter("prev_qid");
		String[] ids = null;
		if (StringUtils.isNotBlank(nextAllIds)&&nextAllIds.length()>1) {
			nextAllIds = nextAllIds.substring(1);
			ids = nextAllIds.split(",");
		}
		
		Survey survey = surveyService.findById(id,domain);
		long weight = System.currentTimeMillis();
		if (null==survey) {
			modelMap.put("result", false);
			return modelMap;
		}
		//上一个题目（包括分页）
		SurveyQuestion question_before = surveyQuestionService.findById(before_ID, domain);
		if (null!=question_before) {
			weight = question_before.getWeight()+1;
		}
		//拖拽添加 上一个为空  用后一个确定排序值
		if("first".equals(before_ID)){
			if (StringUtils.isNotEmpty(nextid)&&!"last".equals(nextid)) {
				SurveyQuestion question_after = surveyQuestionService.findById(nextid, domain);
				if(null!=question_after){
					weight = question_after.getWeight()-1;
				}
			}
		}
		//上一个题目（不包括分页）
		SurveyQuestion expect_fQuestion =surveyQuestionService.findById(prev_qid, domain);
		if("drag".equals(drag)){
			if(null!=expect_fQuestion){
				title_num = (expect_fQuestion.getTitle_num()+1)+"";
			}else{
				title_num = "1";
			}
		}
		SurveyQuestion question = new SurveyQuestion();
		question.setId(IdGenerator.nextId32().toString());
		question.setSurvey_id(id);
		question.setWeight(weight);
		question.setDomain(domain);
		if (StringUtils.isNumeric(page_num)) {
			question.setPage_num(Integer.parseInt(page_num));
		}
		if (StringUtils.isNumeric(title_num)) {
			question.setTitle_num(Integer.valueOf(title_num));
		}
		question.setCreate_time(System.currentTimeMillis());
		question.setCreator(LoginSessionHelper.getCurrentUserId(request));
		
		if (type.equals(SurveyQuestionType.DANXUAN.toString())) {
			question.setTitle("请输入该单选题题目");
			question.setType(SurveyQuestionType.DANXUAN.getVaule());
			addDefaultOption(domain,LoginSessionHelper.getCurrentUserId(request),modelMap,question,false);
		}else if (type.equals(SurveyQuestionType.DUOXUAN.toString())) {
			question.setTitle("请输入该多选题题目");
			question.setType(SurveyQuestionType.DUOXUAN.getVaule());
			addDefaultOption(domain,LoginSessionHelper.getCurrentUserId(request),modelMap,question,false);
		}else if (type.equals(SurveyQuestionType.WENDA.toString())){
			question.setTitle("请输入该问答题题目");
			question.setType(SurveyQuestionType.WENDA.getVaule());
		}else if (type.equals(SurveyQuestionType.DAFEN.toString())) {
			question.setTitle("请输入该打分题题目");
			question.setType(SurveyQuestionType.DAFEN.getVaule());
			question.setMin_score(1);
			question.setMax_score(5);
			addDefaultOption(domain,LoginSessionHelper.getCurrentUserId(request),modelMap,question,false);
		}else if (type.equals(SurveyQuestionType.JZDANXUAN.toString())) {
			question.setTitle("请输入该矩阵单选题题目");
			question.setType(SurveyQuestionType.JZDANXUAN.getVaule());
			//添加矩阵列
			addDefaultOption(domain,LoginSessionHelper.getCurrentUserId(request),modelMap,question,true);
			//添加矩阵行
			addDefaultMatrixOption(domain,LoginSessionHelper.getCurrentUserId(request),modelMap,question);
		}else if (type.equals(SurveyQuestionType.JZDUOXUAN.toString())) {
			question.setTitle("请输入该矩阵多选题题目");
			question.setType(SurveyQuestionType.JZDUOXUAN.getVaule());
			//添加矩阵列
			addDefaultOption(domain,LoginSessionHelper.getCurrentUserId(request),modelMap,question,true);
			//添加矩阵行
			addDefaultMatrixOption(domain,LoginSessionHelper.getCurrentUserId(request),modelMap,question);
		}else if (type.equals(SurveyQuestionType.DUANLUO.toString())) {
			question.setTitle("请输入该段落说明的内容");
			question.setType(SurveyQuestionType.DUANLUO.getVaule());
		}else if(type.equals(SurveyQuestionType.FENYE.toString())){
			question.setType(SurveyQuestionType.FENYE.getVaule());
			survey.setPage_num(survey.getPage_num()+1);
			surveyService.update(survey, domain);
		}
		
		boolean result = surveyQuestionService.add(question);
		
		//拖拽添加后把后面的问题的pagenum、weight、titlenum对应更改
		if (result&&"drag".equals(drag)&&null!=ids) {
			if (question.getType()!=9) {
				result = surveyQuestionService.batchupdate(ids, domain,0,1,1);
			}else {
				result = surveyQuestionService.batchupdate(ids, domain, 1,1,1);
			}
		}
		
		modelMap.put("result", result);
		//拖拽专用
		modelMap.put("titlenum", question.getTitle_num());
		modelMap.put("id", question.getId());
		
		return modelMap;
	}
	
	/**
	 * 修改试题题目
	 */
	@RequestMapping("question/update/title")
	@ResponseBody
	public boolean updateQustionTitle(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		SurveyQuestion surveyQuestion = surveyQuestionService.findById(id,domain);
		if(null==surveyQuestion){
			return false;
		}
		
		surveyQuestion.setTitle(title);
		boolean result = surveyQuestionService.update(surveyQuestion);
		
		return result;
	}
	/**
	 * 获取题目详情
	 */
	@RequestMapping("question/detail")
	@ResponseBody
	public SurveyQuestion QustionDetail(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("qid");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		SurveyQuestion surveyQuestion = surveyQuestionService.findById(id,domain);
		return surveyQuestion;
	}
	
	/**
	 * 删除试题
	 */
	@RequestMapping("question/delete")
	@ResponseBody
	public boolean deleteQuestion(HttpServletRequest request,HttpServletResponse response){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String id = request.getParameter("id");
		String surveyid = request.getParameter("surveyid");
		String prev_id = request.getParameter("prev_id");
		
		SurveyQuestion surveyQuestion = surveyQuestionService.findById(id, domain);
		if (null!=surveyQuestion&&surveyQuestion.getType()==SurveyQuestionType.FENYE.getVaule()) {//删除分页的时候把后面的页码都减1,survey分页数减一
			List<SurveyQuestion> list = surveyQuestionService.findByGtPage(surveyid,surveyQuestion.getPage_num(), domain);
			if (null!=list) {
				for (Iterator<SurveyQuestion> iterator = list.iterator();iterator.hasNext();) {
					SurveyQuestion question = iterator.next();
					question.setPage_num(question.getPage_num()-1);
					surveyQuestionService.update(question);
				}
			}
			
			Survey survey = surveyService.findById(surveyid, domain);
			if (null!=survey) {
				survey.setPage_num(survey.getPage_num()-1);
				surveyService.update(survey, domain);
			}
			
			if (StringUtils.isNotEmpty(prev_id)&&!"null".equals(prev_id)) {
				jumpStrategyService.delete(surveyid, prev_id, domain);
			}
		}
		boolean result = surveyQuestionService.delete(id,domain);
		return result;
	}
	
	/**
	 * 试题上下交换排序
	 */
	@RequestMapping("question/order/swap")
	@ResponseBody
	public boolean questionOrderSwap(HttpServletRequest request,HttpServletResponse response){
		String qid1 = request.getParameter("id1");
		String qid2 = request.getParameter("id2");
		String domian = LoginSessionHelper.getCurrentDomain(request);
		boolean result = surveyQuestionService.exchangeWeight(qid1, qid2,domian);
		
		return result;
	}
	
	/**
	 * 试题拖动排序
	 */
	@RequestMapping("question/order/drag")
	@ResponseBody
	public boolean questionOrderDrag(HttpServletRequest request,ModelMap map){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String survey_id = request.getParameter("survey_id");
		String currentId = request.getParameter("currentId");
		String toPrevId = request.getParameter("toPreviId");//移动后   前一个元素的ID
		String toNextId = request.getParameter("toNextId");//移动后    后一个元素的ID
		
		SurveyQuestion currentQuestion = surveyQuestionService.findById(currentId, domain);
		SurveyQuestion prevQuestion = surveyQuestionService.findById(toPrevId, domain);
		SurveyQuestion nextQuestion = surveyQuestionService.findById(toNextId, domain);
		long current_weight=0,prev_weight = 0,next_weight= 0;
		if (null==currentQuestion) {
			return false;
		}
		current_weight = currentQuestion.getWeight();
		if (null!=prevQuestion) {
			prev_weight = prevQuestion.getWeight();
		}
		if (null!=nextQuestion) {
			next_weight = nextQuestion.getWeight();
		}
		
		List<SurveyQuestion> acrossList = null; //移动前后跨过的元素
		List<SurveyQuestion> afterList = null; // 移动前后面的元素
		//向上移动
		if (("first".equals(toPrevId)&&null!=nextQuestion)||(null!=nextQuestion&&null!=prevQuestion&&next_weight<=current_weight)) {
			acrossList = surveyQuestionService.findByWeight(survey_id, domain, prev_weight, current_weight);
			afterList = surveyQuestionService.findByWeight(survey_id, domain, current_weight, 0);
			if (null!=prevQuestion) {
				currentQuestion.setWeight(prev_weight+1);
			}else {
				currentQuestion.setWeight(next_weight-1);
			}
			currentQuestion.setPage_num(nextQuestion.getPage_num());
			boolean r1 = surveyQuestionService.update(currentQuestion);
			if (!r1) {
				return r1;
			}
			String[] acrossids = getidsFromList(acrossList);
			String[] afterids = getidsFromList(afterList);
			
			if (currentQuestion.getType()!=SurveyQuestionType.FENYE.getVaule()) {
				if (acrossids.length>0) {
					boolean r2 = surveyQuestionService.batchupdate(acrossids, domain, 0, 1, 0);
					if (!r2) {
						return r2;
					}
				}
				if (afterids.length>0) {
					boolean r3 = surveyQuestionService.batchupdate(afterids, domain, 0, 1, 0);
					if (!r3) {
						return r3;
					}
				}
				return true;
			}else {
				if (acrossids.length>0) {
					boolean r2 = surveyQuestionService.batchupdate(acrossids, domain, 1, 1, 0);
					if (!r2) {
						return r2;
					}
				}
				if (afterids.length>0) {
					boolean r3 = surveyQuestionService.batchupdate(afterids, domain, 0, 1, 0);
					if (!r3) {
						return r3;
					}
				}
				return true;
			}
			
		}
		//向下移动
		if (("last".equals(toNextId)&&null!=prevQuestion)||(null!=nextQuestion&&null!=prevQuestion&&prev_weight>current_weight)) {
			acrossList = surveyQuestionService.findByWeight(survey_id, domain, current_weight,next_weight);
			afterList = surveyQuestionService.findByWeight(survey_id, domain, next_weight, 0);
			
			currentQuestion.setWeight(prev_weight+1);
			if (prevQuestion.getType()==SurveyQuestionType.FENYE.getVaule()) {
				if (currentQuestion.getType()==SurveyQuestionType.FENYE.getVaule()) {
					currentQuestion.setPage_num(prevQuestion.getPage_num());
				}else{
					currentQuestion.setPage_num(prevQuestion.getPage_num()+1);
				}
			}else {
				if (currentQuestion.getType()==SurveyQuestionType.FENYE.getVaule()) {
					currentQuestion.setPage_num(prevQuestion.getPage_num()-1);
				}else{
					currentQuestion.setPage_num(prevQuestion.getPage_num());
				}
			}
			boolean r1 = surveyQuestionService.update(currentQuestion);
			if (!r1) {
				return r1;
			}
			String[] acrossids = getidsFromList(acrossList);
			String[] afterids = getidsFromList(afterList);
			
			if (currentQuestion.getType()!=SurveyQuestionType.FENYE.getVaule()) {
				
				if (afterids.length>0) {
					boolean r3 = surveyQuestionService.batchupdate(afterids, domain, 0, 1, 0);
					if (!r3) {
						return r3;
					}
				}
				return true;
			}else {
				
				if (acrossids.length>0) {
					boolean r2 = surveyQuestionService.batchupdate(acrossids, domain, -1, 0, 0);
					if (!r2) {
						return r2;
					}
				}
				if (afterids.length>0) {
					boolean r3 = surveyQuestionService.batchupdate(afterids, domain, 0, 1, 0);
					if (!r3) {
						return r3;
					}
				}
				return true;
			}
		}
		
		return true;
	}
	/**
	 * 	批量修改题目序号
	 */
	@RequestMapping("question/batchupdate/title_num")
	@ResponseBody
	public boolean questionBatchUpdate(HttpServletRequest request,ModelMap map){
		String ids = request.getParameter("ids");
		String title_nums = request.getParameter("title_nums");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String[] id = null;
		String[] title_num = null;
		if (StringUtils.isNotBlank(ids)) {
			id = ids.split("_");
		}
		if (StringUtils.isNotBlank(title_nums)) {
			title_num = title_nums.split("_");
		}
		boolean result = false;
		for (int i = 0; i < id.length; i++) {
			SurveyQuestion surveyQuestion = surveyQuestionService.findById(id[i], domain);
			if (StringUtils.isNumeric(title_num[i])) {
				surveyQuestion.setTitle_num(Integer.valueOf(title_num[i]));
			}
			result = surveyQuestionService.update(surveyQuestion);
		}
		return result;
	}
	/**
	 * 	修改题目序号
	 */
	@RequestMapping("question/update/title_num")
	@ResponseBody
	public boolean questionUpdate(HttpServletRequest request,ModelMap map){
		String id = request.getParameter("id");
		String title_num = request.getParameter("title_num");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		SurveyQuestion surveyQuestion = surveyQuestionService.findById(id, domain);
		if (StringUtils.isNumeric(title_num)) {
			surveyQuestion.setTitle_num(Integer.valueOf(title_num));
		}
		boolean result = surveyQuestionService.update(surveyQuestion);
		return result;
	}
	
	
	
	/**
	 * 试题设置修改
	 */
	@RequestMapping("question/setting")
	@ResponseBody
	public boolean questionSetting(HttpServletRequest request,ModelMap map){
		String qid = request.getParameter("qid");
		String allow_skip = request.getParameter("allow_skip");
		String op_random = request.getParameter("op_random");
		String changeType = request.getParameter("changetype");
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		SurveyQuestion question = surveyQuestionService.findById(qid,domain);
		if (null==question) {
			return false;
		}
		if(StringUtils.isNumeric(op_random)){
			question.setOp_random(Integer.valueOf(op_random));
		}
		if (StringUtils.isNumeric(allow_skip)) {
			question.setAllow_skip(Integer.valueOf(allow_skip));
		}
		if (changeType.equals("1")) {
			switch (question.getType()) {
			case 1:
				question.setType(2);
				break;
			case 2:
				question.setType(1);
				break;
			case 5:
				question.setType(6);
				break;
			case 6:
				question.setType(5);
				break;
			default:
				break;
			}
		}
		boolean result = surveyQuestionService.update(question);
		
		return result;
	}
	
	/**
	 * 打分题目设置修改
	 */
	@RequestMapping("question/scoresetting")
	@ResponseBody
	public boolean questionScoreSetting(HttpServletRequest request,ModelMap map){
		String qid = request.getParameter("qid");
		String  min_score =request.getParameter("min_score");
		String  max_score = request.getParameter("max_score");
		String left_info = request.getParameter("left_info");
		String middle_info =request.getParameter("middle_info");
		String right_info = request.getParameter("right_info");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		SurveyQuestion question = surveyQuestionService.findById(qid,domain);
		if (null==question) {
			return false;
		}
		if (StringUtils.isNumeric(min_score)) {
			question.setMin_score(Integer.valueOf(min_score));
		}
		if (StringUtils.isNumeric(max_score)) {
			question.setMax_score(Integer.valueOf(max_score));
		}
		
		question.setLeft_tip(left_info);
		question.setMiddle_tip(middle_info);
		question.setRight_tip(right_info);
		boolean result = surveyQuestionService.update(question);
		
		return result;
	}
	
	/**
	 * 添加选项
	 */
	@RequestMapping("option/add")
	@ResponseBody
	public ModelMap addOption(HttpServletRequest request,ModelMap modelMap){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String question_id = request.getParameter("question_id");
		String content=request.getParameter("content");
		
		SurveyQuestion surveyQuestion = surveyQuestionService.findById(question_id, domain);
		if (null==surveyQuestion) {
			modelMap.put("result", false);
			return modelMap;
		}
		
		SurveyOption surveyOption = new SurveyOption();
		surveyOption.setId(IdGenerator.nextId32().toString());
		surveyOption.setDomain(domain);
		surveyOption.setCreate_time(System.currentTimeMillis());
		surveyOption.setCreator(LoginSessionHelper.getCurrentUserId(request));
		surveyOption.setContent(content);
		surveyOption.setWeight(System.currentTimeMillis());
		
		List<SurveyOption> list = surveyQuestion.getOptions();
		if (CollectionUtils.isEmpty(list)) {
			list = new ArrayList<SurveyOption>();
		}
		list.add(surveyOption);
		surveyQuestion.setOptions(list);
		
		boolean result = surveyQuestionService.update(surveyQuestion);
		modelMap.put("result", result);
		modelMap.put("id", surveyOption.getId());
		return modelMap;
	}
	
	/**
	 * 批量添加选项
	 */
	@RequestMapping("option/add_matrix_option")
	@ResponseBody
	public ModelMap addMatrix(HttpServletRequest request,ModelMap modelMap){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String question_id = request.getParameter("question_id");
		String content=request.getParameter("content");
		
		SurveyQuestion surveyQuestion = surveyQuestionService.findById(question_id, domain);
		if (null==surveyQuestion) {
			modelMap.put("result", false);
			return modelMap;
		}
		
		SurveyOption surveyOption = new SurveyOption();
		surveyOption.setId(IdGenerator.nextId32().toString());
		surveyOption.setDomain(domain);
		surveyOption.setCreate_time(System.currentTimeMillis());
		surveyOption.setCreator(LoginSessionHelper.getCurrentUserId(request));
		surveyOption.setContent(content);
		surveyOption.setWeight(System.currentTimeMillis());
		
		List<SurveyOption> list = surveyQuestion.getMatrix_options();
		if (CollectionUtils.isEmpty(list)) {
			list = new ArrayList<SurveyOption>();
		}
		list.add(surveyOption);
		surveyQuestion.setMatrix_options(list);
		
		boolean result = surveyQuestionService.update(surveyQuestion);
		modelMap.put("result", result);
		modelMap.put("id", surveyOption.getId());
		return modelMap;
	}
	
	/**
	 * 修改选项内容
	 */
	@RequestMapping("option/update/content")
	@ResponseBody
	public boolean updateOptionContent(HttpServletRequest request,ModelMap modelMap){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String question_id = request.getParameter("question_id");
		String content=request.getParameter("content");
		String option_id = request.getParameter("option_id");
		String isMatrix = request.getParameter("ismatrix");
		
		SurveyQuestion surveyQuestion = surveyQuestionService.findById(question_id, domain);
		if (null==surveyQuestion) {
			return false;
		}
		List<SurveyOption> list = null;
		if (isMatrix!=null&&isMatrix.equals("yes")) {//修改矩阵行选项内容
			 list = surveyQuestion.getMatrix_options();
		}else{
			 list = surveyQuestion.getOptions();
		}
		
		if (CollectionUtils.isEmpty(list)) {
			return false;
		}
		for (SurveyOption surveyOption: list) {
			if (surveyOption.getId().equals(option_id)) {
				surveyOption.setContent(content);
			}
		}
		boolean result = surveyQuestionService.update(surveyQuestion);
		
		return result;
	}
	
	/**
	 * 选项删除
	 */
	@RequestMapping("option/delete")
	@ResponseBody
	public boolean deleteOption(HttpServletRequest request,HttpServletResponse response){
		String qid = request.getParameter("qid");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String id = request.getParameter("id");
		SurveyQuestion question = surveyQuestionService.findById(qid, domain);
		if (null==question||CollectionUtils.isEmpty(question.getOptions())) {
			return false;
		}
		for (Iterator<SurveyOption> iterator = question.getOptions().iterator();iterator.hasNext();) {
			if (id.equals(iterator.next().getId())) {
				iterator.remove();
			}
		}
		
		boolean result = surveyQuestionService.update(question);
		return result;
	}
	/**
	 * 选项matrix删除
	 */
	@RequestMapping("option/delete_matrix_option")
	@ResponseBody
	public boolean deleteMatrixOption(HttpServletRequest request,HttpServletResponse response){
		String qid = request.getParameter("qid");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String id = request.getParameter("id");
		SurveyQuestion question = surveyQuestionService.findById(qid, domain);
		if (null==question||CollectionUtils.isEmpty(question.getMatrix_options())) {
			return false;
		}
		for (Iterator<SurveyOption> iterator = question.getMatrix_options().iterator();iterator.hasNext();) {
			if (id.equals(iterator.next().getId())) {
				iterator.remove();
			}
		}
		
		boolean result = surveyQuestionService.update(question);
		return result;
	}

	/**
	 * 选项上下交换排序
	 */
	@RequestMapping("option/order/swap")
	@ResponseBody
	public boolean optionOrderSwap(HttpServletRequest request,ModelMap map){
		String up_id = request.getParameter("up_id");
		String down_id = request.getParameter("down_id");
		String qid = request.getParameter("qid");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		SurveyQuestion question = surveyQuestionService.findById(qid, domain);
		if (null==question||CollectionUtils.isEmpty(question.getOptions())) {
			return false;
		}
		
		if (StringUtils.isEmpty(up_id)||"undefined".equalsIgnoreCase(up_id)||StringUtils.isEmpty(down_id)||"undefined".equalsIgnoreCase(down_id)) {
			return false;
		}
		
		List<SurveyOption> list = question.getOptions();
		SurveyOption surveyOption1 = null;
		SurveyOption surveyOption2 = null;
		for (Iterator<SurveyOption> iterator = question.getOptions().iterator();iterator.hasNext();) {
			SurveyOption tempOption = iterator.next();
			if (up_id.equals(tempOption.getId())) {
				surveyOption1 = tempOption;
			}
			if (down_id.equals(tempOption.getId())) {
				surveyOption2 = tempOption;
			}
		}
		if (null==surveyOption1||null==surveyOption1) {
			return false;
		}
		
		list.remove(surveyOption1);
		list.remove(surveyOption2);
		long tempWeight = surveyOption1.getWeight();
		surveyOption1.setWeight(surveyOption2.getWeight());
		surveyOption2.setWeight(tempWeight);
		list.add(surveyOption1);
		list.add(surveyOption2);
		boolean result = surveyQuestionService.update(question);
		
		return result;
	}
	/**
	 * 矩阵选项上下交换排序
	 */
	@RequestMapping("matrix_option/order/swap")
	@ResponseBody
	public boolean matrix_OptionOrderSwap(HttpServletRequest request,ModelMap map){
		String up_id = request.getParameter("up_id");
		String down_id = request.getParameter("down_id");
		String qid = request.getParameter("qid");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		SurveyQuestion question = surveyQuestionService.findById(qid, domain);
		if (null==question||CollectionUtils.isEmpty(question.getMatrix_options())) {
			return false;
		}
		
		if (StringUtils.isEmpty(up_id)||"undefined".equalsIgnoreCase(up_id)||StringUtils.isEmpty(down_id)||"undefined".equalsIgnoreCase(down_id)) {
			return false;
		}
		
		List<SurveyOption> list = question.getMatrix_options();
		SurveyOption surveyOption1 = null;
		SurveyOption surveyOption2 = null;
		for (Iterator<SurveyOption> iterator = question.getMatrix_options().iterator();iterator.hasNext();) {
			SurveyOption tempOption = iterator.next();
			if (up_id.equals(tempOption.getId())) {
				surveyOption1 = tempOption;
			}
			if (down_id.equals(tempOption.getId())) {
				surveyOption2 = tempOption;
			}
		}
		if (null==surveyOption1||null==surveyOption1) {
			return false;
		}
		
		list.remove(surveyOption1);
		list.remove(surveyOption2);
		long tempWeight = surveyOption1.getWeight();
		surveyOption1.setWeight(surveyOption2.getWeight());
		surveyOption2.setWeight(tempWeight);
		list.add(surveyOption1);
		list.add(surveyOption2);
		boolean result = surveyQuestionService.update(question);
		
		return result;
	}
	
	/**
	 * 选项设置修改
	 */
	@RequestMapping("option/setting")
	@ResponseBody
	public ModelMap optionSetting(HttpServletRequest request,ModelMap map){
		String option_id = request.getParameter("option_id");
		String question_id = request.getParameter("question_id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		
		SurveyQuestion question = surveyQuestionService.findById(question_id, domain);
		List<SurveyOption> options = question.getOptions();
		SurveyOption option = null;
		for (int i = 0; i < options.size(); i++) {
			if (options.get(i).getId().endsWith(option_id)) {
				option = options.get(i);
			}
		}
		if (null == option) {
			map.put("result", false);
		}else {
			map.put("result", true);
			map.put("has_input_field", option.getHas_input_field());
		}
		return map;
	}
	/**
	 * 选项设置修改
	 */
	@RequestMapping("option/setting/update")
	@ResponseBody
	public boolean optionSett(HttpServletRequest request,ModelMap map){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String option_id = request.getParameter("option_id");
		String question_id = request.getParameter("question_id");
		String has_input = request.getParameter("has_input");
		int hasInput = 0;
		if(StringUtils.isNumeric(has_input)){
			hasInput = Integer.valueOf(has_input);
		}
		
		SurveyQuestion question = surveyQuestionService.findById(question_id, domain);
		List<SurveyOption> options = question.getOptions();
		for (int i = 0; i < options.size(); i++) {
			if (options.get(i).getId().endsWith(option_id)) {
				options.get(i).setHas_input_field(hasInput);
			}
		}
		question.setOptions(options);
		boolean result = surveyQuestionService.update(question);
		return result;
	}
	
	/**
	 * 批量修改问题分页的页码
	 */
	@RequestMapping("pagenum/batchupdate")
	@ResponseBody
	public boolean BatchUpdate(HttpServletRequest request,HttpServletResponse response){
		String survey_id = request.getParameter("survey_id");
		String question_ids = request.getParameter("question_ids");
		String modified = request.getParameter("modified");
		String[] ids = null;
		if (StringUtils.isNotBlank(question_ids)&&question_ids.length()>1) {
			question_ids = question_ids.substring(1);
			ids = question_ids.split(",");
		}
		
		int increment = 0;
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Survey survey = surveyService.findById(survey_id, domain);
		if (null == survey) {
			return false;
		}
		if (StringUtils.isNumeric(modified)) {
			increment = Integer.valueOf(modified);
		}
		
		boolean result =  surveyQuestionService.batchupdate(ids, domain, increment,0,0);
		return result;
	}
	
	/**
	 * 拖拽修改题目  weight排序值 、页码  
	 */
	@RequestMapping("question/drag/swap")
	@ResponseBody
	public boolean questionDragSwap(HttpServletRequest request,HttpServletResponse response){
		boolean result = false;
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String survey_id = request.getParameter("survey_id");
		String currentId = request.getParameter("currentId");
		String toPrevId = request.getParameter("toPreviId");//移动后   前一个元素的ID
		String toNextId = request.getParameter("toNextId");//移动后    后一个元素的ID
		
		SurveyQuestion currentQuestion = surveyQuestionService.findById(currentId, domain);
		SurveyQuestion prevQuestion = surveyQuestionService.findById(toPrevId, domain);
		SurveyQuestion nextQuestion = surveyQuestionService.findById(toNextId, domain);
		if (null==currentQuestion) {
			return false;
		}

		List<SurveyQuestion> list = null;//移动前后位置之间的元素
		if ("first".equals(toPrevId)&&!("last".equals(toNextId))) {//向上移动到第一个
			if(null!=currentQuestion&&null!=nextQuestion){
				long c_weight = currentQuestion.getWeight();
				long n_weight = nextQuestion.getWeight();
				list = surveyQuestionService.findByWeight(survey_id, domain, 0, c_weight);
				//移动后 后面的所有元素
				currentQuestion.setWeight(n_weight-1);
				currentQuestion.setPage_num(nextQuestion.getPage_num());
				boolean result1 = surveyQuestionService.update(currentQuestion);
				List<SurveyQuestion> afertlist = surveyQuestionService.findByWeight(survey_id, domain, c_weight, 0);
				String[] ids = getidsFromList(list);
				String[] afterAllIds = getidsFromList(afertlist);
				boolean result2 = surveyQuestionService.batchupdate(afterAllIds, domain, 0, 1, 0);
				if (currentQuestion.getType() == SurveyQuestionType.FENYE.getVaule()) {
					boolean result3 = surveyQuestionService.batchupdate(ids, domain,1,1,0);
					if (result3&&result1&&result2) {
						return true;
						}
				}else {
					if (result1&&result2) {
						return true;
					}
				}
			}
		}
		if("last".equals(toNextId)&&!("first".equals(toPrevId))){//向下移动到最后一个
			long c_weight = currentQuestion.getWeight();
			long p_weight = prevQuestion.getWeight();
			
			if(null!=currentQuestion&&prevQuestion!=null){
				list = surveyQuestionService.findByWeight(survey_id, domain, c_weight, 0);
				currentQuestion.setWeight(p_weight+1);
				if(prevQuestion.getType()==SurveyQuestionType.FENYE.getVaule()){
					if(currentQuestion.getType()==SurveyQuestionType.FENYE.getVaule()){
						currentQuestion.setPage_num(prevQuestion.getPage_num());
					}else {
						currentQuestion.setPage_num(prevQuestion.getPage_num()+1);
					}
				}else{
					if(currentQuestion.getType()==SurveyQuestionType.FENYE.getVaule()){
						currentQuestion.setPage_num(prevQuestion.getPage_num()-1);
					}else {
						currentQuestion.setPage_num(prevQuestion.getPage_num());
					}
				}
				boolean result1 = surveyQuestionService.update(currentQuestion);
				if(currentQuestion.getType()==SurveyQuestionType.FENYE.getVaule()){
					String[] ids = getidsFromList(list);
					boolean result2 = surveyQuestionService.batchupdate(ids, domain,-1,0,0);
					if (result1&&result2) {
						return true;
					}
				}else {
					return result1;
				}
			}
		}
		
		if(null!=prevQuestion&&null!=nextQuestion&&null!=currentQuestion){
			long c_weight = currentQuestion.getWeight();
			long p_weight = prevQuestion.getWeight();
			long n_weight = nextQuestion.getWeight();
			
			if (p_weight>c_weight) {//向下移动
				list = surveyQuestionService.findByWeight(survey_id, domain,  c_weight, n_weight);
				currentQuestion.setWeight(n_weight-1);
				if(currentQuestion.getPage_num()<nextQuestion.getPage_num()){
					currentQuestion.setPage_num(nextQuestion.getPage_num()-1);
				}
				boolean r1 = surveyQuestionService.update(currentQuestion);
				List<SurveyQuestion> afertlist = surveyQuestionService.findByWeight(survey_id, domain, n_weight-1, 0);
				String[] afterAllIds = getidsFromList(afertlist);
				if (currentQuestion.getType() == SurveyQuestionType.FENYE.getVaule()) {
					String[] ids = getidsFromList(list);
					boolean r3 = surveyQuestionService.batchupdate(ids, domain,-1,1,0);
					boolean r2 = surveyQuestionService.batchupdate(afterAllIds, domain, 0, 1, 0);
					if(r1&&r2&&r3){
						return true;
					}
				}else {
					boolean r2 = surveyQuestionService.batchupdate(afterAllIds, domain, 0, 1, 0);
					if(r1&&r2){
						return true;
					}
				}
			}
			
			if (n_weight<c_weight) {// 向上移动
				list = surveyQuestionService.findByWeight(survey_id, domain,  p_weight, c_weight);
				
				currentQuestion.setWeight(n_weight-1);
				currentQuestion.setPage_num(nextQuestion.getPage_num());
				boolean r1 = surveyQuestionService.update(currentQuestion);
				List<SurveyQuestion> afertlist = surveyQuestionService.findByWeight(survey_id, domain, c_weight, 0);
				String[] afterAllIds = getidsFromList(afertlist);
				if (currentQuestion.getType() == SurveyQuestionType.FENYE.getVaule()) {
					String[] ids = getidsFromList(list);
					boolean r3 = surveyQuestionService.batchupdate(ids, domain,1,1,0);
					boolean r2 = surveyQuestionService.batchupdate(afterAllIds, domain, 0, 1, 0);//更改weight
					if(r1&&r2&&r3){
						return true;
					}
				}else {
					boolean r2 = surveyQuestionService.batchupdate(afterAllIds, domain, 0, 1, 0);//更改weight
					if(r1&&r2){
						return true;
					}
				}
			}
		}
		return result;
	}
	
	
	/**
	 * 逻辑设置添加
	 * 已经添加过的就修改信息
	 */
	@RequestMapping("strategy/add")
	@ResponseBody
	public boolean addStrategy(HttpServletRequest request,HttpServletResponse response){
		String survey_id = request.getParameter("survey_id");
		String question_id =request.getParameter("question_id");
		String option_id = request.getParameter("option_id");
		String jumpto_quesntion_id = request.getParameter("jumpto_quesntion_id");
		String jump_id = request.getParameter("jump_id");
		boolean result = false;
		if(StringUtils.isBlank(jump_id)){
			SurveyJumpStrategy strategy = new SurveyJumpStrategy();
			strategy.setId(IdGenerator.nextId32().toString());
			strategy.setSurvey_id(survey_id);
			strategy.setCreate_time(System.currentTimeMillis());
			strategy.setCreator(LoginSessionHelper.getCurrentUserId(request));
			strategy.setJump_to(jumpto_quesntion_id);
			strategy.setOption_id(option_id);
			strategy.setSource_qid(question_id);
			strategy.setDomain(LoginSessionHelper.getCurrentDomain(request));
			result = jumpStrategyService.add(strategy);
		}else {
			SurveyJumpStrategy strategy = jumpStrategyService.findById(jump_id);
			strategy.setJump_to(jumpto_quesntion_id);
			strategy.setOption_id(option_id);
			strategy.setSource_qid(question_id);
			result = jumpStrategyService.update(strategy);
		}
		
		return result;
	}
	
	/**
	 * 
	 * 单个题目的逻辑信息展示
	 */
	@RequestMapping("strategy/detail")
	@ResponseBody
	public ModelMap getStrateges(HttpServletRequest request,ModelMap map){
		String survey_id = request.getParameter("survey_id");
		String question_id =request.getParameter("question_id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		List<SurveyJumpStrategy> list = jumpStrategyService.findList(survey_id, question_id, domain);
		map.put("jumpList", list);
		return map;
	}
	/**
	 * 所有的逻辑信息展示
	 */
	@RequestMapping("strategy/detall")
	@ResponseBody
	public ModelMap getAllStrateges(HttpServletRequest request,ModelMap map){
		String survey_id = request.getParameter("survey_id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		List<SurveyJumpStrategy> list = getAllLogic(survey_id, domain);
		map.put("list", list);
		return map;
	}
	/**
	 * 逻辑设置删除
	 */
	@RequestMapping("strategy/delete")
	@ResponseBody
	public boolean deleteStrategy(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		boolean result = jumpStrategyService.delete(id,domain);
		return result;
	}
	
	/**
	 * 外观设置
	 */
	@RequestMapping("surface/setting")
	@ResponseBody
	public boolean surfaceSetting(HttpServletRequest request,HttpServletResponse response){
		
		return true;
	}
	
	/**
	 * 收集设置
	 */
	@RequestMapping("collection/setting")
	@ResponseBody
	public boolean collectionSetting(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String collect_num = request.getParameter("collect_num");
		String pwd = request.getParameter("pwd");
		String show_person_result = request.getParameter("show_person_result");
		String ip_oncepnly = request.getParameter("ip_oncepnly");
		String date = request.getParameter("date");
		String once_only = request.getParameter("once_only");
		String weixinonly = request.getParameter("weixinonly");
		String use_pwd = request.getParameter("use_pwd");
		
		Survey survey = surveyService.findById(id, domain);
		if (null==survey) {
			return false;
		}
		if (StringUtils.isNumeric(collect_num)) {
			if (collect_num.equals("")) {
				survey.setCollect_num(0);
			}else {
				survey.setCollect_num(Integer.valueOf(collect_num));
			}
		}
		if(StringUtils.isNotBlank(pwd)){
			survey.setPwd(pwd);
		}
		if(StringUtils.isNumeric(show_person_result)){
			survey.setShow_person_result(Integer.valueOf(show_person_result));
		}
		if (StringUtils.isNotBlank(date)) {
			long l_date = DateUtil.transferStringDateToLong("yyyy-MM-dd", date);
			survey.setEnd_time(l_date);
		}
		if (StringUtils.isNumeric(once_only)) {
			survey.setOnce_only(Integer.valueOf(once_only));
		}
		if (StringUtils.isNumeric(ip_oncepnly)) {
			survey.setIp_oncepnly(Integer.valueOf(ip_oncepnly));
		}
		if (StringUtils.isNumeric(weixinonly)) {
			survey.setWeixinonly(Integer.valueOf(weixinonly));
		}
		if (Boolean.valueOf(use_pwd)) {
			survey.setUse_pwd(1);
		}else {
			survey.setUse_pwd(0);
		}
		
		boolean result = surveyService.update(survey, domain);
		return result;
	}
	
	/**
	 * 题目添加默认的选项
	 * @param domain 域
	 * @param Creator 创建者
	 * @param map 	  ModelMap 向页面返回ID
	 * @param surveyQuestion  要添加的题目
	 * @param isJZ 是否是矩阵题  
	 */
	private void addDefaultOption(String domain,String Creator,ModelMap map,SurveyQuestion surveyQuestion,boolean isJZ){
		for (int i = 1; i <= 2; i++) {
			SurveyOption surveyOption = new SurveyOption();
			surveyOption.setId(IdGenerator.nextId32().toString());
			surveyOption.setDomain(domain);
			surveyOption.setCreate_time(System.currentTimeMillis());
			surveyOption.setCreator(Creator);
			if (isJZ) {
				surveyOption.setContent("矩阵列"+i);
			}else {
				surveyOption.setContent("选项"+i);
			}
			
			surveyOption.setWeight(System.currentTimeMillis()+i);
			map.put("option"+ i,surveyOption.getId());
			List<SurveyOption> list = surveyQuestion.getOptions();
			if (CollectionUtils.isEmpty(list)) {
				list = new ArrayList<SurveyOption>();
			}
			list.add(surveyOption);
			surveyQuestion.setOptions(list);
		}
	}
	//矩阵类型的题目添加默认的列元素
	private void addDefaultMatrixOption(String domain,String Creator,ModelMap map,SurveyQuestion surveyQuestion){
		for (int i = 1; i <= 2; i++) {
			SurveyOption surveyOption = new SurveyOption();
			surveyOption.setId(IdGenerator.nextId32().toString());
			surveyOption.setDomain(domain);
			surveyOption.setCreate_time(System.currentTimeMillis());
			surveyOption.setCreator(Creator);
			surveyOption.setContent("矩阵行"+i);
			surveyOption.setWeight(System.currentTimeMillis()+i);
			map.put("matrixoption"+ i,surveyOption.getId());
			List<SurveyOption> list = surveyQuestion.getMatrix_options();
			if (CollectionUtils.isEmpty(list)) {
				list = new ArrayList<SurveyOption>();
			}
			list.add(surveyOption);
			surveyQuestion.setMatrix_options(list);
		}
	}
	//为问题列表排序、包括选项  矩阵行、列选项的排序  按照weight
	private List<SurveyQuestion> sortQuestionList(List<SurveyQuestion> list){
		if (null!=list&&list.size()>0) {
			Collections.sort(list, new Comparator<SurveyQuestion>() {
				@Override
				public int compare(SurveyQuestion arg0, SurveyQuestion arg1) {
					if (arg0.getWeight()>=arg1.getWeight()) {
						return 1;
					}
					return -1;
				}
			});
			for (int i = 0; i < list.size(); i++) {
				if (null!=list.get(i).getOptions()) {
					Collections.sort(list.get(i).getOptions(),new Comparator<SurveyOption>() {
						@Override
						public int compare(SurveyOption o1, SurveyOption o2) {
							if (o1.getWeight()>=o2.getWeight()) {
								return 1;
							}
							return -1;
						}
					});
				}
			}
			for (int i = 0; i < list.size(); i++) {
				if (null!=list.get(i).getMatrix_options()) {
					Collections.sort(list.get(i).getMatrix_options(),new Comparator<SurveyOption>() {
						@Override
						public int compare(SurveyOption o1, SurveyOption o2) {
							if (o1.getWeight()>=o2.getWeight()) {
								return 1;
							}
							return -1;
						}
					});
				}
				
			}
		}
		return list;
	}
	//获得题目列表中各个问题的逻辑设置的条目数量
	private Map<String, Integer> getLogicNum(List<SurveyQuestion> qList,String domain){
		Map<String, Integer> map = new HashMap<String, Integer>();
		for (int i = 0; i < qList.size(); i++) {
			map.put(qList.get(i).getId(),(int)jumpStrategyService.count("{source_qid:#,domain:#,isdel:0}",qList.get(i).getId(),domain));
		}
		return map;
	}
	/**
	 * 获得调研中所有的逻辑设置
	 */
	private List<SurveyJumpStrategy > getAllLogic(String surveyId,String domain){
		List<SurveyJumpStrategy> list =  jumpStrategyService.findBySurveyId(surveyId, domain);
		return list;
	}
	private String[] getidsFromList(List<SurveyQuestion> list){
		if(null == list){
			return new String[0];
		}
		List<String> idsList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			idsList.add(list.get(i).getId());
		}
		
		String[] ids = new String[idsList.size()];
		ids = idsList.toArray(ids);
		return ids;
	}
 	
}
