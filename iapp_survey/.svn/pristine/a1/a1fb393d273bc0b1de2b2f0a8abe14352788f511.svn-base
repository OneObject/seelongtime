package com.longtime.app.ixin.mgr.topic.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.topic.model.CommentEntity;

public interface CommentDao {

	/**
	 * 根据话题Id获取总的评论数
	 * @param topicId
	 * @return
	 */
	int getTopicCommentTotalSize(String topicId);

	/**
	 * 根据话题ID分页查询列表
	 * @param pageSize
	 * @param currPage
	 * @param topicId
	 * @return
	 */
	List<CommentEntity> queryCommentListByTopicId(int pageSize, int currPage,
			String topicId);
	
	List<CommentEntity> queryInWallCommentListByTopicId(int pageSize, int currPage,
			String topicId);

	/**
	 * 改变评论的屏蔽状态
	 * @param id
	 * @param shield
	 */
	void updateCommentShieldStatus(String id, int shield);

	/**
	 * 保存用户评论
	 * @param openId
	 * @param content
	 */
	void saveUserTopicComment(CommentEntity entity);
	
	
	/**
	 * 根据id获取评论
	 * @param id
	 * @return
	 */
	CommentEntity loadById(String id);
	
	
	/**
	 * 删除评论 物理删除
	 * @param id
	 */
	void deleteById(String id);

}
