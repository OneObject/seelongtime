package com.longtime.app.ixin.mgr.topic.service;

import java.util.List;

import com.longtime.app.ixin.mgr.topic.model.CommentEntity;

//话题评论
public interface CommentService {

	/**
	 * 得到话题评论的总记录数
	 * @param topicId
	 * @return
	 */
	int getTopicCommentTotalSize(String topicId);

	/**
	 * 根据topicId获取列表
	 * @param pageSize
	 * @param currPage
	 * @param topicId
	 * @return
	 */
	List<CommentEntity> queryCommentListByTopicId(int pageSize,int currPage,String topicId);
	
	
	
	/**
	 * 根据topicId获取在墙上的评论列表
	 * @param pageSize
	 * @param currPage
	 * @param topicId
	 * @return
	 */
	List<CommentEntity> queryInWallCommentListByTopicId(int pageSize,int currPage,String topicId);

	/**
	 * 改变评论的状态，是否屏蔽
	 * @param id
	 * @param shield 1 代表屏蔽 0代表未屏蔽
	 */
	void updateCommentShieldStatus(String id, int shield);
	
	
	void deleteById(String id);

	/**批量更新评论状态
	 * 
	 * @param shield 1 代表屏蔽 0代表未屏蔽
	 * @param ids 评论id列表
	 */
	void batchUpdateShield(int shield, String[] ids);

}
