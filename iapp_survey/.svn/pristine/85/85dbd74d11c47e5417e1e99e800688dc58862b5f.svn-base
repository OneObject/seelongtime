package com.longtime.app.ixin.mgr.controller;


import com.google.common.collect.Lists;
import com.longtime.app.ixin.mgr.model.ActivityInfo;
import com.longtime.app.ixin.mgr.model.ActivityItem;
import com.longtime.app.ixin.mgr.model.ActivityItem.Restype;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.rank.model.RankEntity;
import com.longtime.app.ixin.mgr.rank.service.RankService;
import com.longtime.app.ixin.mgr.service.IActivityItemService;
import com.longtime.app.ixin.mgr.service.IActivityService;
import com.longtime.app.ixin.mgr.service.IRewardService;
import com.longtime.app.ixin.mgr.vote.service.VoteService;
import com.longtime.app.ixin.mgr.vote.vo.VoteVO;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("activityItemController")
@RequestMapping("/mgr/activity/")
public class ActivityItemController {
	private static final Logger logger = LoggerFactory.getLogger(ActivityItemController.class);
	@Resource(name="activityService")
	private IActivityService activityService;
	@Resource
	private IRewardService iRewardService;
	
	@Resource(name="activityItemService")
	private IActivityItemService activityItemService;
	
	@Resource
	private VoteService voteService;
	
	@Resource
	private RankService rankService;
	
	
	@RequestMapping("relation")
	public String relation(HttpServletRequest request, ModelMap map) {
		String id = request.getParameter("id");
		
		ActivityInfo activity = activityService.getActivityById(id);
		map.put("activity", activity);
		
		String type = request.getParameter("type");
		
		if(StringUtils.isBlank(type)){
			type ="vote";
		}
		map.put("type", type);
		
		return "mgr/ixin/activity/relation";
	}
	
