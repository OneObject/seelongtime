package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;
/**
 * 用户组关联表
 * @author fangxinyuan
 *
 */
@Entity
@Table(name="iapp_group_relation")
public class BaseGroupRelation extends BaseModel<String> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 36)
    private String id;
	
	private String gid;//用户组id
	
	private String rid;//关联内容id
	
	private int  type;//关联内容类型
	
	private String domain;//域
	
	public static int ORG_TYPE=1;
	
	public static int USER_TYPE=0;
	
	public static int JOBLEVEL_TYPE=2;
	
	public static int RULE_TYPE=3;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
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
}
