/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-4 - 下午2:03:46
 */
package com.longtime.app.ixin.mgr.vote.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.longtime.common.model.BaseModel;

/**
 * @since 2013-9-4
 * @author yangwk
 * 
 */
@Entity
@Table(name = "ixin_vote_queue")
public class VoteQueueModel extends BaseModel<String>{
	
	private static final long serialVersionUID = 8672654778107035714L;

	@Id
	@Column(length = 36)
	private String id;
	
	private String vote_activity_id; //调研活动id
		
	private int status = STATUS_TO_CREATE; //调研活动生成状态
	
	
	/**
	 * 已经生成
	 */
	public static int STATUS_COMPLETE = 1;
	
	/**
	 * 生成json文件
	 */
	public static int STATUS_TO_CREATE = 0;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVote_activity_id() {
		return vote_activity_id;
	}

	public void setVote_activity_id(String vote_activity_id) {
		this.vote_activity_id = vote_activity_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return String.format("VoteQueueModel [id=%s, vote_activity_id=%s, status=%s]", id, vote_activity_id, status);
	}
	
}
