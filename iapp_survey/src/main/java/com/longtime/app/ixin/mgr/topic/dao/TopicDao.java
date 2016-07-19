package com.longtime.app.ixin.mgr.topic.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.topic.model.TopicEntity;
import com.longtime.app.ixin.mgr.topic.model.TopicStudentEntity;

public interface TopicDao {

	/**
	 * 保存话题信息
	 * @param entity
	 */
	void saveOrUpdate(TopicEntity entity);

	/**
	 * 获取话题总数
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
	 * 根据ＩＤ获取
	 * @param id
	 * @return
	 */
	TopicEntity getTopicEntityById(String id);

	/**
	 * 根据ID删除
	 * @param id
	 */
	void del(String id);

	/** 
	 * 根据关键字查询话题信息
	 * @param domain 
	 */
	TopicEntity queryTopicEntityByKeywords(String keywords, String domain);
	
	List<TopicStudentEntity> getTopicEntities(String searchval,String activityid,String domain,int pagesize,int currpage);
	

	
	List<TopicStudentEntity> getTopicStudentEntities(String searchval,String domain,int pagesize,int currpage);
	
	int getTopicStudentCount(String searchval,String actitityid,String domain);
	
	int getTopicStudentCount(String searchval,String domain);
	
	List<TopicStudentEntity> getTopicEntities(String searchval,String domain,int pagesize,int currpage);
	
	int getTopicStudentCounts(String searchval,String domain);
	
	void delstudenttopic(String id);
	
	TopicStudentEntity getTopicStudentEntity(String id);
	
	void batchtopicstudentdel(String[] ids);
	
	void recommendtopicstudent(String id);
	
	void cancelrecommendtopic(String id);
	
	void topstudenttopic(String id);
	
	void canceltoptopic(String id);	
	/**
	 * 根据id屏蔽话题
	 * @param id
	 * @param shield
	 */
	int  shield(String id,String shield);
	
}
