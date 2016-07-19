package com.longtime.app.base.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.longtime.app.base.dao.GroupRelationDao;
import com.longtime.app.base.model.BaseGroupRelation;
import com.longtime.app.base.service.GroupRelationService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.ResultSet;

@Service
public class GroupRelationServiceImpl extends BaseService4HImpl<BaseGroupRelation,String> implements GroupRelationService {
    
	@Resource
	private GroupRelationDao groupRelationDao;
	
	@Override
	public BaseDAO<BaseGroupRelation, String> getDAO() {
		return this.groupRelationDao;
	}

	@Override
	public List<BaseGroupRelation> getGroupRelations(String gid, String domain,
			int type) {

		Search search=new Search();
		
		search.addFilterEqual("domain",domain);
		search.addFilterEqual("gid",gid);
		search.addFilterEqual("type",type);
		
		ResultSet<BaseGroupRelation> rs=this.groupRelationDao.query(search);
		
		if(rs!=null && rs.getItems()!=null && rs.getItems().size()>0){
			return rs.getItems();
		}
		
		return null;
	}

	@Override
	public void deleteByGid(String gid) {
		this.groupRelationDao.deleteByGid(gid);
		
	}

	@Override
	public void deleteByGidAndType(String gid, int type) {
		this.groupRelationDao.deleteByGidAndType(gid,type);
	}

	
	@Override
	public List<BaseGroupRelation> getGroupRelations(List<String> ugList,String domain) {
		if(CollectionUtils.isEmpty(ugList)){
			return Lists.newArrayList();
		}
		
		Search search=new Search();
		search.addFilterEqual("domain",domain);
		search.addFilter(Filter.in("gid", ugList));
		ResultSet<BaseGroupRelation> rs=this.groupRelationDao.query(search);
		
		if(rs != null && rs.getItems() != null){
			return rs.getItems();
		}
		return Lists.newArrayList();
	}
}
