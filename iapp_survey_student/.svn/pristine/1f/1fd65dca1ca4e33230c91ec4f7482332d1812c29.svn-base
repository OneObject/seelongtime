//package com.longtime.ajy.student.web;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.longtime.ajy.model.QuestionEntity;
//import com.longtime.ajy.model.User;
//import com.longtime.ajy.model.vo.QuestionVo;
//import com.longtime.ajy.session.SessionHelper;
//import com.longtime.ajy.student.service.QuestionService;
//import com.longtime.ajy.student.service.QuestionTagsService;
//import com.longtime.ajy.student.service.TagService;
//import com.longtime.ajy.student.utils.WebUtil;
//import com.longtime.common.dao.IdGenerator;
//import com.longtime.common.model.search.Pageable;
//import com.longtime.common.model.search.ResultSet;
//import com.longtime.common.model.search.Search;
//import com.longtime.common.model.search.Sort;
//
//
//
///**
// * @since 2013-7-12
// * @author yangwk
// */
//@Controller
//@RequestMapping("/iask/question")
//public class QuestionEntityController {
//
//	@Resource(name = "questionService")
//	private QuestionService questionService;
//
//	
//	@Resource(name = "tagService")
//	private TagService tagService;
//	
//	@Resource(name="questionTagsService")
//	private QuestionTagsService questionTagsService;
//
//	/**
//	 * 得到所有的问题信息
//	 * 
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String list(HttpServletRequest request, ModelMap model) {
//		String current_page = request.getParameter("current_page");
//		String page_size = request.getParameter("page_size");
//		String order = request.getParameter("order");
//		String orderAttr = order;
//		if(StringUtils.isBlank(orderAttr)){
//			orderAttr = "dateCreated";
//		}
//		if("time".equals(orderAttr)){
//			orderAttr = "dateCreated";
//		}
//		if("num".equals(orderAttr)){
//			orderAttr = "answer_num";
//		}
//		
//		Search search=Search.newInstance();
//		search.addEqualFilter("domain", SessionHelper.getCurrentDomain());
//		search.addSort(new Sort(orderAttr,true));
//		
//		Pageable page = new Pageable();
//		//Page page = new Page();
//		if(StringUtils.isNotBlank(page_size)){
//			page.setPageSize(Integer.parseInt(page_size));
//		}
//		if(StringUtils.isNotBlank(current_page)){
//			
//			page.setPageNumber(Integer.parseInt(current_page));
//		}
//		ResultSet<QuestionEntity> rs  = this.questionService.listAndCount(search, page);
//		
//		List<QuestionVo> list=new ArrayList<QuestionVo>();
//		
//		if(rs!=null && rs.getData()!=null && rs.getData().size()>0){
//			for(QuestionEntity questionEntity:rs.getData()){
//				QuestionVo questionVo=new QuestionVo();
//				questionVo.setQuestionEntity(questionEntity);
//				/*
//				List<String> tags=this.questionTagsService.getTagsList(questionEntity.getId());
//				StringBuilder stringBuilder=new StringBuilder();
//				if(tags!=null && tags.size()>0){
//					for(String str:tags){
//					stringBuilder.append(str);
//					stringBuilder.append(",");
//					}
//					//去掉末尾的逗号
//					stringBuilder.delete(stringBuilder.length()-1,stringBuilder.length());
//				}
//				questionVo.setTags(stringBuilder.toString());*/
//				list.add(questionVo);
//			}
//		}
//		
//		
//		model.put("list",list);
//		model.put("page",rs.getPageable());
//		model.put("order", order);
//		return "iask/list_new";
//	}
//
//	@RequestMapping("/toadd")
//	public String toAdd(HttpServletRequest request,ModelMap model){
//		return "iask/asking_new";
//	}
//
//	/**
//	 * 添加一个问题
//	 * 
//	 * @param question 问题model
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "/add", method = RequestMethod.POST)
//	public String add(QuestionEntity question, HttpServletRequest request, ModelMap model) {	
//		String domain = SessionHelper.getCurrentDomain();
//		String uid = SessionHelper.getCurrentUid();
////		String tag = request.getParameter("tag");
//		User user =SessionHelper.getCurrentUser(request);
//		question.setAuthor_id(user.getId());
//		question.setAuthor_name(user.getName());
//		question.setId(IdGenerator.uuid32());
//		question.setDateCreated(System.currentTimeMillis());
//		question.setDomain(SessionHelper.getCurrentDomain());
//		this.questionService.insert(question);
//		/*
//		if(StringUtils.isNotBlank(tag)){
//			tag = tag.replace("，", ",");
//			String[] tags = tag.split(",");
//			//保存到关联表
//			for(int i=0;i<tags.length;i++){
//				
//				TagEntity tagEntity=new TagEntity();
//				tagEntity.setId(IdGenerator.uuid32());
//				tagEntity.setDateCreated(System.currentTimeMillis());
//				tagEntity.setName(tags[i]);
//				tagService.insert(tagEntity);
//				
//				QuestionTags questionTags=new QuestionTags();
//				questionTags.setQuestionid(question.getId());
//				questionTags.setTagsid(tagEntity.getId());
//				questionTagsService.insert(questionTags);	
//				
//			}
//			tagService.putQueue(Arrays.asList(tags));
//		}*/
//		//添加提问获取积分
//		return "redirect:/iask/question/list.xhtml";
//	}
//	
//	
//	
//	
//	/**
//	 * 前往更新页
//	 * 
//	 * @param question 问题model
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "/toupdate", method = RequestMethod.GET)
//	public String toUpdate(HttpServletRequest request, ModelMap model) {
//		String question_id = request.getParameter("id");
//		
//		QuestionEntity entity = this.questionService.findOne(question_id);
//		if (entity == null) {
//			String msg = "未找到要修改的问题，请刷新后重新尝试！";
//			model.put("msg", msg);
//			return "message";
//		}
//		/*
//		List<String> tags =this.questionTagsService.getTagsList(question_id);
//		if(CollectionUtils.isNotEmpty(tags)){
//			StringBuilder tag = new StringBuilder();
//			for(int i=0; i<tags.size(); i++){
//				tag.append(tags.get(i));
//				if(i<tags.size()-1){
//					tag.append("，");
//				}
//			}
//			model.put("tag", tag.toString());
//		}*/
//		model.put("question", entity);
//		return "iask/update";
//	}
//
//	/**
//	 * 更新问题内容
//	 * 
//	 * @param question 问题model
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String update(HttpServletRequest request, ModelMap model) {
//		String id = request.getParameter("id");
//		QuestionEntity entity = this.questionService.findOne(id);
//		if (entity == null) {
//			String msg = "未找到要修改的问题，请刷新后重新尝试！";
//			model.put("msg", msg);
//			return "message";
//		}
//		String supplement = request.getParameter("supplement");
//		String supplementNoHtml = request.getParameter("supplementNoHtml");
//		String title = request.getParameter("title");
//		/*
//		String tag = request.getParameter("tag");
//		if(StringUtils.isNotBlank(tag)){
//			tag = tag.replace("，", ",");
//			String[] tags = tag.split(",");
//			
//			//删除原来关联的tags
//			this.questionTagsService.deleteByquestionid(id);
//			//添加新数据
//			//保存到关联表
//			for(int i=0;i<tags.length;i++){
//				
//				TagEntity tagEntity=new TagEntity();
//				tagEntity.setId(IdGenerator.uuid32());
//				tagEntity.setDateCreated(System.currentTimeMillis());
//				tagService.insert(tagEntity);
//				
//				QuestionTags questionTags=new QuestionTags();
//				questionTags.setQuestionid(entity.getId());
//				questionTags.setTagsid(tagEntity.getId());
//				questionTagsService.insert(questionTags);	
//				
//			}
//			tagService.putQueue(Arrays.asList(tags));
//		}*/
//		
//		if (StringUtils.isNotBlank(title)) {
//			entity.setTitle(title);
//		}
//		if (StringUtils.isNotBlank(supplement)) {
//			entity.setSupplement(supplement);
//		}
//		if (StringUtils.isNotBlank(supplementNoHtml)) {
//			entity.setSupplementNoHtml(supplementNoHtml);
//		}
//		this.questionService.update(entity);
//		return "redirect:/iask/question/detail.xhtml?id=" + id;
//	}
//
//	/**
//	 * 删除一个问题
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	@ResponseBody
//	public boolean deleteask(HttpServletRequest request, ModelMap model) {
//		String askid = request.getParameter("id");
//		if(StringUtils.isBlank(askid)){
//			return false;
//		}
//		QuestionEntity question = this.questionService.findOne(askid);
//		if(question == null){
//			return false;
//		}
//		boolean hasAuth = WebUtil.checkAuth(question.getAuthor_id(),request);
//		if(!hasAuth){
//			return false;
//		}
//		this.questionService.delete(askid);
//		return true;
//	}
//
//	@RequestMapping(value = "/detail", method = RequestMethod.GET)
//	public String detail(@RequestParam String id,HttpServletRequest request, ModelMap model) {
//
//		//查找最佳答案
//		//AnswerEntity bestAnswer = this.answerService.findBestAnswer(id);
//		//model.put("bestAnswer", bestAnswer);
//		return "iask/detail_new";
//	}
//	
//	/**
//	 * 得到所有的问题信息
//	 * 
//	 * @param request
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = "/myquestion", method = RequestMethod.GET)
//	public String myQuestion(HttpServletRequest request, ModelMap model) {
//		return "iask/myquestion";
//	}
//}
