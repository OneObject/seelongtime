package com.longtime.ajy.mweb.service;

import java.util.List;

import com.longtime.ajy.mweb.model.VoteStatisticsQuestionEntity;
import com.longtime.common.service.IService;


public interface VoteStatisticsQuestionService extends IService<VoteStatisticsQuestionEntity, String>{
	
	/**
	 * 根据调研活动id查询所有统计信息
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:37:36
	 * @param id
	 * @return
	 */
	List<VoteStatisticsQuestionEntity> getList(String id);
}
