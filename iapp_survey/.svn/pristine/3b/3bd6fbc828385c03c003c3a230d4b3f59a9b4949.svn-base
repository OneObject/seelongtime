package com.longtime.app.base.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.googlecode.genericdao.search.Search;
import com.longtime.app.base.dao.CommentDao;
import com.longtime.app.base.model.Comment;
import com.longtime.app.base.service.CommentService;
import com.longtime.common.dao.BaseDAO;
import com.longtime.common.service.BaseService4HImpl;

@Service("commentService")
public class CommentServiceImpl extends BaseService4HImpl<Comment, Long> implements CommentService{
    
    @Resource
    private CommentDao	commentDao;
    
    @Override
    public BaseDAO<Comment, Long> getDAO() {
        return commentDao;
    }

	@Override
	public int countByResid(String id, int restype) {
		Search search = new Search();
		search.addFilterEqual("resid", id);
		search.addFilterEqual("restype", restype);
		return commentDao.count(search);
	}
}
