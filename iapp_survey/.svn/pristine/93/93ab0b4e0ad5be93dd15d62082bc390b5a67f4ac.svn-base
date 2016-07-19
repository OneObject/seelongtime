package com.longtime.app.base.model;

import com.longtime.common.model.BaseModel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "base_praise")
public class Praise extends BaseModel<String> {

	private static final long serialVersionUID = 2909270629762656504L;

	@Id
	private String id; // restype_resid
	
	@Column(length = 36)
	private String resid; //被评论资源ID
	
	private Integer restype; //被评论资源类型
	
	private long total = 0;
	
	@Column(length = 36)
	private String domain;

	private String creator; //更新的人的ID
	
	private Long createtime;

	private String updater; //更新的人的ID
 
	private Long updatetime; //更新的时间
	
	private int type;//0赞 1踩

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
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


	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Override
	public String toString() {
		return String.format("Praise [id=%s, resid=%s, restype=%s, total=%s, creator=%s, createtime=%s, updater=%s, updatetime=%s]",
			id,
			resid,
			restype,
			total,
			creator,
			createtime,
			updater,
			updatetime);
	}
}
