package com.longtime.app.ixin.mgr.topic.service;

import java.util.List;

import com.longtime.app.ixin.mgr.topic.model.CommentStudentEntity;

public interface CommentStudentService {
  List<CommentStudentEntity>  getlist(String domain,String topicid,String searchval,int pagesize,int currpage);
  
  int gettotalnum(String domain,String topicid,String searchval);
  
  void delstudentcomment(String id);
  
  void batchdelcomment(String[] ids);
  /**
   * 屏蔽/取消屏蔽 评论
   * @param id
   * @param status
   */
  void shieldcommnet(String id,String status);
}
