package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "base_comment")
public class Comment extends BaseModel<Long> {

	private static final long serialVersionUID = 2909270629762656504L;

	@Id
	@GenericGenerator(name = "idGenerator", strategy = "identity")
	@GeneratedValue(generator = "idGenerator")
	private Long id;
	
	@Column(length = 36)
	private String resid; //被评论资源ID
	
	private Integer restype; //被评论资源类型
	
	@Column(length = 36)
	private String uid; //评论人ID
	
	private String uname;//评论人姓名
	 
	@Column(length = 36)
	private String touid; //被评论人的ID
	
	private String touname; //被评论人的姓名
	
	@Column(columnDefinition="text")
	private String header; //对评论进行评论时原评论截取内容
	
	@Column(length = 4000)
	private String body; //评论内容
	
	private Integer action; //操作类型，评论，评论评论
	
	private String pid;// 父id
	
	private String domain;

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

	public String getTouid() {
		return touid;
	}

	public void setTouid(String touid) {
		this.touid = touid;
	}

	public String getTouname() {
		return touname;
	}

	public void setTouname(String touname) {
		this.touname = touname;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Integer getAction() {
		return action;
	}

	public void setAction(Integer action) {
		this.action = action;
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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	@Override
	public String toString() {
		return String.format("Comment [id=%s, resid=%s, restype=%s, uid=%s, uname=%s, touid=%s, touname=%s, header=%s, body=%s, action=%s, pid=%s, domain=%s, creator=%s, createtime=%s, updater=%s, updatetime=%s]",
			id,
			resid,
			restype,
			uid,
			uname,
			touid,
			touname,
			header,
			body,
			action,
			pid,
			domain,
			creator,
			createtime,
			updater,
			updatetime);
	}
}
