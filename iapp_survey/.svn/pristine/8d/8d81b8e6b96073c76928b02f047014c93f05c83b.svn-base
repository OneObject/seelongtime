package com.longtime.app.ixin.mgr.vote.service;

import java.util.List;

import com.longtime.app.base.model.User;
import com.longtime.app.ixin.mgr.vote.model.VoteActivityEntity;
import com.longtime.app.ixin.mgr.vote.vo.VoteQuestionVO;
import com.longtime.common.service.BaseService;

public interface VoteActivityService extends BaseService<VoteActivityEntity, String>{
	/**
	 * 获取比weight大或小的调研活动
	 * @author yangwenkui
	 * @time 2016年6月13日 下午10:07:10
	 * @param domain 域
	 * @param weight 排序值
	 * @param upOrDown up | down
	 * @param vid 调研活动id
	 * @return
	 */
	VoteActivityEntity findByUpOrDown(String domain, long weight, String upOrDown, String vid);

	/**
	 * 发送调研通知
	 * @author yangwenkui
	 * @time 2016年6月14日 下午11:13:31
	 * @param id
	 */
	void doSendNotify(String id);

	/**
	 * 改变发布状态
	 * @author yangwenkui
	 * @time 2016年6月19日 下午8:57:59
	 * @param id
	 * @param status
	 * @return
	 */
	boolean doRelease(String id, String status);

	/**
	 * 生成调研活动的静态文件
	 * @author yangwenkui
	 * @time 2016年6月19日 下午9:28:13
	 * @param vote_activity_id
	 * @return
	 */
	boolean createPaper(String vote_activity_id);

	/**
	 * 
	 * @author yangwenkui
	 * @time 2016年6月30日 下午9:56:59
	 * @param entity
	 * @param user
	 */
	void doAdd(VoteActivityEntity entity, User user);

	/**
	 * @author yangwenkui
	 * @time 2016年6月30日 下午9:58:49
	 * @param entity
	 * @param user
	 */
	void doUpdate(VoteActivityEntity entity, User user);

	/**
	 * 获取调研实体及调研统计信息
	 * @author yangwenkui
	 * @time 2016年7月2日 上午10:17:27
	 * @param voteActivityEntity
	 * @return
	 */
	List<VoteQuestionVO> getQuestionsWithStatistics(VoteActivityEntity voteActivityEntity);

}
