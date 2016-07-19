package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

public class PraiseHistory extends BaseEntity<Long> {

	private static final long serialVersionUID = 2909270629762656504L;

	private Long id;
	
	private String resid; //被评论资源ID
	
	private Integer restype=RESTYPE_COURSE; 
	
	private int type; //0 赞 1踩
	
	private String domain; //资源所属域
	
	private String uid;
	
	private String uname;
	
	private int cancel = CANCEL_NO; //是否取消  0 否  1是
	
	private int utype;//赞人类型
	
	
	public static final int CANCEL_YES=1;
	
	public static final int CANCEL_NO=0;
	
	public static final int RESTYPE_COURSE=1;//课程
	
	public static final int RESTYPE_TOPIC=2;//话题
	
	public static final int RESTYPE_ANSWER=3; //问题的回答
	public static final int RESTYPE_QUESTION=4; //问题
	
    public static int UTYPE_COMMON=0; //普通用户
	
	public static int UTYPE_YK=1;//游客 

	@Override
	public Long getId() {
		return this.id;
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

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
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

	public void setId(Long id) {
		this.id = id;
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

	
    public String getDomain() {
        return domain;
    }

    
    public void setDomain(String domain) {
        this.domain = domain;
    }
    
    
    public int getUtype() {
		return utype;
	}

	public void setUtype(int utype) {
		this.utype = utype;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return String
				.format("PraiseHistory [id=%s, resid=%s, restype=%s, type=%s, domain=%s, uid=%s, uname=%s, cancel=%s, utype=%s]",
						id, resid, restype, type, domain, uid, uname, cancel,
						utype);
	}

      
    
}
