package com.longtime.app.ixin.mgr.praise.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.base.model.Praise;
import com.longtime.app.ixin.mgr.praise.dao.PraiseStudentDao;
import com.longtime.app.ixin.mgr.praise.model.PraiseStudentVo;
import com.longtime.common.utils.Page;

@Service
public class PraiseStudentServiceImpl implements PraiseStudentService {
    @Resource
    private PraiseStudentDao praiseStudentDao;
	
	@Override
	public int gettotal(int restype, String domain, String resid,
			String searchval) {
		return praiseStudentDao.gettotal(restype, domain, resid, searchval);
	}

	@Override
	public List<PraiseStudentVo> getlist(String domain, String resid,
			String searchval, Page page, int restype) {
		return praiseStudentDao.getlist(domain, resid, searchval, page, restype);
	}

	@Override
	public Praise getPraiseByParams(String rid, String domain, int restype,int type) {
		return praiseStudentDao.getPraiseByParams(rid,domain,restype,type);
	}

}
