package com.longtime.app.credit.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.longtime.common.utils.LoginSessionHelper;
import com.longtime.platform.credit.domain.CreditRuleEntity;
import com.longtime.platform.credit.domain.DomainCreditRuleEntity;
import com.longtime.platform.credit.domain.OpenStatus;
import com.longtime.platform.credit.service.ICreditService;
import com.longtime.platform.credit.service.IDomainCreditService;
import com.longtime.platform.credit.service.IOpenStatusService;

@Controller
@RequestMapping("/mgr/credit/")
public class CreditRuleController {
	
	@Resource(name = "creditService")
	private ICreditService creditService;
	
	@Resource(name = "domainCreditService")
	private IDomainCreditService domainCreditService;
	
	@Resource(name = "openStatusService")
	private IOpenStatusService openStatusService;
	
	@RequestMapping("creditmanage")
	public String creditManage(HttpServletRequest request){
		return "/mgr/credit/creditmanage";
	}
	@RequestMapping("rules")
	public String rules(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		OpenStatus openStatus = this.openStatusService.getByDomain(domain);
		model.put("openStatus", openStatus);
		return "/mgr/credit/rules";
	}
	
	@RequestMapping("list")
	public String list(HttpServletRequest request,ModelMap model){
		List<CreditRuleEntity> rules = this.creditService.getCreditRules();
		if(CollectionUtils.isEmpty(rules)){
			model.put("list", new ArrayList<CreditRuleEntity>());
			return "/mgr/credit/listforrule";
		}
		String domain = LoginSessionHelper.getCurrentDomain(request);
		rules = getDomainRules(rules,domain);
		
		model.put("list", rules);
		
		return "/mgr/credit/listforrule";
	}
	
	@RequestMapping("changestatus")
	@ResponseBody
	public boolean changeStatus(HttpServletRequest request){
		String status = request.getParameter("status");
		String id = request.getParameter("id");
		if(StringUtils.isBlank(status)){
			return false;
		}
		
		String domain = LoginSessionHelper.getCurrentDomain(request);
		OpenStatus openStatus = new OpenStatus();
		openStatus.setStatus(Integer.valueOf(status));
		openStatus.setDomain(domain);
		if(StringUtils.isBlank(id)){
			this.openStatusService.add(openStatus);
		} else {
			openStatus.setId(Integer.valueOf(id));
			this.openStatusService.update(openStatus);
		}
		
		return true;
	}
	
