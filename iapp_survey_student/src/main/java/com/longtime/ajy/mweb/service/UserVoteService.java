package com.longtime.ajy.mweb.service;

import java.util.List;

import com.longtime.ajy.mweb.model.UserVoteEntity;
import com.longtime.ajy.mweb.model.VoteActivityEntity;
import com.longtime.common.service.IService;


public interface UserVoteService extends IService<UserVoteEntity, String>{
	
	 /**
     * 获取指定调研活动的参与情况
     * @author yangwenkui
     * @time 2016年6月21日 下午10:49:08
     * @param list
     * @param string
     * @return
     */
	List<String> getActivityIds(List<VoteActivityEntity> list, String uid);

	/**
	 * 检查是否参加过调研活动
	 * @author yangwenkui
	 * @time 2016年6月22日 下午10:39:10
	 * @param id
	 * @param uid
	 * @return
	 */
	boolean checkUserIsParticipate(String id, String uid);

	/**
	 * 获取已参加的调研记录
	 * @author yangwenkui
	 * @time 2016年7月12日 下午10:02:55
	 * @param list
	 * @param id
	 * @return
	 */
	List<UserVoteEntity> getUserVotes(List<VoteActivityEntity> list, String id);
	
}
