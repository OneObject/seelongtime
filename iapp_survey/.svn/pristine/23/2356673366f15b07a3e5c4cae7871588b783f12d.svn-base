package com.longtime.app.ixin.mgr.topic.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.service.IXinRuleService;
import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicStudentEntity;
import com.longtime.app.ixin.mgr.topic.service.CommentStudentService;
import com.longtime.app.ixin.mgr.topic.service.TopicService;
import com.longtime.app.ixin.protocol.Rule;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;

@Controller
@RequestMapping("/mgr/topic")
public class TopicController {

	@Resource(name = "fodderService")
	private FodderService fodderService;

	@Resource(name = "topicService")
	private TopicService topicService;

	@Resource(name = "iXinRuleService")
	private IXinRuleService iXinRuleService;

	@Resource
	private CommentStudentService commentStudentService;

	@RequestMapping("index")
	public String index(ModelMap model) {
		return "mgr/ixin/topic/index";
	}

	@RequestMapping("topicindex")
	public String topicindex(ModelMap model) {
		return "mgr/topic/topicindex";
	}

	@RequestMapping("add")
	public String add(ModelMap model) {
		model.put("result", fodderService.getRequiredParams());
		return "mgr/ixin/topic/add";
	}

	@RequestMapping("save")
	public String save(HttpServletRequest request, TopicEntity entity) {
		String id = topicService.saveOrUpdate(TopicEntity.getTopicEntity(
				entity, request));
		TopicEntity topicEntity = topicService.getTopicEntityById(id);
		if (topicEntity!=null&&StringUtils.isNotBlank(topicEntity.getKeywords())){
			Rule rule = new Rule();
			rule.setsKey(entity.getKeywords());
			rule.setHandlerKey("topic");
			rule.setSid(id);
			rule.setDomain(LoginSessionHelper.getCurrentDomain(request));
			rule.setType(Rule.DOMAIN_RULE);
			iXinRuleService.addOrUpdate(rule);// 添加关键字
		}
		return "redirect:index.xhtml";
	}

	@RequestMapping("update")
	public String update(@RequestParam("id") String id, ModelMap model) {
		TopicEntity entity = topicService.getTopicEntityById(id);
		model.put("result", fodderService.getRequiredParams());
		model.put("entity", entity);
		return "mgr/ixin/topic/update";
	}

	@RequestMapping("del")
	@ResponseBody
	public void del(@RequestParam("id") String id) {
		topicService.del(id);
		iXinRuleService.delBySid(id);
	}

	@RequestMapping("topicstudentindex")
	public String topicstudentindex(HttpServletRequest request, ModelMap model) {
		String activityid = request.getParameter("activityid");

		model.put("activityid", activityid);

		return "/mgr/ixin/active/topicindex";
	}

	@RequestMapping("commentstudentindex")
	public String commentstudentindex(HttpServletRequest request, ModelMap model) {
		String topicid = request.getParameter("topicid");
		String from = request.getParameter("from");

		TopicStudentEntity topicStudentEntity = this.topicService
				.getTopicStudentEntity(topicid);

		model.put("topicStudentEntity", topicStudentEntity);

		model.put("topicid", topicid);
		model.put("from", from);

		return "/mgr/ixin/active/commentindex";
	}

	@RequestMapping("delstudentcomment")
	@ResponseBody
	public boolean delstudentcomment(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}

