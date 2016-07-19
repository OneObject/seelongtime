package com.longtime.app.ixin.mgr.model;

public class ActivityInfo {
	public static final String HANDLER_KEY = "activity";
	public static final String HANDLER_KEY_CN = "活动";
	public static final String HANDLER_KEY_SIGN = "sign_activity";
	
	private String id;
	private String domain;
	private String name;
	private String sponsor;
	private String address;
	private long createDate=System.currentTimeMillis();
	private long startDate;
	private long endDate;
	private long lastApplyDate;
	private String picUrl;
	private String desc;
	private String content;
	private String remark;
	private String signinCode;
	private int isopen=1;//是否公开 1是0否
	private int hasLimit; //签到后显示活动内容 1是  0否
	private int afterSignIn; //签到后可参加子活动 1是 0否
	private int showTopic=1;//在微信端是否显示话题 1是0否
	private int showQuestion=0;//在微信端是否显示话题 1是0否
	private int mapShowInDetail=0;//是否在活动详情中显示地图 1显示0不显示
	private String coordinate;//地址的坐标默认为空
	private int startSignLocation=0;//是否开启签到定位 0不开起1开启
	
	private String creator;
	private String updater;
	private Long updatetime=0L;
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
	public String getCoordinate() {
		return coordinate;
	}
	public void setCoordinate(String coordinate) {
		this.coordinate = coordinate;
	}
	private String findKeys;
	private int isDelete; //标记删除  0：不删除    1：删除
 	private int status;  //0: 未开始    1：进行中   2：已结束     不存数据库，每次从数据库查询出后通过startDate  endDate判断设置
 	
 	private int apply=1; // 0 无需报名  1需报名
 	private int signin=1;// 0无需签到   1需要签到
 	private String style;//活动展示风格 "time" 时间轴方式  "series" 系列方式
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getCreateDate() {
		return createDate;
	}
	public void setCreateDate(long createDate) {
		this.createDate = createDate;
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
	public long getLastApplyDate() {
		return lastApplyDate;
	}
	public void setLastApplyDate(long lastApplyDate) {
		this.lastApplyDate = lastApplyDate;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSigninCode() {
		return signinCode;
	}
	public void setSigninCode(String signinCode) {
		this.signinCode = signinCode;
	}
	public int getHasLimit() {
		return hasLimit;
	}
	public void setHasLimit(int hasLimit) {
		this.hasLimit = hasLimit;
	}
	public int getAfterSignIn() {
		return afterSignIn;
	}
	public void setAfterSignIn(int afterSignIn) {
		this.afterSignIn = afterSignIn;
	}
	public String getFindKeys() {
		return findKeys;
	}
	public void setFindKeys(String findKeys) {
		this.findKeys = findKeys;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public int getApply() {
		return apply;
	}
	public void setApply(int apply) {
		this.apply = apply;
	}
	public int getSignin() {
		return signin;
	}
	public void setSignin(int signin) {
		this.signin = signin;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public int getMapShowInDetail() {
		return mapShowInDetail;
	}
	public void setMapShowInDetail(int mapShowInDetail) {
		this.mapShowInDetail = mapShowInDetail;
	}
	public int getStartSignLocation() {
		return startSignLocation;
	}
	public void setStartSignLocation(int startSignLocation) {
		this.startSignLocation = startSignLocation;
	}
	public int getShowTopic() {
		return showTopic;
	}
	public void setShowTopic(int showTopic) {
		this.showTopic = showTopic;
	}
	public int getIsopen() {
		return isopen;
	}
	public void setIsopen(int isopen) {
		this.isopen = isopen;
	}
	public int getShowQuestion() {
		return showQuestion;
	}
	public void setShowQuestion(int showQuestion) {
		this.showQuestion = showQuestion;
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
	
}
