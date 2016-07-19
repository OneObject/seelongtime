package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;
/**
 * 用户组过滤规则表
 * @author fangxinyuan
 *
 */
@Entity
@Table(name="iapp_group_rule")
public class BaseGroupRule extends BaseModel<String> {
	
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
	
	private int type;//0 用户 1 组织 2 职级
	
	private String property;//过滤条件属性值
	
	private int operation;//0等于 1大于2小于3between 4like 5in
	
	@Column(name="value",length=3000)
	private String value;//过滤条件的值
	
	private String domain;//域
	
	public  static int USER_TYPE=0;
	
	public static int ORG_TYPE=1;
	
	public static int JOBLEVEL_TYPE=2;
	
	public static int EQUAL_OPERATION=0;
	
	public static int GREATER_OPERATION=1;
	
	public static int LESS_OPERATION=2;
	
	public static int BETWEEN_OPERATION=3;
	
	public static int LIKE_OPERATION=4;
	
	public static int IN_OPERATION=5;
	
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public int getOperation() {
		return operation;
	}

	public void setOperation(int operation) {
		this.operation = operation;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
}