		try {
			this.commentStudentService.delstudentcomment(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@RequestMapping("batchdelcomment")
	@ResponseBody
	public boolean batchdelcomment(HttpServletRequest request, ModelMap model) {

		String id = request.getParameter("ids");

		String[] ids = id.split(",");

		if (ids.length <= 0) {
			return false;
		}

		try {
			this.commentStudentService.batchdelcomment(ids);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@RequestMapping("delstudenttopic")
	@ResponseBody
	public boolean delstudenttopic(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}

		try {
			this.topicService.delstudenttopic(id);
			return true;
		} catch (Exception e) {

			return false;
		}
	}

	// 总的话题管理------------------------------------------------------------------------------------------

	private void putPageToModel(ModelMap model, int currPage, int totalSize,
			int pageSize) {
		Page page = new Page();
		page.setCurrent_page(currPage);
		page.setTotal_size(totalSize);
		page.setPage_size(pageSize);
		model.put("pager", page);
	}

	private int getCurrpage(HttpServletRequest request) {
		String currpage = request.getParameter("currPage");
		return NumberUtils.toInt(currpage, 1);

	}

	@RequestMapping("batchtopicstudentdel")
	@ResponseBody
	public boolean batchtopicstudentdel(HttpServletRequest request,
			ModelMap model) {
		String id = request.getParameter("ids");

		String[] ids = id.split(",");

		if (ids.length <= 0) {
			return false;
		}

		try {
			this.topicService.batchtopicstudentdel(ids);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@RequestMapping("topicstudentlist")
	public String topicstudentlist(HttpServletRequest request, ModelMap model) {

		String domain = LoginSessionHelper.getCurrentDomain(request);

		String searchval = request.getParameter("searchval");

		String type = request.getParameter("type");

		int currPage = getCurrpage(request);

		int totalSize = this.topicService.getTopicStudentCount(searchval,
				domain);

		int pagesize = 10;

		putPageToModel(model, currPage, totalSize, pagesize);

		List<TopicStudentEntity> list = this.topicService
				.getTopicStudentEntities(searchval, domain, pagesize, currPage);

		model.put("list", list);

		model.put("type", type);

		return "mgr/topic/topiclist";
	}

	@RequestMapping("topicstudentlists")
	public String topicstudentlists(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);

		String searchval = request.getParameter("searchval");
		
		String type=request.getParameter("type");
		
		int currPage = getCurrpage(request);
		
		int totalSize=this.topicService.getTopicStudentCounts(searchval, domain);

		int pagesize = 10;
		
		putPageToModel(model,currPage,totalSize,pagesize);
		
		//存储每个话题对应的图片
		List<TopicStudentEntity> list=this.topicService.getTopicEntities(searchval, domain, pagesize,currPage);
        Map<Long, List<String>> images = new HashMap<Long, List<String>>();
        if(CollectionUtils.isNotEmpty(list)){
	        for(TopicStudentEntity entity : list){
	        	String cover = entity.getCover();
				if (cover != null && !"".equals(cover)) {//图片不为空
	        		String[]  converArray = cover.split(",");
	        		images.put(entity.getId(),  Arrays.asList(converArray));//id为key值，value为图片地址数组
	        	}        	
	        }
        }
 
		model.put("list",list);		
		model.put("type",type);
		model.put("images",images);
		
		return "mgr/topic/topiclist";
	}

	@RequestMapping("recommendtopicstudent")
	@ResponseBody
	public boolean recommendtopicstudent(HttpServletRequest request) {
		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}
		try {
			this.topicService.recommendtopicstudent(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@RequestMapping("cancelrecommendtopic")
	@ResponseBody
	public boolean cancelrecommendtopic(HttpServletRequest request) {
		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}

		try {
			this.topicService.cancelrecommendtopic(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@RequestMapping("topstudenttopic")
	@ResponseBody
	public boolean topstudenttopic(HttpServletRequest request) {

		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}

		try {
			this.topicService.topstudenttopic(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@RequestMapping("canceltoptopic")
	@ResponseBody
	public boolean canceltoptopic(HttpServletRequest request) {
		String id = request.getParameter("id");

		if (StringUtils.isBlank(id)) {
			return false;
		}
		try {
			this.topicService.canceltoptopic(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 屏蔽/取消屏蔽  
	 * @param request
	 * @return 操作成功 true
	 */
	@RequestMapping("shield")
	@ResponseBody
	public boolean shield(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String shield  = request.getParameter("status");
		
		if(StringUtils.isBlank(id)||StringUtils.isBlank(shield))
		{
			return false;
		}
		
		return this.topicService.shield(id, shield);
	}
	
	@RequestMapping("shieldcomment")
	@ResponseBody
	public boolean shieldComment(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		if (StringUtils.isBlank(id)) {
			return false;
		}
		if (StringUtils.isBlank(status)) {
			return false;
		}
		
		try {
			this.commentStudentService.shieldcommnet(id, status);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
