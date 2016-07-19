package com.longtime.app.ixin.mgr.rank.controller;

import java.util.List;

import com.longtime.ajy.support.service.CreditServiceWrapper;
import com.longtime.app.base.model.User;
import com.longtime.app.base.service.UserService;
import com.longtime.app.ixin.mgr.fodder.service.FodderService;
import com.longtime.app.ixin.mgr.fodder.vo.FodderVO;
import com.longtime.app.ixin.mgr.rank.model.Item;
import com.longtime.app.ixin.mgr.rank.model.RankEntity;
import com.longtime.app.ixin.mgr.rank.service.RankService;
import com.longtime.app.ixin.mgr.service.IActivityItemService;
import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.track.model.ReportVisitEntity;
import com.longtime.app.util.HTMLUtils;
import com.longtime.app.util.PageUtil;
import com.longtime.common.utils.DateUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;
import com.longtime.platform.credit.domain.CreditRankVO;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mgr/rank")
public class RankController {

	@Resource(name="rankService")
	private RankService rankService;
	
	@Resource(name="fodderService")
	private FodderService fodderService;
	
	@Resource
	private UserService userService;
	
	@Resource(name="activityItemService")
	private IActivityItemService activityItemService;
	
	
	@RequestMapping("show")
	public String add(@RequestParam("id")String id,HttpServletRequest request,ModelMap model){
		
		RankEntity rank = this.rankService.getById(id);
		if(null==rank){
			rank = new RankEntity();
			rank.setId(id);
		}
		model.put("rank", rank);
		
		model.put("result", fodderService.getRequiredParams());

		return "mgr/ixin/rank/update";
	}
	
	
	@RequestMapping("doupdate")
	public String update(@RequestParam("model")String model,@RequestParam("id")String id,HttpServletRequest request,ModelMap modelMap){
		RankEntity rank = this.rankService.getById(id);
		
		rank.setRemark(rank.getRemark().replace("\"","\'"));
		
		modelMap.put("rank", rank);
		
		modelMap.put("model", model);
		
		
		modelMap.put("result", fodderService.getRequiredParams());
		
		if (!"0".equals(model)) {
			modelMap.put("from", "update");
			return "mgr/ixin/rank/updatenew";
		}
		
		return "mgr/ixin/rank/update";
	}
	
	
	@RequestMapping("doadd")
	public String doadd(HttpServletRequest request ,ModelMap modelMap){
		modelMap.put("result",fodderService.getRequiredParams());
		
		String model = request.getParameter("model");
		
		modelMap.put("model", model);
		
		if (!"0".equals(model)) {
			
			return "mgr/ixin/rank/updatenew";
			
		}else{
			
			return "mgr/ixin/rank/update";
			
		}
		
	}
	
	
	@RequestMapping("index")
	public String index(HttpServletRequest request){
		
		return "mgr/ixin/rank/index";
	}
	
	@RequestMapping("ranklist")
	public String ranklist(HttpServletRequest request,ModelMap modelMap){
		Page page=PageUtil.getPage(request);
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String model = request.getParameter("model");
		ResultSet<RankEntity> rs=this.rankService.getResultSet(domain, page ,model);

	    if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
	    	for (RankEntity entity : rs.getItems()) {
	    		entity.setRemark(HTMLUtils.html2Text(entity.getRemark()));
	    	}
	    	modelMap.put("ranklist",rs.getItems());
	    	modelMap.put("pager",rs.getPage());
	    }else{
	    	modelMap.put("pager",page);
	    }
	    
