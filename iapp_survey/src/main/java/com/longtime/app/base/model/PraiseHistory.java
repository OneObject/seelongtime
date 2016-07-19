package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "base_praise_history")
public class PraiseHistory extends BaseModel<Long> {

	private static final long serialVersionUID = 2909270629762656504L;

	@Id
	@GenericGenerator(name = "idGenerator", strategy = "identity")
	@GeneratedValue(generator = "idGenerator")
	private Long id;
	
	@Column(length = 36)
	private String resid; //被评论资源ID
	
	private Integer restype; //被评论资源类型
	
	@Column(length = 36)
	private String domain; //资源所属域
	
	@Column(length = 36)
	private String uid;
	
	private String uname;
	
	private int cancel = 0; //是否取消  0 否  1是
	
	
	
	private String creator; //更新的人的ID
	
	private Long createtime;

	private String updater; //更新的人的ID
 
	private Long updatetime; //更新的时间
	

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

	@Override
	public String toString() {
		return String.format("PraiseHistory [id=%s, resid=%s, restype=%s, uid=%s, uname=%s, cancel=%s, domain=%s, creator=%s, createtime=%s, updater=%s, updatetime=%s]",
			id,
			resid,
			restype,
			uid,
			uname,
			cancel,
			domain,
			creator,
			createtime,
			updater,
			updatetime);
	}
}
