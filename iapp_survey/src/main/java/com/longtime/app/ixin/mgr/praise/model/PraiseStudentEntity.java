package com.longtime.app.ixin.mgr.praise.model;

public class PraiseStudentEntity {
	private Long id;

	private String resid; // 被评论资源ID

	private Integer restype = RESTYPE_COURSE;

	private String domain; // 资源所属域

	private String uid;

	private String uname;

	private int cancel = 0; // 是否取消 0 否 1是

	private int utype;// 赞人类型

	private String creator;

	private String updater;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public Integer getRestype() {
		return restype;
	}

	public void setRestype(Integer restype) {
		this.restype = restype;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getCancel() {
		return cancel;
	}

	public void setCancel(int cancel) {
		this.cancel = cancel;
	}

	public int getUtype() {
		return utype;
	}

	public void setUtype(int utype) {
		this.utype = utype;
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

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	public Long getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Long updatetime) {
		this.updatetime = updatetime;
	}

	private Long createtime = System.currentTimeMillis();

	private Long updatetime = 0L;

	public static final int CANCEL_YES = 1;

	public static final int CANCEL_NO = 0;

	public static final int RESTYPE_COURSE = 1;// 课程

	public static final int RESTYPE_TOPIC = 2;// 话题

	public static int UTYPE_COMMON = 0; // 普通用户

	public static int UTYPE_YK = 1;// 游客

}
