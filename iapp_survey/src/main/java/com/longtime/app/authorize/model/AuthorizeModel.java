/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午1:48:37
 */
package com.longtime.app.authorize.model;

import com.myctu.platform.repository.engine.domain.BaseEntity;

/**
 * @since 2013-9-16
 * @author yangwk
 * 
 */
public class AuthorizeModel extends BaseEntity<String>{

	private static final long serialVersionUID = 5184474951397094145L;

	private String id; //主键

	private String sid; //被授权对象id，如：考试、课程等

	private String rid; //授权对象的id type=0：用户id type=1：组织id等等
	
	private String rname; //授权对象的名称

	private Integer type; //授权类型 0 用户授权 1 组织授权
	
	private Integer category; //授权对象类型 1 考试
	
	
	/**
	 * 用户授权
	 */
	public static int TYPE_USER = 0;
	
	/**
	 * 组织授权
	 */
	public static int TYPE_ORG = 1;
	

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

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}
	
}
