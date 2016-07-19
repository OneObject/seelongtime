package com.longtime.app.ixin.mgr.comment.service;

import java.util.List;

import com.longtime.app.ixin.mgr.comment.model.CommentStudentVo;
import com.longtime.common.utils.Page;

public interface CommentStudentNService {
	/**
	 * 得到总条数 
	 * @param restype
	 * @param domain
	 * @param resid
	 * @return
	 */
     int gettotal(int restype,String domain,String resid,String searchval);
     
     List<CommentStudentVo> getlist(String domain,String resid,String searchval,Page page,int restype);
     
     void del(String id);
     
     void batchdelcomment(String[] ids);
}
