package com.longtime.ajy.mweb.web;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.collect.Lists;
import com.longtime.ajy.model.vo.TimeActivityVO;
import com.longtime.ajy.mweb.model.VoteEntity;
import com.longtime.ajy.mweb.service.VoteService;

@Controller
@RequestMapping("/m/ixin/vote")
public class MVoteController extends MBaseController {
       @Resource
       private VoteService voteService;
       
       /**
        * 投票列表
        * @param request
        * @param modelMap
        * @return
        */
       @RequestMapping("votelist")
       public String votelist(HttpServletRequest request ,ModelMap modelMap){
    	   List<VoteEntity> list=this.voteService.querylist(getCurrentDomain(request),VoteEntity.VOTE);
    	   
    	   
    	   modelMap.put("votelist",list);
    	   return   "/m/vote/votelist";
       }
       
       /**
        * 调研列表
        * @param request
        * @param modelMap
        * @return
        */
       @RequestMapping("surveylist")
       public String surveylist(HttpServletRequest request ,ModelMap modelMap){
    	   
    	   List<VoteEntity> list=this.voteService.querylist(getCurrentDomain(request),VoteEntity.SURVEY);
    	   modelMap.put("surveylist",list);
    	   return    "/m/vote/surveylist";
       }
       
       @RequestMapping("serieslist")
	   	public String seriesList(HttpServletRequest request,ModelMap model){
//	   		String activityId = request.getParameter("activityId");
//	   		String type = request.getParameter("type");
//	   		Search search = Search.newInstance();
//	   		search.addEqualFilter("aid", activityId);
//	   		search.addEqualFilter("restype", type);
//	   		String uid = MwebHelper.getCurrentUid();
//	   		model.put("uid", uid);
//	   		
//   			if("1".equals(type)){
//   				model.put("activityId", activityId);
//   	    	   return    "/m/vote/votelist";
//   			}else {
//   				model.put("activityId", activityId);
//   	    	   return    "/m/vote/surveylist";
//   			}
//	   		
//	   		List<String> ids = new ArrayList<String>();
//	   		for(ActivityItem item : activityItems){
//	   			ids.add(item.getResid());
//	   		}
//	   		
//	   		search = Search.newInstance();
//	   		search.addFilter(Filter.in("id", ids));
//	   		search.addEqualFilter("del",VoteEntity.ISDEL_NO);
//	   		List<VoteEntity> list = this.voteService.list(search);
//	   		list = sort(list);
//	   		
//	   		if("1".equals(type)){
//	   			model.put("activityId", activityId);
//	   			model.put("votelist", list);
//	     	   return    "/m/vote/votelist";
//   			}else {
//   				model.put("activityId", activityId);
//   				model.put("surveylist", list);
//   	    	   return    "/m/vote/surveylist";
//   			}
    	   		return "";
	   	}

	private List<VoteEntity> sort(List<VoteEntity> list) {
		if(CollectionUtils.isEmpty(list)){
			return Lists.newArrayList();
		}
		Collections.sort(list, new Comparator<VoteEntity>() {
			@Override
			public int compare(VoteEntity o1, VoteEntity o2) {
				int o1Status = getStatus(o1.getStartTime(), o1.getEndTime());
				int o2Status = getStatus(o2.getStartTime(), o2.getEndTime());
				long differ = o1.getStartTime()-o2.getStartTime();
				if(o1Status == TimeActivityVO.STATUS_UNDERWAY){
					if(o2Status == TimeActivityVO.STATUS_UNDERWAY && differ>0){
						return 1;
					}
				}
				
				if(o1Status == TimeActivityVO.STATUS_UNSTART){
					if(o2Status == TimeActivityVO.STATUS_UNDERWAY){
						return 1;
					}
					if(o2Status == TimeActivityVO.STATUS_UNSTART && differ>0){
						return 1;
					}
				}
				
				if(o1Status == TimeActivityVO.STATUS_END){
					if(o2Status == TimeActivityVO.STATUS_UNSTART || o2Status == TimeActivityVO.STATUS_UNDERWAY){
						return 1;
					}
					if(o2Status == TimeActivityVO.STATUS_END && differ>0){
						return 1;
					}
				}
				return -1;
			}
		});
		return list;
	}
	
	private int getStatus(long start,long end) {
		long current = System.currentTimeMillis();
		if(start>current){
			return 0; //未开始
		} else if(start<=current && end>current){
			return 1;//进行中
		} else{
			return 2;
		}
	}
       
}
