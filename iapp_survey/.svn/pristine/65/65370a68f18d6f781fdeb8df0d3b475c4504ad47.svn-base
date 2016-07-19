/**
 * project : portal-demo
 * user created : songsp
 * date created : 2012-9-28 - 下午4:55:44
 */
package com.longtime.demo.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.longtime.common.model.BaseModel;

/**
 * @since 2012-9-28
 * @author songsp
 */
@Entity
@Table(name = "demo_org")
public class DemoOrg extends BaseModel<Long>{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1974859798174506198L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String name;

	@OneToMany(mappedBy="org")
	private List<DemoUser> users;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<DemoUser> getUsers() {
		return users;
	}

	public void setUsers(List<DemoUser> users) {
		this.users = users;
	}

}
