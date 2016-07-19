package com.longtime.app.ixin.mgr.praise.service;

import java.util.List;

import com.longtime.app.base.model.Praise;
import com.longtime.app.ixin.mgr.praise.model.PraiseStudentVo;
import com.longtime.common.utils.Page;

public interface PraiseStudentService {
	/**
	 * 得到总条数 
	 * @param restype
	 * @param domain
	 * @param resid
	 * @return
	 */
     int gettotal(int restype,String domain,String resid,String searchval);
     
     List<PraiseStudentVo> getlist(String domain,String resid,String searchval,Page page,int restype);

	Praise getPraiseByParams(String id, String domain, int restype,int type);
}
