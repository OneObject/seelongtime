package com.longtime.ajy.mweb.model;

import com.longtime.common.model.Entity;



public class UserVoteEntity implements Entity<String> {

	private static final long serialVersionUID = -6871075928024622029L;
	
	private String id;
	private String activityId;//
	private String voteId;//
	private long timestamp = System.currentTimeMillis();
	private String base_uid; //
	private int isAnonymous = 0; //是否匿名提交
	private int isDel = 0;
	
	/**unuse**/
	private String userId; //
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getVoteId() {
		return voteId;
	}

	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public String getBase_uid() {
		return base_uid;
	}

	public void setBase_uid(String base_uid) {
		this.base_uid = base_uid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getIsAnonymous() {
		return isAnonymous;
	}

	public void setIsAnonymous(int isAnonymous) {
		this.isAnonymous = isAnonymous;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	@Override
	public String toString() {
		return String.format(
				"UserVoteEntity [id=%s, activityId=%s, voteId=%s, timestamp=%s, base_uid=%s, isAnonymous=%s, isDel=%s, userId=%s]",
				id, activityId, voteId, timestamp, base_uid, isAnonymous, isDel, userId);
	}
}
