package com.longtime.app.base.service.impl;

import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.longtime.app.base.dao.UserLinkJobLevelDao;
import com.longtime.app.base.model.UserLinkJobLevel;
import com.longtime.app.base.service.UserLinkJobLevelService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.ResultSet;

@Service("userLinkJobLevelService")
public class UserLinkJobLevelServiceImpl extends BaseService4HImpl<UserLinkJobLevel,String> implements UserLinkJobLevelService {
    
	@Resource
	private UserLinkJobLevelDao userLinkJobLevelDao;
	@Override
	public BaseDAO<UserLinkJobLevel, String> getDAO() {
		return this.userLinkJobLevelDao;
	}
	@Override
	public List<UserLinkJobLevel> getlists(String userid) {
		return this.userLinkJobLevelDao.getlists(userid);
	}

	@Override
	public List<String> getByJobIds(Collection<String> jobIds) {
		Search search = new Search();
		search.addFilter(Filter.in("joblevelid", jobIds));
		ResultSet<UserLinkJobLevel> rs = userLinkJobLevelDao.query(search);
		List<String> uids = Lists.newArrayList();
		if(rs != null && CollectionUtils.isNotEmpty(rs.getItems())){
			for(UserLinkJobLevel entity : rs.getItems()){
				uids.add(entity.getUserid());
			}
		}
		
		return uids;
	}
}
