package com.longtime.app.ixin.mgr.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.googlecode.genericdao.search.Filter;
import com.longtime.app.base.model.User;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.model.AutoResponseRule;
import com.longtime.app.ixin.mgr.service.AutoResponseRuleService;
import com.longtime.app.ixin.mgr.service.StudyService;
import com.longtime.app.ixin.mgr.topic.model.CommentEntity;
import com.longtime.app.ixin.mgr.topic.model.CommentStudentEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicStudentEntity;
import com.longtime.app.ixin.mgr.topic.service.CommentService;
import com.longtime.app.ixin.mgr.topic.service.CommentStudentService;
import com.longtime.app.ixin.mgr.topic.service.TopicService;
import com.longtime.app.ixin.mgr.utils.Constants;
import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteEntity;
import com.longtime.app.ixin.mgr.vote.service.VoteActivityService;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.app.util.PageUtil;
import com.longtime.common.model.search.Filter.Joiner;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

@Controller
@RequestMapping("/mgr/include/")
public class IncludeListController {
	
	@Resource(name="voteActivityService")
	private VoteActivityService voteActivityService;
	
	@Resource(name="fodderService")
	private FodderService fodderService;
	@Resource(name="studyService")
	private StudyService studyService;
	
    @Resource(name="autoResponseRuleService")
    private AutoResponseRuleService autoResponseRuleService;
    
    @Resource(name="voteService")
    private VoteService voteService;

    @Resource(name="topicService")
    private TopicService topicService;
    
    @Resource(name="topicCommentService")
    private CommentService topicCommentService; 
    
    @Resource
    private CommentStudentService commentStudentService;
    
    
    /**
	 * 调研活动列表
	 * @author yangwenkui
	 * @time 2016年6月12日 下午8:54:38
	 * @return
	 */
	@RequestMapping("voteactivitylist")
	public String voteActivityList(HttpServletRequest request,ModelMap model){
		String name = request.getParameter("search");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Page page = PageUtil.getPage(request);
		User user = LoginSessionHelper.getCurrentUser(request);
		String orgId = user.getOrganization().getId();
		QueryCondition query = new QueryCondition();
		if(!user.isSuperadmin()){
			query.addFilterLike("rootpaths", String.format("%%%s%%",orgId));
		}
		if(StringUtils.isNotBlank(name)){
			List<Filter> filters = new ArrayList<Filter>();
			filters.add(new Filter("title", String.format("%%%s%%",name), Filter.OP_LIKE));
			filters.add(new Filter("labels", String.format("%%%s%%",name), Filter.OP_LIKE));
			query.addFilter("", filters, Filter.OP_OR);
		}
		
		query.addFilterEqual("domain", domain);
		query.addFilterEqual("del", Constants.NO_DEL);
		query.addOrder("weight", Sort.Order.DES);
		ResultSet<VoteActivityEntity> rs = voteActivityService.list(query,page);
		model.put("list", rs.getItems());
		model.put("pager",rs.getPage());
		return "mgr/ixin/voteactivity/list";
	}
	
	/**
	 * 调研问卷列表
	 * @author yangwenkui
	 * @time 2016年6月16日 下午10:23:11
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("votelist")
	public String voteList(HttpServletRequest request,ModelMap model){
		String name = request.getParameter("search");
		String domain = LoginSessionHelper.getCurrentDomain(request);
		Page page = PageUtil.getPage(request);
		User user = LoginSessionHelper.getCurrentUser(request);
		String orgId = user.getOrganization().getId();
		QueryCondition query = new QueryCondition();
		if(!user.isSuperadmin()){
			query.addFilterLike("rootpaths", String.format("%%%s%%",orgId));
		}
		if(StringUtils.isNotBlank(name)){
			query.addFilterLike("title", String.format("%%%s%%",name));
		}
		
		query.addFilterEqual("domain", domain);
		query.addFilterEqual("del", Constants.NO_DEL);
		query.addOrder("updatetime", Sort.Order.DES);
		ResultSet<VoteEntity> rs = voteService.list(query,page);
		model.put("list", rs.getItems());
		model.put("pager",rs.getPage());
		return "mgr/ixin/vote/list";
	}
    
	/**
	 * 调研问卷关联问题列表
	 * @author yangwenkui
	 * @time 2016年6月17日 下午10:58:13
	 * @param voteId
	 * @param model
	 * @return
	 */
	@RequestMapping("votequestionlist")
	public String voteQuestionList(@RequestParam("voteId")String voteId,ModelMap model){
		List<VoteQuestionVO> list = voteService.getVoteQuestionVOByVoteId(voteId);
		model.put("list", list);
		return "mgr/ixin/vote/questionlist";
	}
	
