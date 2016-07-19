package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;


public class Praise extends BaseEntity<String> {

	private static final long serialVersionUID = 2909270629762656504L;

	private String id; // restpe_resid
	
	private String resid; //被评论资源ID
	
	private Integer restype=RESTYPE_COURSE; //被评论资源类型
	
	private long total = 0;
	
	private String domain;
	
	private int type = 0;//0赞 1踩
    
	public static final int RESTYPE_COURSE=1;
	public static final int RESTYPE_TOPIC=2; //话题
	public static final int RESTYPE_ANSWER=3; //问题的回答
	public static final int RESTYPE_QUESTION=4; //问题

	public static final int TYPE_PRAISE = 0;
	public static final int TYPE_UNPRAISE = 1;


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

	public void setId(String id) {
		this.id = id;
	}

    public long getTotal() {
        return total;
    }
    
	public void setTotal(long total) {
        this.total = total;
    }

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
    public String getDomain() {
        return domain;
    }

    
    public void setDomain(String domain) {
        this.domain = domain;
    }

    @Override
    public String toString() {
        return String.format("Praise [id=%s, resid=%s, restype=%s, total=%s, domain=%s]", id, resid, restype, total,
                             domain);
    }

    @Override
    public String getId() {
        return id;
    }
}
