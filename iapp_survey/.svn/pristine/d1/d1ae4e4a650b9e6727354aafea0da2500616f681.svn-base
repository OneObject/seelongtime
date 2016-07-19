package com.longtime.app.ixin.mgr.rank.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.longtime.app.ixin.mgr.rank.dao.RankDao;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.rank.model.RankEntity;
import com.longtime.app.ixin.mgr.rank.service.RankService;
import com.longtime.app.track.model.ReportVisitEntity;
import com.longtime.app.track.repository.ReportVisitDao;
import com.longtime.common.utils.Page;
import com.longtime.common.utils.ResultSet;

@Service("rankService")
public class RankServiceImpl implements RankService{

	@Resource
	private RankDao rankDao;
	
	@Resource
	private ReportVisitDao reportVisitDao;
	
	@Override
	public RankEntity getById(String id) {
		return rankDao.getById(id);
	}

	@Override
	public RankEntity insetOrUpdata(RankEntity rank) {
		return rankDao.insetOrUpdata(rank);
	}

	@Override
	public int deleteById(String id) {
		return this.rankDao.deleteById(id);
	}
	
	

	@Override
	public ResultSet<RankEntity> getResultSet(String domain,Page page) {
		ResultSet<RankEntity> rSet=new ResultSet<RankEntity>();
		List<RankEntity> list=this.rankDao.getList(domain,page);
		if(list!=null && list.size()>0){
			rSet.setItems(list);
			//得到总条数
			int count=this.rankDao.getcount(domain,"0");
			page.setTotal_size(count);
			rSet.setPage(page);
			return rSet;
		}
		return null;
	}

	@Override
	public ResultSet<RankEntity> getResultSet(String domain,String name,Page page){
		return rankDao.getResultSet(domain,name,page);
	}

	@Override
	public ResultSet<RankEntity> getResultSet(String domain, Page page,String model) {
		ResultSet<RankEntity> rSet=new ResultSet<RankEntity>();
		List<RankEntity> list=this.rankDao.getList(domain,page,model);
		if(list!=null && list.size()>0){
			rSet.setItems(list);
			int count=this.rankDao.getcount(domain,model);
			page.setTotal_size(count);
			rSet.setPage(page);
			return rSet;
		}
		return null;
	}
	
	@Override
	public List<ReportVisitEntity> listTopVisitNum(Long start,Long end,Page page,String domain,String model) {
		List<ReportVisitEntity> list = this.reportVisitDao.listTopVisitNum(start,end,page,domain,model);
		return list;
	}

}
