package com.longtime.app.ixin.mgr.vote.service;

import java.util.List;

import com.longtime.app.ixin.mgr.vote.model.VoteStatisticsOptionEntity;
import com.longtime.common.service.BaseService;

public interface VoteStatisticsOptionService extends BaseService<VoteStatisticsOptionEntity, String>{

	/**
	 * 根据活动id查询所有统计信息
	 * @author yangwenkui
	 * @time 2016年6月26日 上午10:43:07
	 * @param id
	 * @return
	 */
	List<VoteStatisticsOptionEntity> getList(String id);

}
