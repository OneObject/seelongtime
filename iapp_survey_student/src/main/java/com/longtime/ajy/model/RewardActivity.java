package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;
//抽奖
public class RewardActivity extends BaseEntity<String>{

	private static final long serialVersionUID = -1522353615075250377L;
	public static final String REWARD_TYPE_CARD = "card";
	public static final String HANDLER_KEY = "card";
	public static final String HANDLER_KEY_CN = "刮刮卡";
	
	private RewardExplain explain1;
	private RewardExplain explain2;
	
	private long createDate;
	private String title1;
	private String content1;
	private String picUrl1;
	private String title2;
	private String content2;
	private String picUrl2;
	private long startDate;
	private long endDate;
	private String rewardType;
	private String key;
	private String replyContent;
	private int showRewardNum;
	private double rewardRate;
	private int maxAttendNum;
	private int isCreateFinish;  // 0：未创建完成       1：创建完成
	private String domain;
	private int isDelete;   //0：未标记删除      1：标记删除
	private int status;  //0: 未开始    1：进行中   2：已结束     不存数据库，每次从数据库查询出后通过startDate  endDate判断设置
	private String activityId;//活动ID
	
	
	public String getTitle1() {
		return title1;
	}
	public void setTitle1(String title1) {
		this.title1 = title1;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getPicUrl1() {
		return picUrl1;
	}
	public void setPicUrl1(String picUrl1) {
		this.picUrl1 = picUrl1;
	}
	public String getTitle2() {
		return title2;
	}
	public void setTitle2(String title2) {
		this.title2 = title2;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getPicUrl2() {
		return picUrl2;
	}
	public void setPicUrl2(String picUrl2) {
		this.picUrl2 = picUrl2;
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
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	@Override
	public String getId() {
		return this.id;
	}
	@Override
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
	
	
}
