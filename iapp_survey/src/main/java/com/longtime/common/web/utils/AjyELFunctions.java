package com.longtime.common.web.utils;

import com.longtime.ajy.support.bean.Step;
import com.longtime.ajy.support.service.CreditServiceWrapper;
import com.longtime.app.base.service.OrganizationService;
import com.longtime.app.step.model.StepRelation;
import com.longtime.app.step.service.StepRelationService;
import com.longtime.common.spring.SpringContextUtil;

public class AjyELFunctions {

	private static StepRelationService stepRelationService;
	private static OrganizationService organizationService;
	
	private static String UNCOMPLETE = "<span class=\"label label-sm label-danger\">未完成</span>";
	private static String COMPLETE = "<span class=\"label label-sm label-success\">完成</span>";

	public static StepRelationService getStepRelationService() {
		if (null == stepRelationService) {
			stepRelationService = SpringContextUtil.getBean(StepRelationService.class);
		}
		return stepRelationService;
	}
	
	public static OrganizationService getOrganizationService() {
		if (null == organizationService) {
			organizationService = SpringContextUtil.getBean(OrganizationService.class);
			
		}
		return organizationService;
	}

	public static String createStatus(int stepNum,String sid,int type,String domain){
		if(null != getStepRelationService()){
			StepRelation stepRelation = getStepRelationService().findBySid(sid, type, domain);
			if(stepRelation == null){
				return UNCOMPLETE;
			}
			int step = stepRelation.getStep();
			boolean isDoAll = Step.from(step).idDoAll(stepNum);
			if(isDoAll){
				return COMPLETE;
			} 
		}
		
		return UNCOMPLETE;
	}
	public static boolean statusComplete(int stepNum,String sid,int type,String domain){
		if(null != getStepRelationService()){
			StepRelation stepRelation = getStepRelationService().findBySid(sid, type, domain);
			if(stepRelation == null){
				return false;
			}
			int step = stepRelation.getStep();
			boolean isDoAll = Step.from(step).idDoAll(stepNum);
			if(isDoAll){
				return true;
			} 
		}
		
		return false;
	}
	
	public static long creditTotal(String uid) {
		return CreditServiceWrapper.getTotalCredit(uid);
	}
	
	
	public static String orgFullName(String oid){
		return getOrganizationService().parseStringRoottoCurrentOrgName(oid);
	}
	
	

}
