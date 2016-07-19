package com.longtime.app.base.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.longtime.app.base.dao.UserLinkJobLevelDao;
import com.longtime.app.base.model.UserLinkJobLevel;
import com.longtime.common.dao.BaseDAOImpl;

@Repository("userLinkJobLevelDao")
public class UserLinkJobLevelDaoImpl extends BaseDAOImpl<UserLinkJobLevel,String> implements UserLinkJobLevelDao{
    
	@Override
	public List<UserLinkJobLevel> getlists(String userid){
        String hql="select a from UserLinkJobLevel a where userid=?";
		return this.list(hql,userid);
	}
}
