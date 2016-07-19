package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;


@Entity
@Table(name = "iapp_base_role_per_union",schema="")
public class RolePerUnion  extends BaseModel<String> {
	private static final long serialVersionUID = 1366686264865935922L;
	
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	@Column(length = 40)
	private String id;
	
	/** 角色id */
	@Column(name="role_id")
	private String roleId;

    /** 权限id */
	@Column(name="per_id")
	private String perId; 
	
	/** 权限深度 */
	@Column(name="depth")
	private String depth; 

    /** 商户 */
    private String domain;

    /** 备注 */
	@Column(name="remark")
	private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getPerId() {
        return perId;
    }

    public void setPerId(String perId) {
        this.perId = perId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    } 
	
	
}
