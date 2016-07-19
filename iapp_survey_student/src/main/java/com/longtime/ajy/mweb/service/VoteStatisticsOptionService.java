package com.longtime.ajy.mweb.service;

import java.util.List;

import com.longtime.ajy.mweb.model.VoteStatisticsOptionEntity;
import com.longtime.common.service.IService;


public interface VoteStatisticsOptionService extends IService<VoteStatisticsOptionEntity, String>{
	
	
	/**
	 * 根据活动id查询所有统计信息
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:43:07
	 * @param id
	 * @return
	 */
	List<VoteStatisticsOptionEntity> getList(String id);
	
}
