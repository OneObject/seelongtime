package com.longtime.app.base.service;


import com.longtime.app.base.model.LabelEntity;
import com.longtime.app.base.model.User;
import com.longtime.common.service.BaseService;

public interface LabelEntityService extends BaseService<LabelEntity,String>{

	/**
	 * 添加标签
	 * @author yangwenkui
	 * @time 2016年6月12日 下午11:52:35
	 * @param entity
	 * @param user
	 */
	void doAdd(String labels,String rid,int rtype, User user);

}
