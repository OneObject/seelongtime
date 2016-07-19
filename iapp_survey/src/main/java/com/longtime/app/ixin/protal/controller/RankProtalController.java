package com.longtime.app.ixin.protal.controller;

import com.longtime.app.ixin.mgr.rank.model.RankEntity;
import com.longtime.app.ixin.mgr.rank.model.UserTotalCreditEntityVO;
import com.longtime.app.ixin.mgr.rank.service.IUserTotalCreditService;
import com.longtime.app.ixin.mgr.rank.service.RankService;
import com.longtime.common.utils.LoginSessionHelper;
import com.myctu.platform.utils.NumberUtils;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/protal/rank")
public class RankProtalController {

	@Resource(name="rankService")
	private RankService rankService;
	
	@Resource(name="usertotalcreditService")
	private IUserTotalCreditService usertotalcreditService;
	
	@RequestMapping("/{id}")
	public String add(@PathVariable("id") String id,HttpServletRequest request,ModelMap model){
		
		RankEntity rank = this.rankService.getById(id);
		if(null==rank){
			rank = new RankEntity();
			rank.setId(id);
		}
		model.put("rank", rank);
		

		return "protal/rank/detail";
	}
	
	
	/**
	 * 积分排行查询
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("credit")
	public String credit(HttpServletRequest request,ModelMap modelMap){
		String domain = request.getParameter("fdomain");
		String size = request.getParameter("size");
		int pageSize = 5;
		if(StringUtils.isNotBlank(size)){
			pageSize = NumberUtils.toInt(size, 5);
		}
		List<UserTotalCreditEntityVO> list = usertotalcreditService.getCreditEntityRanking(domain, pageSize);
		
		modelMap.put("ranktoplist",list);
		return "protal/rank/credit";
	}
	
}
