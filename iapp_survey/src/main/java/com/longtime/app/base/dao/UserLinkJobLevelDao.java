package com.longtime.app.base.dao;

import java.util.List;

import com.longtime.app.base.model.UserLinkJobLevel;
import com.longtime.common.dao.BaseDAO;

public interface UserLinkJobLevelDao extends BaseDAO<UserLinkJobLevel,String> {
	
	List<UserLinkJobLevel> getlists(String userid);

}
