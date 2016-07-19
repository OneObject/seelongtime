package com.longtime.ajy.mweb.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.longtime.ajy.mweb.repository.SpecialRepository;
import com.longtime.ajy.mweb.service.NSurveyService;
@Service("nsurveyService")
public class NSurveyServiceImpl implements NSurveyService {
	
	 @Resource
	 SpecialRepository specialRepository;
	 
	@Override
	public boolean checkUserIsParticipate(String activityId, String uid) {
		int count= specialRepository.getUserVoteInfo(activityId, uid);
		return count!=0;
	}

	@Override
	public List<Map<String, Object>> getAllOpenId() {
		List<Map<String, Object>> list = specialRepository.getAllOpenId();
		return list;
	} 
	 
}
