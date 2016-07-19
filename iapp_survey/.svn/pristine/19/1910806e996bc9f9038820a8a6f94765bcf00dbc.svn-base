package com.longtime.app.ixin.mgr.rank.service;

import java.util.List;


import com.longtime.app.ixin.mgr.rank.model.RankEntity;
import com.longtime.app.track.model.ReportVisitEntity;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

//话题评论
public interface RankService {

	RankEntity getById(String id);
	
	RankEntity insetOrUpdata(RankEntity rank);
	
	int deleteById(String id);
	
	ResultSet<RankEntity> getResultSet(String domain,Page page);
	
	ResultSet<RankEntity> getResultSet(String domain,String name,Page page);
	
	List<ReportVisitEntity> listTopVisitNum(Long start,Long end,Page page,String domain ,String model);
	ResultSet<RankEntity> getResultSet(String domain, Page page, String model);

}
