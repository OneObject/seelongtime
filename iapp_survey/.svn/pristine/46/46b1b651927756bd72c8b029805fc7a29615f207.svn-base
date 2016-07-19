package com.longtime.app.ixin.mgr.vote.service;

import java.util.List;

import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.model.VoteStatisticsQuestionEntity;
import com.longtime.common.service.BaseService;

public interface VoteStatisticsQuestionService extends BaseService<VoteStatisticsQuestionEntity, String>{

	/**
	 * 初始化统计信息
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:10:02
	 * @param entity
	 */
	void doInit(VoteActivityEntity entity);
	
	/**
	 * 根据调研活动id查询所有统计信息
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:37:36
	 * @param id
	 * @return
	 */
	List<VoteStatisticsQuestionEntity> getList(String id);

}
