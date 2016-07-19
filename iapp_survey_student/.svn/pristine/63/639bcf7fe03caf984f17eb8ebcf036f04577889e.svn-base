/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午1:48:37
 */
package com.longtime.ajy.model;

import com.longtime.common.model.BaseEntity;

/**
 * 对应授权视图展开信息
 * @since 2013-9-16
 * @author yangwk
 * 
 */
public class Authorize extends BaseEntity<String>{

	private static final long serialVersionUID = -8831869221872900849L;

	/** 商户 */
    private String domain;
    
	private Integer rcategory; //被授权对象类型 1 考试，2课程

	private String rid; //被授权对象id，如：考试、课程等
	
	private Integer scategory; //授权类型 1 用户 2 组织

	private String uid; //授权对象的id 授权展开视图内的uid
	
	//private String sid;//授权对象的id  用户 ，组织 ，职级，用户组
	
	//private String id;
	
	/**
	 * 用户授权
	 */
	public static int S_CATEGORY_USER = 1;
	
	/**
	 * 组织授权
	 */
	public static int S_CATEGORY_ORG = 2;
	/**
	 * 域授权
	 */
	public static int S_CATEGORY_DOMAIN=3;
	/**
	 * 职级授权
	 */
	public static int S_CATEGORY_JOBLEVEL=4;
	/**
	 * 用户组授权
	 */
	public static int S_CATEGORY_GROUP=5;
	
	
	
	/**
	 * 调研对象类型
	 */
	public static int R_CATEGORY_VOTE_ACTIVITY = 1;
	
	/**
	 * 课程对象类型
	 */
	public static int R_CATEGORY_COURSE = 2;
	
	/**
	 * 活动对象类型
	 */
	public static int R_CATEGORY_ACTIVITY = 3;
	/**
	 * 作业对象类型
	 */
	public static int R_CATEGORY_TASK=4;
	/**
	 * 扩展资源
	 */
	public static int R_EXT_RESOURCE=8;

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Integer getRcategory() {
		return rcategory;
	}

	public void setRcategory(Integer rcategory) {
		this.rcategory = rcategory;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public Integer getScategory() {
		return scategory;
	}

	public void setScategory(Integer scategory) {
		this.scategory = scategory;
	}
   
	
	

//	public String getSid() {
//		return sid;
//	}
//
//	public void setSid(String sid) {
//		this.sid = sid;
//	}
    
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String getId() {
		return this.id;
	}
    
	@Override
	public void setId(String id) {
	}
	
	
	
	
	
}
