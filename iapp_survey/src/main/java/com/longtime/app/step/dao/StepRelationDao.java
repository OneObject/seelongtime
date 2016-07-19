package com.longtime.app.step.dao;

import com.longtime.app.step.model.StepRelation;

public interface StepRelationDao {

	String add(StepRelation releation);

	StepRelation findBySid(String sid, int type, String domain);

	void update(String id,int step);

}