	    modelMap.put("model", model);
		return "mgr/ixin/rank/list";
	}
	
	
	
	@RequestMapping("save")
	public String save(HttpServletRequest request,TopicEntity entity){
		
		
		String id = request.getParameter("id");
		String itemindex = request.getParameter("itemindex");
		String title = request.getParameter("title");
		String remark = request.getParameter("remark");
		String coverPath =request.getParameter("coverPath");
		
		String model = request.getParameter("model");
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		if ("1".equals(model) || "2".equals(model) || "3".equals(model)) {
			
			RankEntity rank = new RankEntity();
			if (StringUtils.isNotBlank(id)) {
				rank = this.rankService.getById(id);
				rank.setTitle(title);
				rank.setCover(coverPath);
				rank.setRemark(remark);
			}else{
				String timestr = request.getParameter("timestr");
				String datetype = request.getParameter("datetype");
				int top = NumberUtils.toInt(request.getParameter("top"));
				
				long[] time = getStartAndEndTime(timestr,datetype);
				
				long start = time[0];
				
				long end = time[1];
				
				rank.setTimestr(timestr);
				
				rank.setModel(NumberUtils.toInt(model));
				
				rank.setStarttime(start);
				
				rank.setDatetype(NumberUtils.toInt(datetype));
				
				rank.setEndtime(end);
				
				rank.setTitle(title);
				
				int index = 1;
				if ("1".equals(model)) {
					List<CreditRankVO> list = CreditServiceWrapper.getTopCreditRank(start, end, top, domain);
					
					for (CreditRankVO creditRankVO : list) {
						
						Item item = new Item();
						User user = userService.get(creditRankVO.getUid());
						item.setTitle(user.getName());
						item.setImg(creditRankVO.getUid());
						item.setRemark(String.valueOf(creditRankVO.getNum()));
						item.setIndex(index);
						//item.setUrl("www");
						index++;
						rank.addItem(item);
					}
				
				}
				if ("2".equals(model)||"3".equals(model)) {
					String module = "fodder_detail_pv";
					if ("2".equals(model)) {
						module = "fodder_detail_pv";
					}else if("3".equals(model)){
						module = "course_detail_pv";
					}
					
					Page page = new Page(0, top);
					List<ReportVisitEntity> list = rankService.listTopVisitNum(start, end, page, domain, module);
					for (ReportVisitEntity entity1 : list) {
						Item item = new Item();
						FodderVO vo = fodderService.getFodderVOById(entity1.getRid());
						if (vo==null) {
							continue;
						}
						item.setTitle(vo.getTitle());
						item.setRemark(String.valueOf(entity1.getValue()));
						item.setIndex(index);
						index++;
						rank.addItem(item);
					}
				}
				
				rank.setRemark(remark);
				rank.setCover(coverPath);
				rank.setDomain(LoginSessionHelper.getCurrentDomain(request));
				rank.setCreatetime(System.currentTimeMillis());
				
			}
		
			rankService.insetOrUpdata(rank);
			
		}else{
			
			RankEntity rank = this.rankService.getById(id);
			
			if(null==rank){
				rank = new RankEntity();
				rank.setId(id);
			}
			rank.setTitle(title);
			rank.setRemark(remark);
			rank.setCover(coverPath);
			rank.setDomain(LoginSessionHelper.getCurrentDomain(request));
			rank.setCreatetime(System.currentTimeMillis());
			rank.setItems(null);
			rank.setModel(0);
			// items
			int index = NumberUtils.toInt(itemindex, 0);
			for(int i=1;i<=index;i++){
				String itemTitle = request.getParameter("title"+i);
				String itemRemark = request.getParameter("remark"+i);
				String itemCover = request.getParameter("coverPath"+i);
				if(StringUtils.isBlank(itemTitle) && StringUtils.isBlank(itemRemark)){
					continue;
				}
				Item item = new Item();
				item.setIndex(i);
				item.setTitle(itemTitle);
				item.setRemark(itemRemark);
				item.setImg(itemCover);
				rank.addItem(item);
			}
			rankService.insetOrUpdata(rank);
			
		}
		
		System.err.println(model);
	
		return "redirect:index.xhtml?model="+model;
	}
	
	
	
	private long[] getStartAndEndTime(String timestr,String datetype){
		
		long[] time = new long[2];
		
		if ("0".equals(datetype)) {
			
			String year = timestr.substring(0, timestr.indexOf("年"));
			
			String week = timestr.substring(timestr.indexOf("年")+1,timestr.indexOf("周"));
			
			time = DateUtils.getStartAndEndOfWeeksYear(Integer.valueOf(year), Integer.valueOf(week));
			
			
			
		}else if("1".equals(datetype)){
			
			String year = timestr.substring(0, timestr.indexOf("年"));
			
			String month = timestr.substring(timestr.indexOf("年")+1,timestr.indexOf("月"));
			
			time = DateUtils.getStartAndEndOfMonthsYear(Integer.valueOf(year), Integer.valueOf(month));
			
		}else if("2".equals(datetype)){
			
			String year = timestr.substring(0, timestr.indexOf("年"));
			
			String season = timestr.substring(timestr.indexOf("年")+1,timestr.indexOf("季"));
			
			time = DateUtils.getStartAndEndOfQuartersYear(Integer.valueOf(year), Integer.valueOf(season));
			
		}else if("3".equals(datetype)){
			
			String year = timestr.substring(0, timestr.indexOf("年"));
			
			time = DateUtils.getStartAndEndOfYear(Integer.valueOf(year));
			
		}else if("4".equals(datetype)){
			
			String startstr = timestr.substring(0, timestr.indexOf("~"));
			
			String endstr = timestr.substring(timestr.indexOf("~")+1);
			
			time[0] = DateUtils.parseStringToLong(startstr);
			
			time[1] = DateUtils.parseStringToLong(endstr);
			
		}
		
		return time;
		
	}
	
	
	@RequestMapping("delrank")
	@ResponseBody
	public ModelMap delrank(@RequestParam("id")String id,HttpServletRequest request,ModelMap modelMap){
		int result = this.activityItemService.delActivityItemByAidAndResid(id);
		RankEntity rank = rankService.getById(id);
		if (result >= 0){//活排行榜没有被关联的时候返回0 
			int affectrows=rankService.deleteById(id);
			if(affectrows>0){
				modelMap.put("flag", true);
			}
		}else{
			modelMap.put("flag", false);
		}
		modelMap.put("model", rank.getModel());
		return modelMap;
	}
	
	
	
	@RequestMapping("del")
	@ResponseBody
	public void del(@RequestParam("id")String id){
		rankService.deleteById(id);
	}
}
