package com.longtime.app.ixin.mgr.topic.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.topic.model.CommentStudentEntity;

public interface CommentStudentDao {
	List<CommentStudentEntity>  getlist(String domain,String topicid,String searchval,int pagesize,int currpage);
	
	 int gettotalnum(String domain,String topicid,String searchval);
	 
	 void delstudentcomment(String id);
	 
	 void batchdelcomment(String[] ids);
	 
	 void shieldcomment(String id,String status);
}
