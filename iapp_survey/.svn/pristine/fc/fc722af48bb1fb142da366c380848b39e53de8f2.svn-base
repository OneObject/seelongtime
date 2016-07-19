package com.longtime.app.ixin.mgr.topic.service;

import java.util.List;

import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicStudentEntity;

public interface TopicService {

	/**
	 * 保存话题信息
	 * @param entity
	 */
	String saveOrUpdate(TopicEntity entity);

	/**
	 * 根据租户获取话题总数
	 * @param domain
	 * @return
	 */
	int getTopicTotalSize(String domain);
	

	/**
	 * 分页查询
	 * @param pageSize
	 * @param currPage
	 * @param domain
	 * @return
	 */
	List<TopicEntity> queryTopicEntityList(int pageSize, int currPage,
			String domain);
	

	/**
	 * 根据Id获取信息
	 * @param id
	 * @return
	 */
	TopicEntity getTopicEntityById(String id);

	/**
	 * 根据ID删除
	 * @param id
	 */
	void del(String id);
	
	List<TopicStudentEntity> getTopicEntities(String searchval,String activityid,String domain,int pagesize,int currpage);
	
	int getTopicStudentCount(String searchval,String actitityid, String domain);
	
	void delstudenttopic(String id);
	
	TopicStudentEntity getTopicStudentEntity(String id);
	
	List<TopicStudentEntity> getTopicStudentEntities(String searchval,String domain,int pagesize,int currpage);
	
	int getTopicStudentCount(String searchval,String domain);
	
	void batchtopicstudentdel(String[] ids);
	
	void recommendtopicstudent(String id);
	
	void cancelrecommendtopic(String id);
	
	void topstudenttopic(String id);
	
	void canceltoptopic(String id);	
	
    List<TopicStudentEntity> getTopicEntities(String searchval,String domain,int pagesize,int currpage);
	
	int getTopicStudentCounts(String searchval,String domain);
	/**
	 * 屏蔽/取消屏蔽 
	 * @param id
	 * @param shield
	 * @return 
	 */
	boolean shield(String id,String shield);
	
}
