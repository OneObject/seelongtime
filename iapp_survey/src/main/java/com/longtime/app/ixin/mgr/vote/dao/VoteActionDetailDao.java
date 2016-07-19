package com.longtime.app.ixin.mgr.vote.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.vote.model.VoteActionDetailEntity;
import com.longtime.common.dao.BaseDAO;

public interface VoteActionDetailDao extends BaseDAO<VoteActionDetailEntity, String>{

	/**
	 * @author yangwenkui
	 * @time 2016年7月2日 下午5:01:43
	 * @param id
	 * @param domain
	 * @return
	 */
	List<VoteActionDetailEntity> listAskAndFillIn(String id, String domain);

	
}
