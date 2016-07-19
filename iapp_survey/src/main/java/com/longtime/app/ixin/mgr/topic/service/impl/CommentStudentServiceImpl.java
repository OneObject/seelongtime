package com.longtime.app.ixin.mgr.topic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.app.ixin.mgr.topic.dao.CommentStudentDao;
import com.longtime.app.ixin.mgr.topic.model.CommentStudentEntity;
import com.longtime.app.ixin.mgr.topic.service.CommentStudentService;

@Service(value = "commentStudentService")
public class CommentStudentServiceImpl implements CommentStudentService{
    
	@Resource
	private CommentStudentDao commentStudentDao;
	
	@Override
	public List<CommentStudentEntity> getlist(String domain, String topicid,
			String searchval, int pagesize, int currpage) {
		return this.commentStudentDao.getlist(domain, topicid, searchval, pagesize, currpage);
	}

	@Override
	public int gettotalnum(String domain, String topicid, String searchval) {
		return this.commentStudentDao.gettotalnum(domain, topicid, searchval);
	}

	@Override
	public void delstudentcomment(String id) {
         this.commentStudentDao.delstudentcomment(id);		
	}
	

	@Override
	public void batchdelcomment(String[] ids) {
        this.commentStudentDao.batchdelcomment(ids);		
	}

	@Override
	public void shieldcommnet(String id, String status)
	{
		this.commentStudentDao.shieldcomment(id, status);
	}

}
