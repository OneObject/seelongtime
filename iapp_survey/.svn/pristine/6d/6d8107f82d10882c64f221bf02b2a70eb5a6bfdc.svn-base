package com.longtime.app.ixin.mgr.vote.service;

import java.util.List;

import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.common.service.BaseService;

public interface VoteActionDetailService extends BaseService<VoteActionDetailEntity, String>{

	/**
	 * 查询调研内所有问答和填空题的答案
	 * @author yangwenkui
	 * @time 2016年7月2日 上午10:27:42
	 * @param id
	 * @param domain
	 * @return
	 */
	List<VoteActionDetailEntity> listAskAndFillIn(String id, String domain);

	/**
	 * 查询所有参加调研人员的答案
	 * @author yangwenkui
	 * @time 2016年7月2日 下午9:14:42
	 * @param id
	 * @return
	 */
	List<VoteActionDetailEntity> listByActivityId(String id);

}