	@RequestMapping("relation/add")
	@ResponseBody
	public boolean addItem(HttpServletRequest request){
		
		String type = request.getParameter("type");
		
		String idsStr = request.getParameter("ids");
		String namesStr = request.getParameter("names");
		
		String aid = request.getParameter("aid");
		
		String afterSignIn = request.getParameter("afterSignIn");
		
		String showTopic = request.getParameter("showTopic");
		
		String creator = LoginSessionHelper.getCurrentUserId(request);
		
		ActivityInfo info =  this.activityService.getActivityById(aid);
		if(info == null){
			  return false;
		}
		
		info.setAfterSignIn(NumberUtils.toInt(afterSignIn,0));
		info.setShowTopic(NumberUtils.toInt(showTopic,0));
		
		boolean b =this.activityService.modifyActivity(info);
		if (!b) {
			return false;
		}
		if(StringUtils.isBlank(aid)){
			return false;
		}
		
		if(StringUtils.isBlank(idsStr)){
			return false;
		}
		
		String[] ids = idsStr.split(",");
		String[] names = namesStr.split(",");
		
		if(null==ids || names==null || ids.length!=names.length){
			return false;
		}
		Restype restype = Restype.from(type);
		
		for(int i=0;i<ids.length;i++){
			
			if(StringUtils.isBlank(ids[i])){
				continue;
			}
			ActivityItem item = new ActivityItem();
			item.setAid(StringUtils.trim(aid));
			item.setResid(StringUtils.trim(ids[i]));
			item.setResname(StringUtils.trim(names[i]));
			item.setRestype(restype.code);
			item.setCreator(creator);
			activityItemService.insert(item);
		}
		return true;
		
	}
	
	
	@RequestMapping("relation/delete")
	@ResponseBody
	public boolean doDel(HttpServletRequest request){
		String id = request.getParameter("id");
		if(StringUtils.isBlank(id)){
			return false;
		}
		activityItemService.delete(NumberUtils.toLong(id, -1L));
		return true;
		
	}
			
	
	@RequestMapping("relation/items")
	public String  itemList(HttpServletRequest request, ModelMap map){
		
		String typeName = request.getParameter("type");
		
		Restype restype = Restype.from(typeName);
		
		//String page = request.getParameter("page");
		
		String aid = request.getParameter("aid");
		
		
		//Page pageInfo = new Page();
		
		//pageInfo.setCurrent_page(NumberUtils.toInt(page, 1));
		
		//pageInfo.setPage_size(Integer.MAX_VALUE); //不分页
		
		List<ActivityItem> list  = activityItemService.list(aid, restype);
		
		map.put("items", list);
		return "mgr/ixin/activity/activity_item_list";
	}
	
	
	@RequestMapping("relation/select")
	public String  itemSelectList(HttpServletRequest request, ModelMap map){
		
		String typeName = request.getParameter("type");
		
		String name = request.getParameter("name");
		
		Restype restype = Restype.from(typeName);
		
		String currentPage = request.getParameter("page");
		
		String domain  = LoginSessionHelper.getCurrentDomain(request);
		
		
		Page page = new Page();
		
		page.setCurrent_page(NumberUtils.toInt(currentPage, 1));
		
		
		ResultSet<SelectItem>  rs = null;
		
		if(Restype.lottery == restype){ //刮刮卡
			rs=listLottery(name,domain, page);
		}
		
		if(Restype.vote == restype){// 投票
			rs = listVoteOrSurvey(name,domain,page,0);
		}
		
		if(Restype.survey == restype){// 
			rs=listVoteOrSurvey(name, domain, page,1);
		}
		
		if(Restype.rank==restype){ //排行榜
			rs = listRank(name,domain,page);
		}
		
		if(null==rs){
			rs = ResultSet.emptyResultSet();
		}
		map.put("rs", rs);
		
		
		
		return "mgr/ixin/activity/activity_item_select";
	}
	
	
	private ResultSet<SelectItem> listRank(String name,String domain,Page page){
		ResultSet<RankEntity> rs  = rankService.getResultSet(domain, name, page);
		
		List<SelectItem> items = Lists.newArrayList();
		if(null!=rs && null!=rs.getItems()){
			
			for (RankEntity temp : rs.getItems()) {
				SelectItem item = new SelectItem();
				item.setId(temp.getId());
				item.setName(temp.getTitle());
				items.add(item);
			}
		}
		
		ResultSet<SelectItem>  resultSet = new ResultSet<SelectItem>();
		
		resultSet.setItems(items);
		resultSet.setPage(rs.getPage());
		return resultSet;
		
	}
	
	
	private ResultSet<SelectItem> listLottery(String name,String domain,Page page){
		List<RewardActivity> list=Lists.newArrayList();
		if(StringUtils.isBlank(name)){
			list=iRewardService.getRewardByDomain(domain,page.getCurrent_page());
		}else{
			list=iRewardService.queryByPage(name, domain, page);
		}
		//得到总条数
		int count =iRewardService.getRewardCount(domain);
		page.setTotal_size(count);
		
		List<SelectItem> items=Lists.newArrayList();
		if(list!=null && list.size()>0){
			for(RewardActivity rewardActivity:list){
				SelectItem item=new SelectItem();
				item.setId(rewardActivity.getId());
				item.setName(rewardActivity.getExplain2().getTitle());
				items.add(item);
			}
		}
		ResultSet<SelectItem> resultSet=new ResultSet<SelectItem>();
		resultSet.setItems(items);
		resultSet.setPage(page);
		return  resultSet;
	}
	
	private ResultSet<SelectItem> listVoteOrSurvey(String name,String domain,Page page,int surveyOrvote){
		
		ResultSet<VoteVO> rs  = voteService.queryByPage(page,  domain, name,surveyOrvote );
		
		List<SelectItem> items = Lists.newArrayList();
		if(null!=rs && null!=rs.getItems()){
			
			for (VoteVO temp : rs.getItems()) {
				SelectItem item = new SelectItem();
				item.setId(temp.getId());
				item.setName(temp.getTitle());
				items.add(item);
			}
		}
		
		ResultSet<SelectItem>  resultSet = new ResultSet<SelectItem>();
		
		resultSet.setItems(items);
		resultSet.setPage(rs.getPage());
		return resultSet;
		
	}
	
	public static class SelectItem{
		String id;
		String name;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
		
		
	}
	
}
