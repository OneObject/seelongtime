package com.longtime.app.base.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "iapp_base_userrole",schema="")
public class UserRole extends BaseModel<String> {
	
	private static final long serialVersionUID = 2575427946327170845L;

	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	@Column(length = 40)
	private String id;			//id
	
	@OneToOne
    @JoinColumn(name = "user_id")
	private User userId;		//用户id
	
	@OneToOne
    @JoinColumn(name = "role_id")
	private Role roleId;		//角色id
	
	/**
	 * 关联表，不建议使用标记删除，直接删除
	 */
	@Column(name="isdel")
	private int isdel;	//删除标记：0，未删除，1，已删除

	public String getId() {
		return id;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public Role getRoleId() {
		return roleId;
	}

	public void setRoleId(Role roleId) {
		this.roleId = roleId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

}
