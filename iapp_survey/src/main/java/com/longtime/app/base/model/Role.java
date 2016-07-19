package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "iapp_base_role",schema="")
public class Role extends BaseModel<String> {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	@Column(length = 40)
	private String id;
	
	@Column(name="role_name")
	private String name;
	
	@Column(name="role_code")
	private String code;
	
	@Column(name="creator")
	private String creator;
	
	@Column(name="isdel")
	private int isdel;
    
    /** 商户 */
    private String domain;
	
	@Column(name="remark")
	private String remark;

	@Column(name="system_type")
	private int isSystemType ;//系统类型初始化数据为true 不能删除
	
	@Column(name="lastModify_date")
	private long updateDate;
	
	@Column(name="create_date")
	private long createDate;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public int getIsSystemType() {
		return isSystemType;
	}

	public void setIsSystemType(int isSystemType) {
		this.isSystemType = isSystemType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public long getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(long updateDate) {
		this.updateDate = updateDate;
	}

	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }
	
}
