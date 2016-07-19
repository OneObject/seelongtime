package com.longtime.app.step.service;

import com.longtime.app.step.model.StepRelation;

public interface StepRelationService {

	String add(StepRelation releation);

	StepRelation findBySid(String sid, int type, String domain);

	void completeStep(int step, String sid, String domain, int type);

}
