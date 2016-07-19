package com.longtime.app.ixin.mgr.service;


import java.util.List;

import com.longtime.app.ixin.mgr.model.ApplyRewardRecord;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.RewardCardItem;
import com.longtime.app.ixin.mgr.model.RewardExplain;
import com.longtime.app.ixin.mgr.model.RewardResultVO;
import com.longtime.app.ixin.mgr.model.RewardRuleContainer;
import com.longtime.app.ixin.mgr.model.RewardRuleContainerVO;
import com.longtime.app.ixin.protal.activity.vo.ApplyRewardVO;
import com.longtime.common.utils.Page;

public interface IRewardService {
	
	
	public List<RewardActivity> queryByPage(String name,String domain,Page page);
	
	public RewardActivity getRewardById(String id);
	
	public String addRewardFirstStep(RewardActivity reward);
	
	public String addRewardSecondStep(String id, RewardExplain explain);
	
	public boolean addRewardThirdStep(RewardRuleContainerVO reward);
	
	public List<RewardActivity> getRewardByDomain(String domain, int currPage);
	
	public List<RewardActivity> getRewardByDomain(String domain,int currentpage,int pagesize,String param);
	
	public List<RewardCardItem> getAwards(String rewardId);
	
	public int getApplyCount(String rewardId,String containerId, String userId);
	
	public ApplyRewardVO applyCardReward(String rewardId, String userId, String containerId);
	
	public boolean processReward(RewardCardItem award, ApplyRewardRecord record);
	
	public ApplyRewardVO doFinishReward(String code, String awardId, String recordId, String tel);
	
	public List<RewardActivity> getUnclosedReward(String domain);
	
	public boolean stopRewardActive(String rewardId);
	
	public List<RewardResultVO> getWinners(String rewardId, int currPage);
	
	public ApplyRewardVO getWinnerRecordByUid(String rewardId, String uid);
	
	public int getWinCount(String rewardId);
	
	public boolean deleteRewardById(String id); 
	
	public int getRewardCount(String domain);
	
	public boolean modifyRewardFirstStep(RewardActivity reward);
	
	public String modifyRewardSecondStep(String id, RewardExplain explain);
	
	public boolean modifyRewardThirdStep(RewardActivity reward);

	public RewardRuleContainer getRuleContainer(String rewardId);

	public List<RewardRuleContainer> getRewardRuleContainers(String id);

	public RewardRuleContainer getRewardRuleContainerById(String id);

	public boolean updateContainer(RewardRuleContainerVO reward);

	public boolean deleteRewardRuleContainer(String id);

	public List<RewardActivity> getRewardByDomainHasKey(String domain,
			int currPage, int pageSize);

	public int getRewardCountHasKey(String domain);
	
	public int getRewardCount(String domain, String param);
}