	/**
	 * 根据Id获取积分实体再跳转到修改积分页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("update")
	public String update(HttpServletRequest request,ModelMap model){
		 String domain = LoginSessionHelper.getCurrentDomain(request);
		 String id = request.getParameter("id");
	        if(StringUtils.isBlank(id)){
	            return "redirect:/mgr/credit/creditmanage.xhtml";
	        }
	        if (StringUtils.isNotBlank(id)){
	        	 DomainCreditRuleEntity domainCreditRuleEntity = domainCreditService.getByRuleId(NumberUtils.toInt(id),domain);
	        	 CreditRuleEntity creditRuleEntity = this.creditService.loadById(NumberUtils.toInt(id));
	        	 //如果当前域下的规则为空，则去查询系统规则
	 	        if(domainCreditRuleEntity != null){
	 	        	model.put("isruleid", 0);
	 	        	model.put("entity", domainCreditRuleEntity);
	 	        	
	 	        }else{
	 	        	//用于在修改页面进行判断是否是系统规则的一个标识变量
	 	        	model.put("isruleid", 1);
	 	        	model.put("entity", creditRuleEntity);
	 	        }
	 	       model.put("ruleName", creditRuleEntity.getRuleName());
	        }else{
	        	 return "redirect:/mgr/credit/creditmanage.xhtml";
	        }
	        
	        
		return "/mgr/credit/update";
	}
	
	/**
	 *	修改积分规则的方法
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("doupdate")
	@ResponseBody
	public ModelMap doUpdate(HttpServletRequest request,ModelMap model){
		String domain = LoginSessionHelper.getCurrentDomain(request);
		//从页面获取各修改后的参数
		String id = request.getParameter("ruleId");
		String rewardType = request.getParameter("rewardType");
		String credit = request.getParameter("credit");
		String norepeat = request.getParameter("norepeat");
		String cycleType = request.getParameter("cycleType");
		String cycleTime = request.getParameter("cycleTime");
		String rewardNum = request.getParameter("rewardNum");
		String resourceRewardNum = request.getParameter("resourceRewardNum");
		
		String experience = request.getParameter("experience"); 

		DomainCreditRuleEntity domainCreditRuleEntity = null;
		if (StringUtils.isNotBlank(id)){
			domainCreditRuleEntity = domainCreditService.getByRuleId(NumberUtils.toInt(id),domain);
			//如果域规则不为空就使用当前域下的规则并对其进行修改
			if (domainCreditRuleEntity != null){
				if (StringUtils.isNotBlank(rewardType)){
					domainCreditRuleEntity.setRewardType(rewardType);
				}
				if (StringUtils.isNotBlank(credit)){
					domainCreditRuleEntity.setCredit(NumberUtils.toInt(credit));
				}
				if(StringUtils.isNotBlank(experience)){
				    domainCreditRuleEntity.setExperience(NumberUtils.toInt(experience, 0));
				}
				if (StringUtils.isNotBlank(norepeat)){
					domainCreditRuleEntity.setNorepeat(norepeat);
				}
				if (StringUtils.isNotBlank(cycleType)){
					domainCreditRuleEntity.setCycleType(cycleType);
				}
				if (StringUtils.isNotBlank(cycleTime)){
					domainCreditRuleEntity.setCycleTime(NumberUtils.toInt(cycleTime));
				}
				if (StringUtils.isNotBlank(rewardNum)){
					domainCreditRuleEntity.setRewardNum(NumberUtils.toInt(rewardNum));
				}
				if (StringUtils.isNotBlank(resourceRewardNum)){
					domainCreditRuleEntity.setResourceRewardNum(NumberUtils.toInt(resourceRewardNum));
				}
				domainCreditService.update(domainCreditRuleEntity);
			}else{
				//当前域规则为空的时候向域规则中添加一条新数据
				CreditRuleEntity creditRuleEntity = this.creditService.loadById(NumberUtils.toInt(id));
				domainCreditRuleEntity = new DomainCreditRuleEntity();
				if (creditRuleEntity != null){
					if (StringUtils.isNotBlank(id)){
						domainCreditRuleEntity.setRuleid(NumberUtils.toInt(id));
					}
					if (StringUtils.isNotBlank(rewardType)){
						domainCreditRuleEntity.setRewardType(rewardType);
					}
					if (StringUtils.isNotBlank(credit)){
						domainCreditRuleEntity.setCredit(NumberUtils.toInt(credit));
					}
					if(StringUtils.isNotBlank(experience)){
	                    domainCreditRuleEntity.setExperience(NumberUtils.toInt(experience, 0));
	                }
					if (StringUtils.isNotBlank(norepeat)){
						domainCreditRuleEntity.setNorepeat(norepeat);
					}
					if (StringUtils.isNotBlank(cycleType)){
						domainCreditRuleEntity.setCycleType(cycleType);
					}
					if (StringUtils.isNotBlank(cycleTime)){
						domainCreditRuleEntity.setCycleTime(NumberUtils.toInt(cycleTime));
					}
					if (StringUtils.isNotBlank(rewardNum)){
						domainCreditRuleEntity.setRewardNum(NumberUtils.toInt(rewardNum));
					}
					if (StringUtils.isNotBlank(resourceRewardNum)){
						domainCreditRuleEntity.setResourceRewardNum(NumberUtils.toInt(resourceRewardNum));
					}
					domainCreditRuleEntity.setVers(creditRuleEntity.getVers());
					domainCreditRuleEntity.setExperience(creditRuleEntity.getExperience());
					domainCreditRuleEntity.setDomain(domain);
					domainCreditService.insert(domainCreditRuleEntity);
				}else{
					model.put("flag",false);
					model.put("msg", "修改失败");
					return model;
				}
			}
		}else{
			model.put("flag",false);
			model.put("msg", "修改失败");
			return model;
		}
		model.put("flag", true);
		model.put("msg", "修改成功");
		return model;
	}


	/**
	 * 获取所有的积分规则，先以域下的规则为主，如果没有则采用系统规则
	 * @param rules
	 * @param domain
	 * @return
	 */
	private List<CreditRuleEntity> getDomainRules(List<CreditRuleEntity> rules,String domain) {
		List<DomainCreditRuleEntity> domainRules = this.domainCreditService.getRules(domain);
		if(CollectionUtils.isEmpty(domainRules)){
			return rules;
		}
         
		Map<Integer, DomainCreditRuleEntity> map = new HashMap<Integer, DomainCreditRuleEntity>();
		for(DomainCreditRuleEntity entity : domainRules){
			map.put(entity.getRuleid(), entity);
		}
		
		for(CreditRuleEntity rule : rules){
			DomainCreditRuleEntity domainRule = map.get(rule.getId());
			if(domainRule == null){
				continue;
			}
			
			rule.setCycleType(domainRule.getCycleType());
			rule.setCycleTime(domainRule.getCycleTime());
			rule.setResourceRewardNum(domainRule.getResourceRewardNum());
			rule.setRewardType(domainRule.getRewardType());
			rule.setRewardNum(domainRule.getRewardNum());
			rule.setNorepeat(domainRule.getNorepeat());
			rule.setCredit(domainRule.getCredit());
			rule.setExperience(domainRule.getExperience());
			rule.setVers(domainRule.getVers());
		}
		
		
		return rules;
	}
	
}
