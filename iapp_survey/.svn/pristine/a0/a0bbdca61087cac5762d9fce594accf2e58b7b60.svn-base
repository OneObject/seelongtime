package com.longtime.app.step.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.support.bean.Step;
import com.longtime.app.step.dao.StepRelationDao;
import com.longtime.app.step.model.StepRelation;
import com.longtime.app.step.service.StepRelationService;

@Service("stepRelationService")
public class StepRelationServiceImpl implements StepRelationService{
	
	@Resource(name = "stepRelationDao")
	private StepRelationDao stepRelationDao;
	
	@Override
	public String add(StepRelation releation) {
		return stepRelationDao.add(releation);
	}

	@Override
	public StepRelation findBySid(String sid, int type, String domain) {
		return this.stepRelationDao.findBySid(sid,type,domain);
	}

	@Override
	public void completeStep(int step, String sid, String domain, int type) {
		StepRelation relation = this.stepRelationDao.findBySid(sid,type,domain);
		if(relation == null){
			relation = new StepRelation();
			relation.setSid(sid);
			relation.setStep(Step.from().doit(step).value());
			relation.setDomain(domain);
			relation.setType(type);
			this.stepRelationDao.add(relation);
		} else {
			relation.setStep(Step.from(relation.getStep()).doit(step).value());
			this.stepRelationDao.update(relation.getId(),relation.getStep());
		}
		
		
		
	}
}
