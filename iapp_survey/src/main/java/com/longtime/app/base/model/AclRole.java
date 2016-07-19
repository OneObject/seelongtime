package com.longtime.app.base.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.longtime.common.model.BaseModel;

@Entity
@Table(name = "acl_role")
public class AclRole extends BaseModel<Long>  {
	private static final long serialVersionUID = 2909270629762656504L;

	@Id
	@GenericGenerator(name = "idGenerator", strategy = "identity")
	@GeneratedValue(generator = "idGenerator")
	private Long id;
	
	private String name;
	
	private String domain;

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

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	
	
	
}
