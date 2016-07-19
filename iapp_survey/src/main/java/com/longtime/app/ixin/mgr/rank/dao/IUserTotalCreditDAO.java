package com.longtime.app.ixin.mgr.rank.dao;

import com.longtime.app.ixin.mgr.rank.model.UserTotalCreditEntityVO;
import java.util.List;

public interface IUserTotalCreditDAO {
	/**
	 * 查看积分排行
	 * @return
	 */
	public List<UserTotalCreditEntityVO> getCreditEntityRanking(String domain,int pageSize);
}
