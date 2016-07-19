package com.longtime.app.ixin.mgr.comment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.comment.dao.CommentStudentNDao;
import com.longtime.app.ixin.mgr.comment.model.CommentStudentVo;
import com.longtime.common.utils.Page;

@Service("commentStudentNService")
public class CommentStudentNServiceImpl implements CommentStudentNService {
    @Resource
    private CommentStudentNDao commentStudentNDao;
    
    
    
	@Override
	public int gettotal(int restype, String domain, String resid,
			String searchval) {
		return this.commentStudentNDao.gettotal(restype, domain, resid, searchval);
	}

	@Override
	public List<CommentStudentVo> getlist(String domain, String resid,
			String searchval, Page page, int restype) {
		return this.commentStudentNDao.getlist(domain, resid, searchval, page, restype);
	}

	@Override
	public void del(String id) {
		this.commentStudentNDao.del(id);
	}

	@Override
	public void batchdelcomment(String[] ids) {
        this.commentStudentNDao.batchdelcomment(ids);	
	}


}
