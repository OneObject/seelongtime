package com.longtime.app.oplog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.googlecode.genericdao.search.Filter;
import com.googlecode.genericdao.search.Search;
import com.googlecode.genericdao.search.Sort;
import com.longtime.app.oplog.dao.OpLogDao;
import com.longtime.app.oplog.model.OpLog;
import com.longtime.app.oplog.service.OpLogService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

@Service("opLogService")
public class OpLogServiceImpl extends BaseService4HImpl<OpLog, String> implements OpLogService{
	
	@Resource(name = "opLogDao")
	private OpLogDao opLogDao;
	
	@Override
	public BaseDAO<OpLog, String> getDAO() {
		return this.opLogDao;
	}

	@Override
	public boolean isExist(String id, int type, String domain) {
		String hql = "from OpLog where sid=? and type=? and domain=? ";
		List<OpLog> list = opLogDao.list(hql, id,type,domain);
		if(CollectionUtils.isNotEmpty(list)){
			return true;
		}
		return false;
	}
	
	@Override
	public List<OpLog> getNeedSyncList(String domain, Page page) {
		Search search = new Search();
		search.addFilterEqual("domain", domain);
		search.addFilter(Filter.or(
				Filter.equal("sync", 0),
				Filter.and(Filter.equal("sync", -1),Filter.lessOrEqual("failnum", 1))));
		search.addSort(Sort.asc("createtime"));
		ResultSet<OpLog> rs = this.opLogDao.query(search, page);
		if(rs != null){
			return rs.getItems();
		}
		return null;
	}
}
