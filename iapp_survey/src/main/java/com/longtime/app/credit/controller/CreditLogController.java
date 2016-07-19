package com.longtime.app.credit.controller;

import com.longtime.ajy.support.service.CreditServiceWrapper;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.longtime.app.base.model.User;
import com.longtime.app.base.model.UserCreditVO;
import com.longtime.app.base.service.UserService;
import com.longtime.app.credit.service.UserCreditService;
import com.longtime.app.util.PageUtil;
import com.longtime.common.exception.IAppRuntimeException;
import com.longtime.common.utils.HtmlUtils;
import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.common.utils.Page;
import com.longtime.platform.credit.domain.CreditLogEntity;
import com.longtime.platform.credit.service.ICreditLogService;
import com.longtime.platform.credit.service.ICreditService;
import com.longtime.platform.credit.service.IDomainCreditService;
import com.myctu.platform.utils.NumberUtils;

@Controller
@RequestMapping("/mgr/credit/log/")
public class CreditLogController {
	
	private static Logger logger = LoggerFactory.getLogger(CreditLogController.class);
	
	@Resource(name = "creditService")
	private ICreditService creditService;
	
	@Resource(name = "domainCreditService")
	private IDomainCreditService domainCreditService;
	
	@Resource(name = "creditLogService")
	private ICreditLogService creditLogService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "userCreditService")
	private UserCreditService userCreditService;
	
	private static String ACTION = "手动奖罚";
	
	@RequestMapping("logs")
	public String rules(HttpServletRequest request,ModelMap model){
		return "/mgr/credit/log/logs";
	}
	
	@RequestMapping("list")
	public String list(HttpServletRequest req,ModelMap model){
		 	String searchContent = HtmlUtils.getAvailableString(req, "searchContent");
		 	Page page = PageUtil.getPage(req);
	        String domain = LoginSessionHelper.getCurrentDomain(req);
	        long count = this.userCreditService.count(searchContent,domain);
	        List<UserCreditVO> list = this.userCreditService.list(page,searchContent,domain);
	        
	        page = new Page(page.getCurrent_page(), page.getPage_size());
	        page.setTotal_size((int)count);
	        model.put("list", list);
	        model.put("page", page);
		
		return "/mgr/credit/log/listforlog";
	}
	
	@RequestMapping("detail")
	public String detail(HttpServletRequest request,ModelMap model){
		String uid = request.getParameter("uid");
		if(StringUtils.isBlank(uid)){
			throw new IAppRuntimeException("用户ID不能为空");
		}
		User user = this.userService.get(uid);
		if(user == null){
			throw new IAppRuntimeException(String.format("不能找到id＝[%s]的用户", uid));
		}
		model.put("user", user);
		return "/mgr/credit/log/detail";
	}
	
	@RequestMapping("listfordetail")
	public String listfordetail(HttpServletRequest request,ModelMap model){
		String uid = request.getParameter("uid");
		List<CreditLogEntity> list = this.creditLogService.list(uid);
		model.put("list", list);
		return "/mgr/credit/log/listfordetail";
	}
	
	@RequestMapping("tocreatecredit")
	public String tocreatecredit(HttpServletRequest request,ModelMap model){
		String uid = request.getParameter("uid");
		model.put("uid", uid);
		User user = this.userService.get(uid);
		model.put("user", user);
		return "/mgr/credit/log/createcredit";
	}
	
	@RequestMapping(value="createcredit",method=RequestMethod.POST)
	@ResponseBody
	public boolean createcredit(HttpServletRequest request){
		String uid = request.getParameter("uid");
		String rewardType = request.getParameter("rewardType");
		String creditStr = request.getParameter("credit");
		String experienceStr = request.getParameter("experience");
		String remark = request.getParameter("remark");
		int experience=NumberUtils.toInt(experienceStr,0);
		int credit = NumberUtils.toInt(creditStr, 0);
		if("0".equals(rewardType)){
			credit = credit*(-1);
			experience=experience*(-1);
		}
		if(StringUtils.isBlank(remark)){
			remark = ACTION;
		} else{
			remark = String.format("%s［奖惩理由：%s］",ACTION, remark);
		}
		try {
			String domain = LoginSessionHelper.getCurrentDomain(request);
			CreditServiceWrapper.createCreditLogRandomSync("", uid, remark, credit, experience, domain);	
		} catch (Exception e) {
			logger.error(String.format("create random credit due to error,uid=%s,credit=%s", uid,credit),e);
			return false;
		}
		return true;
	}
	
}
