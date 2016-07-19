package com.longtime.app.ixin.mgr.dao;

import java.util.List;

import com.longtime.app.ixin.mgr.model.ApplyRewardRecord;
import com.longtime.app.ixin.mgr.model.RewardActivity;
import com.longtime.app.ixin.mgr.model.RewardCardItem;
import com.longtime.app.ixin.mgr.model.RewardItem;
import com.longtime.app.ixin.mgr.model.RewardResultVO;
import com.longtime.app.ixin.mgr.model.RewardRuleContainer;
import com.longtime.app.ixin.protal.activity.vo.ApplyRewardVO;
import com.longtime.common.utils.Page;

public interface IRewardDao {
    
	public List<RewardActivity> queryByPage(String name,String domain,Page page);
	
	public RewardActivity queryById(String id);
	
	public boolean save(RewardActivity reward);
	
	public boolean update(RewardActivity reward);
	
	public boolean save(RewardItem item);
	
	public List<RewardActivity> query(String domain, int currPage, int pageSize);
	
	public List<RewardActivity> queryByDate(String domain, long nowDate);
	
	public List<RewardCardItem> queryAwards(String containerId);
	
	public int queryAwardsNum(String rewardId);
	
	public boolean saveRecord(ApplyRewardRecord record);
	
	public boolean updateRecord(ApplyRewardRecord record);
	
	public int queryApplyCount(String rewardId,String containId, String userId);
	
	public boolean cutAwardRemainingNum(RewardCardItem award);
	
	public ApplyRewardRecord queryRecord(String id);
	
	public RewardCardItem queryAwardById(String id);
	
	public RewardActivity queryByKeys(String keys, String string);
	
	public List<RewardResultVO> queryWiningRecord(String rewardId, int currPage, int pageSize);
	
	public ApplyRewardVO queryWiningRecordByUid(String rewardId, String uid);
	
	public int queryWinCount(String rewardId);
	
	public boolean deleteReward(String rewardId); 
	
	public int queryRewardCount(String domain);
	
	public boolean updateAward(RewardCardItem award);
	
	public boolean deleteAwardById(String id);

	public RewardRuleContainer queryRuleContainer(String rewardId);

	public RewardRuleContainer getRuleContainerById(String containerId);

	public boolean save(RewardRuleContainer rewardRuleContainer);

	public List<RewardRuleContainer> getRewardRuleContainers(String rewardId);

	public boolean updateContainer(RewardRuleContainer container);

	public boolean deleteRewardRuleContainer(String id);

	public int queryRewardCountHasKey(String domain);

	public List<RewardActivity> queryHasKey(String domain, int currPage,
			int pageSize);
	
	public List<RewardActivity> getRewardByDomain(String domain,int currentpage,int pagesize,String param);
	
	public int getRewardCount(String domain,String param);

}
