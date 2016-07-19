package com.longtime.ajy.mweb.model;

import com.longtime.common.model.BaseEntity;

public class TaskUser extends BaseEntity<String> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4348615721365440960L;

	private String uid;
	

	private String taskid;

	private String taskname;

	private int status = STATUS_NOT_INFORM;// 作业状态 0未提交，1 待审核，2未通过 ，3通过

	private String content;// 内容

	private int attachment = ATTACHMENT_NO;// 是否有附件 0 没有，1 有

	private float score;// 得分

	private String comment;

	private String domain;
	
	private long begintime;
	
	private long endtime;
	
	private String attachmenturl;//附件地址

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	private int isdel = ISDEL_NO;

	public static final int ISDEL_NO = 0;

	public static final int ISDEL_YES = 1;

	public static final int STATUS_NOT_INFORM = 0;

	public static final int STATUS_WAIT = 1;

	public static final int STATUS_NOT_PASS = 2;

	public static final int STATUS_PASS = 3;

	public static final int ATTACHMENT_NO = 0;

	public static final int ATTACHMENT_YES = 1;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getTaskid() {
		return taskid;
	}

	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getAttachment() {
		return attachment;
	}

	public void setAttachment(int attachment) {
		this.attachment = attachment;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	@Override
	public String getId() {
		return this.id;
	}
	
	

	public long getBegintime() {
		return begintime;
	}

	public void setBegintime(long begintime) {
		this.begintime = begintime;
	}

	public long getEndtime() {
		return endtime;
	}

	public void setEndtime(long endtime) {
		this.endtime = endtime;
	}

	@Override
	public void setId(String id) {
          this.id=id;
	}

	public String getAttachmenturl() {
		return attachmenturl;
	}

	public void setAttachmenturl(String attachmenturl) {
		this.attachmenturl = attachmenturl;
	}

	@Override
	public String toString() {
		return String.format("TaskUser [uid=%s, taskid=%s, taskname=%s, status=%s, content=%s, attachment=%s, score=%s, comment=%s, domain=%s, begintime=%s, endtime=%s, attachmenturl=%s, isdel=%s]",
			uid,
			taskid,
			taskname,
			status,
			content,
			attachment,
			score,
			comment,
			domain,
			begintime,
			endtime,
			attachmenturl,
			isdel);
	}


}
