package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;

public class VoteActivityEntity implements Entity<String>{
	private static final long serialVersionUID = -301303615576648961L;
	
	private String id; //投票的ID
	private String title;//主题
	private String coverPath;//投票封面
	private String fileId;//封面的Id
	private String summary;//简介
	private String author;//发起人
	private long startTime;//开始时间
	private long endTime;//结束时间
	private long weight=System.currentTimeMillis();//排序值
	private String labels;//标签，多个标签用英文逗号分开
	private int showresult = 0;//提交之后是否展示结果 0不显示 1显示
	private int isrelease = 0; //发布 0 未发布 1发布中 2已发布
	private int voteNum = 0;//投票数量
	private String rootpaths;//创建用户所属组织的路径，从根节点到其本身，多个id用英文逗号分开
	private String voteId;//调研问卷id
	private String voteName;//调研问卷标题
	private int isOpen = 0;//是否公开调研，该类调研无需授权，所有人皆可参与
	private int isNotify = 1;// 发布时是否提醒参与用户 0否 1是 默认提醒
	private int allowAnonymous = 0;//是否允许匿名 0否 1是
	private int allowUnLogin = 0;//是否允许免登陆参加调研 0不允许 1允许
	private int hasNotified = 0;//是否已经发送了通知 0未发送 1发送中 2已发送
	private String domain;//所属商户
	private String creator;
	private long createTime = System.currentTimeMillis();//创建时间
	private String creatorName;
	private String updater;
	private Long updatetime = System.currentTimeMillis();
	private String updaterName;
	private int del = 0;//默认是未删除
	
	//---unuse
	private String resultconfig;//结果显示设置 json格式，statistics记录是否显示统计、personoption记录是否显示个人选择，1都为显示、0都为不显示
	
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
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
	/**
	 * 投票
	 */
	public static int VOTE = 0;
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCoverPath() {
		return coverPath;
	}
	public void setCoverPath(String coverPath) {
		this.coverPath = coverPath;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public long getStartTime() {
		return startTime;
	}
	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}
	public long getEndTime() {
		return endTime;
	}
	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public String getLabels() {
		return labels;
	}
	public void setLabels(String labels) {
		this.labels = labels;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getHasNotified() {
		return hasNotified;
	}
	public void setHasNotified(int hasNotified) {
		this.hasNotified = hasNotified;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	public int getAllowAnonymous() {
		return allowAnonymous;
	}
	public void setAllowAnonymous(int allowAnonymous) {
		this.allowAnonymous = allowAnonymous;
	}
	public int getAllowUnLogin() {
		return allowUnLogin;
	}
	public void setAllowUnLogin(int allowUnLogin) {
		this.allowUnLogin = allowUnLogin;
	}
	public int getIsrelease()
	{
		return isrelease;
	}
	public void setIsrelease(int isrelease)
	{
		this.isrelease = isrelease;
	}
	public int getVoteNum() {
		return voteNum;
	}
	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}
	public long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}
	public long getWeight() {
		return weight;
	}
	public void setWeight(long weight) {
		this.weight = weight;
	}
	public String getResultconfig() {
		return resultconfig;
	}
	public void setResultconfig(String resultconfig) {
		this.resultconfig = resultconfig;
	}
	
	public int getShowresult()
	{
		return showresult;
	}
	public void setShowresult(int showresult)
	{
		this.showresult = showresult;
	}
	
	public String getRootpaths() {
		return rootpaths;
	}
	public void setRootpaths(String rootpaths) {
		this.rootpaths = rootpaths;
	}
	public String getVoteId() {
		return voteId;
	}
	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public String getVoteName() {
		return voteName;
	}
	public void setVoteName(String voteName) {
		this.voteName = voteName;
	}
	public int getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(int isOpen) {
		this.isOpen = isOpen;
	}
	public int getIsNotify() {
		return isNotify;
	}
	public void setIsNotify(int isNotify) {
		this.isNotify = isNotify;
	}
	
	@Override
	public String toString() {
		return String.format(
				"VoteActivityEntity [id=%s, title=%s, coverPath=%s, fileId=%s, summary=%s, author=%s, startTime=%s, endTime=%s, weight=%s, labels=%s, showresult=%s, isrelease=%s, voteNum=%s, rootpaths=%s, voteId=%s, voteName=%s, isOpen=%s, isNotify=%s, allowAnonymous=%s, allowUnLogin=%s, hasNotified=%s, domain=%s, creator=%s, createTime=%s, creatorName=%s, updater=%s, updatetime=%s, updaterName=%s, del=%s, resultconfig=%s]",
				id, title, coverPath, fileId, summary, author, startTime, endTime, weight, labels, showresult,
				isrelease, voteNum, rootpaths, voteId, voteName, isOpen, isNotify, allowAnonymous, allowUnLogin,
				hasNotified, domain, creator, createTime, creatorName, updater, updatetime, updaterName, del,
				resultconfig);
	}
	
}
