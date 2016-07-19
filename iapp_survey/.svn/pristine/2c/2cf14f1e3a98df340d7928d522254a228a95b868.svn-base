package com.longtime.app.ixin.mgr.model;

import java.util.List;

public class RewardActivity {
	public static final String REWARD_TYPE_CARD = "card";
	public static final String REWARD_TYPE_ROCK = "rock";
	public static final String HANDLER_KEY = "card";
	public static final String HANDLER_KEY_CN = "刮刮卡";
	private String id;
	private long createDate;
	private RewardExplain explain1;
	private RewardExplain explain2;
	private long startDate;
	private long endDate;
	private String rewardType;
	private String key;
	private String replyContent;
	private List<RewardItem> items;
	private int showRewardNum;
	private double rewardRate;
	private int maxAttendNum;
	private int isCreateFinish;  // 0：未创建完成       1：创建完成
	private String domain;
	private int isDelete;   //0：未标记删除      1：标记删除
	private int status;  //0: 未开始    1：进行中   2：已结束     不存数据库，每次从数据库查询出后通过startDate  endDate判断设置
	private String creator;
	private String updater;
	private Long updatetime;
	private String creatorName;
	private String updaterName;
	public String getCreatorName() {
		return creatorName;
	}
	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}
	public String getUpdaterName() {
		return updaterName;
	}
	public void setUpdaterName(String updaterName) {
		this.updaterName = updaterName;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public Long getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
	}


	private List<RewardRuleContainer> ruleContainer;
	private String activityId;//活动ID
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public RewardExplain getExplain1() {
		return explain1;
	}
	public void setExplain1(RewardExplain explain1) {
		this.explain1 = explain1;
	}
	public RewardExplain getExplain2() {
		return explain2;
	}
	public void setExplain2(RewardExplain explain2) {
		this.explain2 = explain2;
	}
	public long getStartDate() {
		return startDate;
	}
	public void setStartDate(long startDate) {
		this.startDate = startDate;
	}
	public long getEndDate() {
		return endDate;
	}
	public void setEndDate(long endDate) {
		this.endDate = endDate;
	}
	public String getRewardType() {
		return rewardType;
	}
	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public List<RewardItem> getItems() {
		return items;
	}
	public void setItems(List<RewardItem> items) {
		this.items = items;
	}
	public double getRewardRate() {
		return rewardRate;
	}
	public void setRewardRate(double rewardRate) {
		this.rewardRate = rewardRate;
	}
	
	public int getMaxAttendNum() {
		return maxAttendNum;
	}
	public void setMaxAttendNum(int maxAttendNum) {
		this.maxAttendNum = maxAttendNum;
	}
	public long getCreateDate() {
		return createDate;
	}
	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}
	public int getShowRewardNum() {
		return showRewardNum;
	}
	public void setShowRewardNum(int showRewardNum) {
		this.showRewardNum = showRewardNum;
	}
	public int getIsCreateFinish() {
		return isCreateFinish;
	}
	public void setIsCreateFinish(int isCreateFinish) {
		this.isCreateFinish = isCreateFinish;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<RewardRuleContainer> getRuleContainer() {
		return ruleContainer;
	}
	public void setRuleContainer(List<RewardRuleContainer> ruleContainer) {
		this.ruleContainer = ruleContainer;
	}
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
}
