package com.longtime.ajy.mweb.service;

import java.util.List;
import java.util.Map;

public interface NSurveyService {
	/**
	 * 检查是否参加过调研活动
	 * @author yangwenkui
	 * @time 2016年6月22日 下午10:37:08
	 * @param activityId
	 * @param uid
	 * @return
	 */
	boolean checkUserIsParticipate(String activityId, String uid);

	List<Map<String, Object>> getAllOpenId();
	
}
