package com.longtime.app.base.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Filter;
import com.longtime.app.base.model.Feed;
import com.longtime.app.base.service.FeedService;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.QueryCondition;
import com.longtime.common.utils.QueryFilter;
import com.longtime.common.utils.ResultSet;
import com.longtime.common.utils.Sort;

/**
 * 动态管理控制层
 * @author fangxinyuan
 *
 */
@Controller
@RequestMapping("/base/admin/feed/")
public class FeedController {
      
	@Resource
	private FeedService feedService;
	
	
	@RequestMapping("feedindex")
	public String feedindex(HttpServletRequest request,ModelMap model){
		return "/base/admin/feed/feedindex";
	}
	
	/**
	 * 单个删除
	 * @param request
	 * @return
	 */
	@RequestMapping("delfeed")
	@ResponseBody
	public boolean delfeed(HttpServletRequest request){
         String id=request.getParameter("feedid");
         
         if(StringUtils.isBlank(id)){
        	 return false;
         }
         
         boolean b=this.feedService.deleteById(Long.valueOf(id));
         
         if(b){
        	 return true;
         }
         
         return false;
	}
	
	@RequestMapping("batchdelfeed")
	@ResponseBody
	public boolean batchdelfeed(HttpServletRequest request){
	  String id=request.getParameter("ids");
      String[] ids=id.split(",");
		
		if(ids.length<=0){
			return false;
		}
		try {
			for(int i=0;i<ids.length;i++){
				this.feedService.deleteById(Long.valueOf(ids[i]));
				}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 得到列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("feedlist")
	public String feedlist(HttpServletRequest request, ModelMap model){
		String domain=LoginSessionHelper.getCurrentDomain(request);
		String searchval=request.getParameter("searchval");
		int currPage=getCurrpage(request);
		
		Page page=new Page();
		page.setCurrent_page(currPage);
		page.setPage_size(10);
		
		
		QueryCondition queryCondition=new QueryCondition();
		queryCondition.addFilterEqual("domain",domain);
		List<Filter> fList = new ArrayList<Filter>();
		if(StringUtils.isNotBlank(searchval)){
			fList.add(new Filter("body", "%"+searchval+"%", Filter.OP_LIKE));
			fList.add(new Filter("uname", "%"+searchval+"%", Filter.OP_LIKE));
			fList.add(new Filter("resname","%"+searchval+"%",Filter.OP_LIKE));
 		}
		queryCondition.addFilter("", fList, Filter.OP_OR);
		queryCondition.addSort(new Sort("createtime",Sort.ORDER_DES));
		
		
		ResultSet<Feed> rs=this.feedService.list(queryCondition,page);
		
		if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
			model.put("list",rs.getItems());
			model.put("pager",rs.getPage());
		}else {
			model.put("list",Lists.newArrayList());
			model.put("pager",page);
		}
		return "/base/admin/feed/feedlist";
	}
	
	private int getCurrpage(HttpServletRequest request) {
		String currpage = request.getParameter("currPage");
		
		return NumberUtils.toInt(currpage, 1);
		
	}
}
