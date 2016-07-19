package com.longtime.app.ixin.mgr.rank.dao;

import com.longtime.common.utils.ResultSet;

import java.util.List;

import com.longtime.app.ixin.mgr.rank.model.RankEntity;
import com.longtime.common.utils.Page;

public interface RankDao {

	
	RankEntity getById(String id);
	
	RankEntity insetOrUpdata(RankEntity rank);
	
	int deleteById(String id);
    
	List<RankEntity> getList(String domain,Page page);
	
	int getcount(String domain,String model);
	
	ResultSet<RankEntity> getResultSet(String domain,String name,Page page);

	List<RankEntity> getList(String domain, Page page, String model);
}
