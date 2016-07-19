package com.longtime.app.oplog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "iapp_op_log")
public class OpLog extends BaseModel<String>{

	private static final long serialVersionUID = -823264668106298653L;
	
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(length = 36)
	private String id;
	
	private String sid; //用户、组织ID
	
	private int type; //-1同步失败 0用户 1组织
	
	private int action; //0增1删2改3禁用4邀请关注
	
	private int sync = 0; //0未同步 1已同步
	
	@Column(name="failnum",columnDefinition="int default 0")
	private int failnum;//同步失败次数
	
	private String domain; //域
	
	private String remark; //备注
	
	private Long createtime;//创建时间
	
	public static int TYPE_USER = 0;//用户
	public static int TYPE_ORG = 1;//组织
	
	public static int ACTION_ADD = 0;//增
	public static int ACTION_DEL = 1;//删
	public static int ACTION_UPDATE = 2;//改
	public static int ACTION_DISABLE = 3;//禁用
	public static int ACTION_INVITE = 4;//邀请关注
	
	public static int SYNC_NO = 0;//未同步
	public static int SYNC_YES = 1;//已同步
	public static int SYNC_FAIL = -1;//同步失败
	
	
	@Override
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}

	public int getSync() {
		return sync;
	}

	public void setSync(int sync) {
		this.sync = sync;
	}

	public int getFailnum() {
		return failnum;
	}

	public void setFailnum(int failnum) {
		this.failnum = failnum;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Long createtime) {
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return String
				.format("OpLog [id=%s, sid=%s, type=%s, action=%s, sync=%s, failnum=%s, domain=%s, remark=%s, createtime=%s]",
						id, sid, type, action, sync, failnum, domain, remark,
						createtime);
	}
	
}