	//unuse--
    
    
    /**
     * 查询
     * @param req
     * @param model
     * @return
     */
    @RequestMapping(value="keywordsrulelist", method=RequestMethod.POST)
    public String list(HttpServletRequest req, ModelMap model) {
        int totalSize = autoResponseRuleService.getAutoResponseRuleCount(LoginSessionHelper.getCurrentDomain(req));
        Page page = PageUtil.getPage(req);
        int pageNO = page.getCurrent_page();
        int pageSize = page.getPage_size();
        List<AutoResponseRule> list = autoResponseRuleService.getAutoResponseRuleList(LoginSessionHelper.getCurrentDomain(req), pageNO, pageSize);

        putPageToModel(model,pageNO,totalSize,pageSize);
       
        model.put("list", list);
        return "mgr/ixin/power/list";
    }
	
    @RequestMapping("getrespmsg")
    @ResponseBody
    public FodderVO getRespMsg(HttpServletRequest request){
    	
    	return fodderService.getFodderVOResp(LoginSessionHelper.getCurrentDomain(request));
    }
	
	
	
	
	private void putPageToModel(ModelMap model,int currPage,int totalSize,int pageSize) {
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
	
	@RequestMapping("studylist")
	public String studyList(HttpServletRequest request,ModelMap model){
		int currpage = 1;
		try{
			currpage = Integer.valueOf(request.getParameter("currPage"));
		}catch(Exception e){
			currpage = 1;
		}
		int totalSize = studyService.getTotalSize(LoginSessionHelper.getCurrentDomain(request), "ixinstudy");
		int pageSize = studyService.getPageSize();
		putPageToModel(model, currpage, totalSize, pageSize);
		
		List<FodderVO> list = studyService.queryByPage(LoginSessionHelper.getCurrentDomain(request), currpage, "ixinstudy");
		model.put("list", list);
		
		return "mgr/ixin/study/list";
	}
	
	@RequestMapping("noticelist")
	public String noticeList(HttpServletRequest request,ModelMap model){
		int currpage = 1;
		try{
			currpage = Integer.valueOf(request.getParameter("currPage"));
		}catch(Exception e){
			currpage = 1;
		}
		int totalSize = studyService.getTotalSize(LoginSessionHelper.getCurrentDomain(request), "ixinnotice");
		int pageSize = studyService.getPageSize();
		putPageToModel(model, currpage, totalSize, pageSize);
		
		List<FodderVO> list = studyService.queryByPage(LoginSessionHelper.getCurrentDomain(request), currpage, "ixinnotice");
		model.put("list", list);
		
		return "mgr/ixin/notice/list";
	}
	
	@RequestMapping("fodderlist")
	public String fodderList(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		String searchContent = request.getParameter("searchcontent");
		int currPage = getCurrpage(request);
		int pageSize = 6;
		if (StringUtils.isNotBlank(searchContent)) {
			int totalSize = fodderService.getTitalSizeWithSearch(domain, searchContent);
			putPageToModel(model, currPage, totalSize, pageSize);
			List<FodderVO> list = fodderService.getFodderByPageWithSerch(pageSize, currPage, domain, searchContent);
			model.put("list", list);
			return "mgr/ixin/fodder/list";
		}
		
		int totalSize = fodderService.getFodderTotalSize(domain);
		putPageToModel(model, currPage, totalSize, pageSize);
		
		List<FodderVO> list = fodderService.getFodderByPage(pageSize,currPage,domain);
		model.put("list", list);
		return "mgr/ixin/fodder/list";
	}
	
	//素材草稿start
	@RequestMapping("fodderdrafflist")
	public String fodderDraffList(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		int currPage = getCurrpage(request);
		int totalSize = fodderService.getFodderDraffTotalSize(domain);
		int pageSize = 6;
		putPageToModel(model, currPage, totalSize, pageSize);
		
		List<FodderVO> list = fodderService.getFodderDraffByPage(pageSize,currPage,domain);
		
		model.put("list", list);
		
		return "mgr/ixin/fodder/drafflist";
	}
	//素材草稿end
	
	@RequestMapping("votedetail")
	public String voteDetail(@RequestParam("voteId")String voteId,ModelMap model){
		VoteVO vo = voteService.getVoteVOById(voteId);
		model.put("vo", vo);
		model.put("coverBasePath", voteService.getCoverBasePath());
		model.put("suffix", voteService.getSuffix());
		return "mgr/ixin/vote/voteresult";
	}
	
	@RequestMapping("topiclist")
	public String topicList(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		int currPage = getCurrpage(request);
		int totalSize = topicService.getTopicTotalSize(domain);
		int pageSize = 10;
		putPageToModel(model, currPage, totalSize, pageSize);
		
		List<TopicEntity> list = topicService.queryTopicEntityList(pageSize,currPage,domain);
		
		model.put("list", list);
		return "mgr/ixin/topic/list";
	}
	
	@RequestMapping("topicstudentlist")
	public String topicstudentlist(HttpServletRequest request,ModelMap model){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String activityid=request.getParameter("activityid");
		String searchval=request.getParameter("searchval");
		int currPage=getCurrpage(request);
		
		int totalSize=this.topicService.getTopicStudentCount(searchval,activityid, domain);
		
		int pagesize=10;
		
		putPageToModel(model, currPage, totalSize, pagesize);
		
	
		
		List<TopicStudentEntity> list=topicService.getTopicEntities(searchval,activityid, domain, pagesize,currPage);
		
		model.put("list",list);
		
		return "mgr/ixin/active/topiclist";
	}
	
	@RequestMapping("commentstudentlist")
	public String commentstudentlist(HttpServletRequest request,ModelMap model){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String topicid=request.getParameter("topicid");
		
		String searchval=request.getParameter("searchval");
		
		int currPage=getCurrpage(request);
		
		int totalSize=this.commentStudentService.gettotalnum(domain, topicid, searchval);
		
		int pageSize=10;
		
		putPageToModel(model, currPage, totalSize, pageSize);
		
		List<CommentStudentEntity> list=this.commentStudentService.getlist(domain, topicid, searchval, pageSize, currPage);
		
		model.put("list",list);
		
		return "mgr/ixin/active/commentlist";
	}
	
	
	/**
	 * 话题评论列表
	 * @param topicId
	 * @param model
	 * @return
	 */
	@RequestMapping("topiccommentlist")
	public String topicCommentList(HttpServletRequest request,@RequestParam("topicId")String topicId,ModelMap model){
		int currPage = getCurrpage(request);
		int totalSize = topicCommentService.getTopicCommentTotalSize(topicId);
		int pageSize = 10;
		putPageToModel(model, currPage, totalSize, pageSize);
		List<CommentEntity> list = topicCommentService.queryCommentListByTopicId(pageSize,currPage,topicId);
		model.put("list", list);
		return "mgr/ixin/topic_comment/list";
	}
}
