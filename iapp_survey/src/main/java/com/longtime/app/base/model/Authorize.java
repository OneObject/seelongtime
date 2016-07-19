/**
 * project : iapp
 * user created : yangwk
 * date created : 2013-9-16 - 下午1:48:37
 */
package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

/**
 * @since 2013-12-02
 * @author liuxl
 * 
 */
@Entity
@Table(name="iapp_base_authorize")
public class Authorize extends BaseModel<String>{

	private static final long serialVersionUID = 5184474951397094145L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 36)
    private String id;

    /** 商户 */
    private String domain;
    
	private Integer rcategory; //被授权对象类型 1 调研活动

	private String rid; //被授权对象id，如：调研活动等
	
	private Integer scategory; //授权类型 1 用户 2 组织 3域4职级5用户组

	private String sid; //授权对象的id type=0：用户id type=1：组织id等等
	
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
	 * 调研活动对象类型
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public Integer getRcategory() {
        return rcategory;
    }

    public void setRcategory(Integer rcategory) {
        this.rcategory = rcategory;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Integer getScategory() {
        return scategory;
    }

    public void setScategory(Integer scategory) {
        this.scategory = scategory;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

}
