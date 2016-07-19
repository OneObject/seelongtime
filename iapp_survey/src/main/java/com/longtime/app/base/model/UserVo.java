package com.longtime.app.base.model;

import com.longtime.app.ixin.mgr.model.IXinUser;

public class UserVo extends User {
	
	private static final long serialVersionUID = 5082618794022705083L;

	private IXinUser iXinUser;
	
	private JobLevelEntity jobLevelEntity;

	public IXinUser getiXinUser() {
		return iXinUser;
	}

	public void setiXinUser(IXinUser iXinUser) {
		this.iXinUser = iXinUser;
	}

	public JobLevelEntity getJobLevelEntity() {
		return jobLevelEntity;
	}

	public void setJobLevelEntity(JobLevelEntity jobLevelEntity) {
		this.jobLevelEntity = jobLevelEntity;
	}
	
	
}
